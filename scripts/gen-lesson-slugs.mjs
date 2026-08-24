#!/usr/bin/env node
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const root = path.join(path.dirname(fileURLToPath(import.meta.url)), '..');
const catalog = JSON.parse(
  fs.readFileSync(
    path.join(root, '../lingola-backend/src/data/lesson-catalog.json'),
    'utf8',
  ),
);

const by = {};
for (const row of catalog) {
  const id = row.cefrLevel.toLowerCase();
  (by[id] ??= []).push(row.slug);
}

const levels = ['a1', 'a2', 'b1', 'b2', 'c1', 'c2'];
let body = '  static const slugsByLevel = <String, List<String>>{\n';
for (const id of levels) {
  body += `    '${id}': <String>[\n`;
  for (const slug of by[id] ?? []) {
    body += `      '${slug}',\n`;
  }
  body += '    ],\n';
}
body += `  };

  static String? slugAt(String levelId, int index) {
    final list = slugsByLevel[levelId];
    if (list == null || index < 0 || index >= list.length) return null;
    return list[index];
  }
`;

const target = path.join(root, 'lib/features/lesson/lesson_curriculum.dart');
const src = fs.readFileSync(target, 'utf8');
const marker = '  static final levels = <LessonLevelData>[';
if (!src.includes(marker)) {
  throw new Error('lesson_curriculum.dart marker not found');
}
if (src.includes('static const slugsByLevel')) {
  const next = src.replace(
    /  static const slugsByLevel[\s\S]*?return list\[index\];\n  \}\n\n/,
    `${body}\n\n`,
  );
  fs.writeFileSync(target, next);
} else {
  fs.writeFileSync(
    target,
    src.replace(marker, `${body}\n\n${marker}`),
  );
}
console.log('Updated lesson_curriculum.dart with', catalog.length, 'slugs');
