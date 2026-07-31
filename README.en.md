# 📖 Free & Offline English–Vietnamese Dictionary Database (SQLite)

[Tiếng Việt](README.md) | **English**

**Offline and Free English-Vietnamese dictionary database** featuring 104,554 English words (plus 175 Vietnamese words) and 158,044 detailed definitions. Specially optimized with **100% example sentence coverage and 100% IPA coverage**, an ultra-lightweight size of about 42.1 MB, and requires zero internet connection.

The perfect solution for vocabulary learning apps (flashcards), Natural Language Processing (NLP) projects, AI training, and mobile/web app integration.

![SQLite](https://img.shields.io/badge/SQLite-Database-blue)
![Words](https://img.shields.io/badge/Words-104k+-green)
![Definitions](https://img.shields.io/badge/Definitions-158k+-orange)
![IPA](https://img.shields.io/badge/IPA-100%25-green)
![Examples](https://img.shields.io/badge/Examples-175.6k+-purple)
![License](https://img.shields.io/badge/License-CC%20BY--SA%204.0-blue)

> [!IMPORTANT]
> **Core Difference:** This version is fully enriched with **175,641 standard example sentences** for ALL definitions (including 18,636 fragment examples upgraded to complete, exact-headword sentences), corrects numerous entries, and resolves IPA errors as well as missing IPA pronunciations. Additionally, we optimized the SQLite file size to just about 42.1 MB.

---

## ✨ Key Features

- 📚 **104,554 English words** with full Vietnamese definitions.
- 🔤 **158,044 accurate Vietnamese definitions**.
- 🔊 **108,671 IPA pronunciations** on all words (100% IPA coverage).
- 💬 **175,641 example sentences** (100% coverage - every definition has at least one complete example sentence with exact headword).
- 🚀 **Ultra-lightweight (42.1 MB)**: Easy to embed into mobile applications.
- 📦 **Zero dependencies**: Compatible with any programming language (Python, Node.js, C#, Java, Flutter...).
- 🔓 **100% Offline**: No API calls or internet required.
- ✅ **Production-ready**: Spell-checked, validated, deduplicated, and free of invalid entries or orphaned definitions.

## 📊 Data Statistics

- **Word-Definition Pairs:** 175,641
- **Example Sentences:** 175,641 (100% coverage)
- **IPA Pronunciations:** 108,671 (100% coverage, 0 missing records)
- **Database Size:** about 42.1 MB

> [!TIP]
> See [`stats.md`](stats.md) for detailed information on the data cleaning and optimization process.

## 💻 Use Cases

- 📖 **Offline Dictionaries** – Build dictionary apps without requiring internet access.
- 🎓 **Language Learning Tools** – Flashcard apps, Spaced Repetition Systems (SRS), quizzes.
- 🤖 **NLP & AI** – Machine learning training data, translation models, model evaluation.
- 👨‍💻 **Software Integration** – Text editor plugins, browser extensions, automation scripts.

## 📚 Data Source & Attribution

Built upon the original **[MinhQND Dictionary](https://github.com/minhqnd/dictionary)** (CC BY-SA 4.0), with powerful enhancements:

- Added and upgraded learner-friendly example sentences (100% coverage, 18,636 fragment examples replaced with complete exact-headword sentences).
- Standardized and added IPA pronunciations.
- Used **[OVDP](https://sourceforge.net/projects/ovdp/)** to fix over 15,000 corrupted English entries.
- Added over 1,350 of the most common English idioms and over 3000 phrasal verbs with natural Vietnamese translations, examples, and Oxford IPA.
- Data cleanup: removed many invalid words and associated orphaned definitions. Standardized and backfilled all missing English IPA pronunciations.

**Original references:** MinhQND Dictionary, Wiktionary, vntk/dictionary, Hồ Ngọc Đức's Vietnamese Dictionary, WikDict.
See [`ATTRIBUTION.md`](ATTRIBUTION.md) for full licensing details.

## 🚀 Download

Simply download the `dictionary_en_vi.db` database file from the repository.

```bash
# Install sqlite3 if you don't have it
# macOS: brew install sqlite
# Ubuntu/Debian: sudo apt-get install sqlite3
# Windows: Download from https://www.sqlite.org/download.html

sqlite3 dictionary_en_vi.db
```

## 🛠️ Usage Examples (SQL Queries)

<details>
<summary><b>1. Basic Word Lookup</b></summary>

```sql
-- Get all definitions for a word
SELECT d.definition, d.pos, d.sub_pos, wd.example
FROM words w
JOIN word_definitions wd ON w.id = wd.word_id
JOIN definitions d ON wd.definition_id = d.id
WHERE w.word = 'hello'
ORDER BY d.pos;
```

</details>

<details>
<summary><b>2. Lookup with IPA and Examples</b></summary>

```sql
-- Get a word with its IPA pronunciation (UK, US) and example sentences
SELECT w.word, p.ipa, p.region, d.definition, d.pos, wd.example
FROM words w
LEFT JOIN pronunciations p ON w.id = p.word_id
JOIN word_definitions wd ON w.id = wd.word_id
JOIN definitions d ON wd.definition_id = d.id
WHERE w.word = 'run'
ORDER BY p.region, d.pos;
```

</details>

<details>
<summary><b>3. Prefix Search (Autocomplete)</b></summary>

```sql
-- Find words starting with 'un...'
SELECT DISTINCT w.word
FROM words w
WHERE w.word LIKE 'un%'
LIMIT 20;
```

</details>

<details>
<summary><b>4. Search Within Definitions</b></summary>

```sql
-- Find words containing the keyword 'animal' in their definition
SELECT w.word, d.definition, d.pos
FROM words w
JOIN word_definitions wd ON w.id = wd.word_id
JOIN definitions d ON wd.definition_id = d.id
WHERE d.definition LIKE '%animal%'
LIMIT 10;
```

</details>

## ❓ Frequently Asked Questions (FAQ)

- **Q: Can I use this for a commercial project?**  
  A: Yes, provided you comply with the CC BY-SA 4.0 license. You must give attribution (`ATTRIBUTION.md`) and any derivative data must be open-sourced under the same license.
- **Q: What is the database format?**  
  A: Standard SQLite 3 format, which runs on any library that supports SQLite (e.g., `sqlite3` in Python, Node.js, or Room in Android).

## 📄 License & Author

This database and repository are licensed under the **Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)**. Details [here](https://creativecommons.org/licenses/by-sa/4.0/).

**Author**: [Skypedia](skypediacode@gmail.com)

**📊 [View Statistics](stats.md) | 📄 [View Database Schema](schema.sql)**
