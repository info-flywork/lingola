#!/usr/bin/env node
/**
 * Translates assets/legal/tr/*.txt into all UI locales.
 * Usage: node scripts/translate-legal.mjs
 */
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const root = path.join(__dirname, '..');
const SRC = path.join(root, 'assets/legal/tr');
const DOCS = ['terms', 'privacy', 'cookies'];

const LOCALES = {
  en: 'English',
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

async function translateText(text, targetLang, docName) {
  const apiKey = process.env.OPENAI_API_KEY;
  if (!apiKey) throw new Error('OPENAI_API_KEY missing');

  const res = await fetch('https://api.openai.com/v1/chat/completions', {
    method: 'POST',
    headers: {
      Authorization: `Bearer ${apiKey}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      model: 'gpt-4o-mini',
      temperature: 0.1,
      messages: [
        {
          role: 'system',
          content: `You translate legal documents for the Lingola language-learning app from Turkish to ${targetLang}.
Return ONLY the translated plain text. Keep structure: headings, numbered lists, bullet points.
Keep brand name Lingola unchanged. Preserve line breaks between sections.`,
        },
        {
          role: 'user',
          content: `Translate this ${docName} document to ${targetLang}:\n\n${text}`,
        },
      ],
    }),
  });

  if (!res.ok) {
    throw new Error(`OpenAI ${res.status}: ${(await res.text()).slice(0, 300)}`);
  }
  const data = await res.json();
  return data.choices?.[0]?.message?.content?.trim() || '';
}

async function main() {
  // Turkish source copies
  const trOut = path.join(root, 'assets/legal/tr');
  fs.mkdirSync(trOut, { recursive: true });
  for (const doc of DOCS) {
    const src = path.join(SRC, `${doc}.txt`);
    if (!fs.existsSync(src)) throw new Error(`Missing ${src}`);
  }

  for (const [code, langName] of Object.entries(LOCALES)) {
    const dir = path.join(root, 'assets/legal', code);
    fs.mkdirSync(dir, { recursive: true });
    console.log(`\n=== ${code} ===`);
    for (const doc of DOCS) {
      process.stdout.write(`  ${doc}... `);
      const source = fs.readFileSync(path.join(SRC, `${doc}.txt`), 'utf8');
      const translated = await translateText(source, langName, doc);
      fs.writeFileSync(path.join(dir, `${doc}.txt`), `${translated}\n`);
      console.log('ok');
      await new Promise((r) => setTimeout(r, 400));
    }
  }
  console.log('\nDone.');
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
