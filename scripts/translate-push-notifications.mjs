#!/usr/bin/env node
/**
 * Copies pushNotifications from en.i18n.json into other locales via OpenAI.
 */
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const i18nDir = path.join(__dirname, '../lib/i18n');
const en = JSON.parse(fs.readFileSync(path.join(i18nDir, 'en.i18n.json'), 'utf8'));
const source = en.pushNotifications;

const LOCALES = {
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

loadEnv(path.join(__dirname, '../.env'));
loadEnv(path.join(__dirname, '../../lingola-backend/.env'));

async function translateBlock(langName) {
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
      temperature: 0.2,
      response_format: { type: 'json_object' },
      messages: [
        {
          role: 'system',
          content:
            `Translate push notification copy for Lingola language app to ${langName}. ` +
            'Return JSON with same structure: title, h2, h4, h8, h24 (arrays of 5 strings each). ' +
            'Keep brand Lingola. Tone: warm, never guilt-tripping. Emoji max 1 per tier (only h4 may have 👀). ' +
            'Night-friendly wording. No "you missed" or "you failed" language.',
        },
        {
          role: 'user',
          content: JSON.stringify(source, null, 2),
        },
      ],
    }),
  });

  if (!res.ok) throw new Error(`OpenAI ${res.status}: ${await res.text()}`);
  const data = await res.json();
  return JSON.parse(data.choices[0].message.content);
}

async function main() {
  for (const [code, lang] of Object.entries(LOCALES)) {
    const file = path.join(i18nDir, `${code}.i18n.json`);
    const json = JSON.parse(fs.readFileSync(file, 'utf8'));
    process.stdout.write(`${code}... `);
    json.pushNotifications = await translateBlock(lang);
    fs.writeFileSync(file, `${JSON.stringify(json, null, 2)}\n`);
    console.log('ok');
    await new Promise((r) => setTimeout(r, 400));
  }
  console.log('Done.');
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
