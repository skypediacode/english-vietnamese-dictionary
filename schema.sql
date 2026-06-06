-- English-Vietnamese Dictionary Database Schema
--
-- This file documents the database structure used in dictionary_en_vi.db
--
-- The database consists of 4 main tables:
-- - words: English words
-- - definitions: Vietnamese definitions
-- - word_definitions: Links between words and definitions
-- - pronunciations: IPA pronunciations for words
-- - sources: Metadata about data sources

-- ============================================================================
-- SOURCES TABLE
-- ============================================================================
-- Stores information about data sources

CREATE TABLE sources (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT UNIQUE NOT NULL
);

-- Example values: 'wiktionary', 'wikdict', 'community'


-- ============================================================================
-- WORDS TABLE
-- ============================================================================
-- Stores English words

CREATE TABLE words (
    id INTEGER PRIMARY KEY,
    word TEXT NOT NULL,
    source_id INTEGER DEFAULT 1,
    lang_code TEXT NOT NULL DEFAULT 'vi',
    FOREIGN KEY (source_id) REFERENCES sources(id)
);

-- Columns:
--   id: Unique identifier for the word
--   word: The English word (lowercase)
--   source_id: Reference to the source table
--   lang_code: Language code (default: 'vi' for Vietnamese target language)
--
-- Constraints:
--   UNIQUE INDEX on (word, lang_code) - ensures no duplicate entries

CREATE UNIQUE INDEX idx_words_unique ON words(word, lang_code);


-- ============================================================================
-- DEFINITIONS TABLE
-- ============================================================================
-- Stores Vietnamese definitions with grammatical information

CREATE TABLE definitions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    definition TEXT NOT NULL,
    pos TEXT,
    sub_pos TEXT,
    definition_lang TEXT DEFAULT 'vi',
    links TEXT,
    UNIQUE(definition, pos, sub_pos)
);

-- Columns:
--   id: Unique identifier for the definition
--   definition: The Vietnamese translation/definition
--   pos: Part of speech (noun, verb, adjective, etc.)
--   sub_pos: Subcategory of part of speech if applicable
--   definition_lang: Language code of the definition (default: 'vi' for Vietnamese)
--   links: Additional link data (JSON or text format)
--
-- Constraints:
--   UNIQUE on (definition, pos, sub_pos) - prevents duplicate definitions


-- ============================================================================
-- WORD_DEFINITIONS TABLE
-- ============================================================================
-- Maps words to definitions with example sentences

CREATE TABLE word_definitions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    word_id INTEGER NOT NULL,
    definition_id INTEGER NOT NULL,
    example TEXT,
    source_id INTEGER DEFAULT 1,
    FOREIGN KEY (word_id) REFERENCES words(id),
    FOREIGN KEY (definition_id) REFERENCES definitions(id)
);

-- Columns:
--   id: Unique identifier for the relationship
--   word_id: Reference to a word in the words table
--   definition_id: Reference to a definition in the definitions table
--   example: Example sentence using the word-definition pair
--   source_id: Reference to the source table
--
-- Indexes:
--   idx_word_definitions_word_id: For efficient word lookups
--   idx_word_definitions_definition_id: For efficient definition lookups
--   idx_word_definitions_source_id: For filtering by source

CREATE INDEX idx_word_definitions_word_id ON word_definitions(word_id);
CREATE INDEX idx_word_definitions_definition_id ON word_definitions(definition_id);
CREATE INDEX idx_word_definitions_source_id ON word_definitions(source_id);


-- ============================================================================
-- PRONUNCIATIONS TABLE
-- ============================================================================
-- Stores IPA pronunciations for words

CREATE TABLE pronunciations (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    word_id INTEGER NOT NULL,
    ipa TEXT NOT NULL,
    region TEXT,
    FOREIGN KEY (word_id) REFERENCES words(id)
);

-- Columns:
--   id: Unique identifier for the pronunciation
--   word_id: Reference to a word in the words table
--   ipa: IPA (International Phonetic Alphabet) transcription
--   region: Pronunciation region/dialect (e.g., 'US', 'UK', 'AUS')
--
-- Constraints:
--   UNIQUE on (word_id, ipa, region) - prevents duplicate pronunciations
--
-- Indexes:
--   idx_pronunciations_word_id: For efficient word lookups
--   idx_pronunciations_unique: Composite unique index

CREATE INDEX idx_pronunciations_word_id ON pronunciations(word_id);
CREATE UNIQUE INDEX idx_pronunciations_unique ON pronunciations(word_id, ipa, region);


-- ============================================================================
-- QUERY EXAMPLES
-- ============================================================================
--
-- 1. Get all definitions for a word:
--
--    SELECT d.definition, d.pos, d.sub_pos, wd.example
--    FROM words w
--    JOIN word_definitions wd ON w.id = wd.word_id
--    JOIN definitions d ON wd.definition_id = d.id
--    WHERE w.word = 'example'
--    ORDER BY d.pos;
--
--
-- 2. Get pronunciation for a word:
--
--    SELECT p.ipa, p.region
--    FROM words w
--    JOIN pronunciations p ON w.id = p.word_id
--    WHERE w.word = 'example';
--
--
-- 3. Get word with all information:
--
--    SELECT
--      w.word,
--      p.ipa,
--      p.region,
--      d.definition,
--      d.pos,
--      wd.example
--    FROM words w
--    LEFT JOIN pronunciations p ON w.id = p.word_id
--    JOIN word_definitions wd ON w.id = wd.word_id
--    JOIN definitions d ON wd.definition_id = d.id
--    WHERE w.word = 'example'
--    ORDER BY p.region, d.pos;
--
--
-- 4. Search words by prefix:
--
--    SELECT DISTINCT w.word
--    FROM words w
--    WHERE w.word LIKE 'un%'
--    LIMIT 20;
--
--
-- 5. Search definitions by keyword:
--
--    SELECT
--      w.word,
--      d.definition,
--      d.pos
--    FROM words w
--    JOIN word_definitions wd ON w.id = wd.word_id
--    JOIN definitions d ON wd.definition_id = d.id
--    WHERE d.definition LIKE '%animal%'
--    LIMIT 10;
--
