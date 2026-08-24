#!/usr/bin/env node
/**
 * Translates lib/i18n/en.i18n.json into all app UI locales via OpenAI.
 * Preserves placeholders ($value, $name, …) and brand names (Lingola, Google, Apple).
 *
 * Usage: node scripts/translate-i18n.mjs [locale...]
 * Example: node scripts/translate-i18n.mjs fr de
 */
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const root = path.join(__dirname, '..');

function loadEnv(file) {
  if (!fs.existsSync(file)) return;
  for (const line of fs.readFileSync(file, 'utf8').split('\n')) {
    const trimmed = line.trim();
    if (!trimmed || trimmed.startsWith('#')) continue;
    const i = trimmed.indexOf('=');
    if (i <= 0) continue;
    const key = trimmed.slice(0, i).trim();
    let val = trimmed.slice(i + 1).trim();
    if (
      (val.startsWith('"') && val.endsWith('"')) ||
      (val.startsWith("'") && val.endsWith("'"))
    ) {
      val = val.slice(1, -1);
    }
    if (!process.env[key]) process.env[key] = val;
  }
}

loadEnv(path.join(root, '.env'));
loadEnv(path.join(root, '../lingola-backend/.env'));

const I18N_DIR = path.join(root, 'lib/i18n');
const SOURCE = path.join(I18N_DIR, 'en.i18n.json');

const LOCALES = {
  tr: 'Turkish',
  de: 'German',
  fr: 'French',
  it: 'Italian',
  ja: 'Japanese',
  es: 'Spanish',
  ru: 'Russian',
  hi: 'Hindi',
  pt: 'Brazilian Portuguese',
  zh: 'Simplified Chinese',
};

const TOP_LEVEL_KEYS = [
  'app',
  'common',
  'onboarding',
  'targetLanguage',
  'language',
  'setup',
  'accountCreating',
  'previewChat',
  'paywall',
  'auth',
  'nav',
  'home',
  'libraryPage',
  'wordPracticePage',
  'quizPage',
  'placeholder',
  'tutorPage',
  'lessonPage',
  'rolePlayPage',
  'notificationsPage',
  'profilePage',
];

function loadJson(file) {
  return JSON.parse(fs.readFileSync(file, 'utf8'));
}

function saveJson(file, data) {
  fs.writeFileSync(file, `${JSON.stringify(data, null, 2)}\n`);
}

async function translateSection(sectionObj, targetLang, sectionName) {
  const apiKey = process.env.OPENAI_API_KEY;
  if (!apiKey) throw new Error('OPENAI_API_KEY missing in .env');

  const system = `You are a professional UI translator for the Lingola language-learning mobile app.
Translate ALL string values from English to ${targetLang}.
Return ONLY valid JSON (no markdown fences) with the EXACT same keys and nesting as the input.

Rules:
- Keep placeholders unchanged: $value, $current, $total, $count, $name, $tab, $heard, $prev, $now, $score, $xp, $level, $date
- Keep brand/product names: Lingola, Google, Apple, Premium, PREMIUM, VS, MON/TUE abbreviations can be localized if natural
- Keep escape sequences like \\$ exactly as in source (e.g. \\$30, \\$9.99)
- Keep proper names of tutors (Lingola, Elena, Kenji, Mei Lin, Kate, Sarah Williams, Jhon, Emrah, Kadıköy)
- Translate lesson titles and all user-visible UI text naturally for ${targetLang} learners
- Use informal-friendly tone suitable for a consumer app
- Section: ${sectionName}`;

  const user = JSON.stringify(sectionObj, null, 2);

  const res = await fetch('https://api.openai.com/v1/chat/completions', {
    method: 'POST',
    headers: {
      Authorization: `Bearer ${apiKey}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      model: 'gpt-4o-mini',
      temperature: 0.2,
      response_format: { type: 'json_object' },
      messages: [
        { role: 'system', content: system },
        {
          role: 'user',
          content: `Translate this JSON section to ${targetLang}:\n${user}`,
        },
      ],
    }),
  });

  if (!res.ok) {
    const errText = await res.text();
    throw new Error(`OpenAI ${res.status}: ${errText.slice(0, 400)}`);
  }

  const data = await res.json();
  const content = data.choices?.[0]?.message?.content;
  if (!content) throw new Error('Empty OpenAI response');

  let parsed;
  try {
    parsed = JSON.parse(content);
  } catch (e) {
    throw new Error(`Invalid JSON for ${sectionName}: ${content.slice(0, 200)}`);
  }
  return parsed;
}

async function translateLocale(localeCode, langName) {
  const source = loadJson(SOURCE);
  const out = {};
  const outFile = path.join(I18N_DIR, `${localeCode}.i18n.json`);

  console.log(`\n=== ${localeCode} (${langName}) ===`);

  for (const key of TOP_LEVEL_KEYS) {
    if (!(key in source)) continue;

    if (key === 'lessonPage') {
      const { levels, ...rest } = source.lessonPage;
      process.stdout.write('  lessonPage (core)... ');
      out.lessonPage = {
        ...(await translateSection(rest, langName, 'lessonPage')),
        levels: {},
      };
      console.log('ok');
      for (const levelId of Object.keys(levels || {})) {
        process.stdout.write(`  lessonPage.levels.${levelId}... `);
        out.lessonPage.levels[levelId] = await translateSection(
          levels[levelId],
          langName,
          `lessonPage.levels.${levelId}`,
        );
        console.log('ok');
        await new Promise((r) => setTimeout(r, 300));
      }
      continue;
    }

    process.stdout.write(`  ${key}... `);
    out[key] = await translateSection(source[key], langName, key);
    console.log('ok');
    await new Promise((r) => setTimeout(r, 300));
  }

  saveJson(outFile, out);
  console.log(`  saved ${outFile}`);
}

async function main() {
  const args = process.argv.slice(2);
  const targets = args.length
    ? args.filter((c) => LOCALES[c])
    : Object.keys(LOCALES);

  if (!targets.length) {
    console.error('No valid locales. Use:', Object.keys(LOCALES).join(', '));
    process.exit(1);
  }

  for (const code of targets) {
    await translateLocale(code, LOCALES[code]);
  }

  console.log('\nDone. Run: dart run slang');
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
