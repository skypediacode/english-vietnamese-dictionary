# 📖 Cơ sở dữ liệu Từ điển Anh–Việt (SQLite) Miễn Phí

**Cơ sở dữ liệu từ điển tiếng Anh – tiếng Việt ngoại tuyến (offline)** với 109,924 từ vựng và 162,124 định nghĩa chi tiết. Đặc biệt tối ưu với **100% định nghĩa có câu ví dụ**, kích thước siêu nhẹ chỉ 41 MB, không cần kết nối internet.

Giải pháp hoàn hảo cho các ứng dụng học từ vựng (flashcards), dự án xử lý ngôn ngữ tự nhiên (NLP), AI, và tích hợp mobile/web app.

![SQLite](https://img.shields.io/badge/SQLite-Database-blue)
![Words](https://img.shields.io/badge/Words-109.9k+-green)
![Definitions](https://img.shields.io/badge/Definitions-162.1k+-orange)
![IPA](https://img.shields.io/badge/IPA-71.1k+-informational)
![Examples](https://img.shields.io/badge/Examples-180.9k+-purple)
![License](https://img.shields.io/badge/License-CC%20BY--SA%204.0-blue)

> [!IMPORTANT]
> **Điểm khác biệt cốt lõi:** Phiên bản này đã bổ sung đầy đủ **180,000 câu ví dụ chuẩn** cho TẤT CẢ các định nghĩa, sửa lỗi các mục từ và lỗi IPA, đồng thời tối ưu giảm dung lượng từ 170MB xuống chỉ còn 41MB.

**Tác giả**: [Skypedia](skypediacode@gmail.com)

---

## ✨ Tính Năng Nổi Bật

- 📚 **109,924 từ tiếng Anh** với định nghĩa tiếng Việt đầy đủ.
- 🔤 **162,124 định nghĩa tiếng Việt** chính xác.
- 🔊 **71,051 phiên âm IPA** (độ bao phủ 64.6%).
- 💬 **180,928 câu ví dụ** (độ bao phủ 100% - mỗi định nghĩa đều có ít nhất 1 ví dụ).
- 🚀 **Siêu nhẹ chỉ 41 MB**: Dễ dàng nhúng vào các ứng dụng di động.
- 📦 **Không phụ thuộc**: Tương thích mọi ngôn ngữ (Python, Node.js, C#, Java, Flutter...).
- 🔓 **100% Ngoại tuyến (Offline)**: Không cần gọi API, không cần internet.
- ✅ **Chất lượng Production**: Đã qua bước kiểm tra chính tả, xác thực từ, loại bỏ rác và trùng lặp.

## 📊 Thống Kê Dữ Liệu

- **Cặp từ-định nghĩa:** 180,928
- **Câu ví dụ:** 180,928 (100% coverage)
- **Phiên âm IPA:** 71,051 (64.6% coverage)
- **Kích thước CSDL:** 41 MB (giảm 75% từ bản gốc 170 MB)

> [!TIP]
> Xem thêm tại [`stats.md`](stats.md) để biết chi tiết quá trình làm sạch dữ liệu và tối ưu hóa database.

## 💻 Trường Hợp Sử Dụng (Use Cases)

- 📖 **Từ điển Ngoại tuyến** – Xây dựng app tra từ không cần internet.
- 🎓 **Công cụ Học tiếng Anh** – App Flashcard, Spaced Repetition (SRS), bài tập trắc nghiệm.
- 🤖 **Xử lý ngôn ngữ tự nhiên (NLP) & AI** – Dữ liệu huấn luyện mô hình, dịch thuật, đánh giá model.
- 👨‍💻 **Tích hợp phần mềm** – Plugin cho text editor, extension trình duyệt, script tự động.

## 📚 Nguồn Dữ Liệu & Ghi Công

Dự án được xây dựng dựa trên bản gốc của **[Từ điển MinhQND](https://github.com/minhqnd/dictionary)** (CC BY-SA 4.0), kèm theo các nâng cấp mạnh mẽ:

- Bổ sung câu ví dụ thân thiện với người học (100% coverage, đã xác thực).
- Chuẩn hóa và thêm phiên âm IPA.
- Dùng **[OVDP](https://sourceforge.net/projects/ovdp/)** để sửa hơn 20,000 mục từ tiếng Anh bị lỗi.
- Dọn dẹp dữ liệu: Xóa 273,073 định nghĩa rác, chạy VACUUM giảm size một nửa.

**Nguồn tham khảo gốc:** Từ điển MinhQND, Wiktionary, vntk/dictionary, Từ điển Tiếng Việt Hồ Ngọc Đức, WikDict.
Xem [`ATTRIBUTION.md`](ATTRIBUTION.md) để đọc đầy đủ các giấy phép liên quan.

## 🚀 Tải Xuống

Chỉ cần tải xuống file cơ sở dữ liệu `dictionary_en_vi.db` trong repo.

```bash
# Cài đặt sqlite3 nếu máy bạn chưa có
# macOS: brew install sqlite
# Ubuntu/Debian: sudo apt-get install sqlite3
# Windows: Tải từ https://www.sqlite.org/download.html

sqlite3 dictionary_en_vi.db
```

## 🛠️ Ví Dụ Sử Dụng (Truy vấn SQL)

<details>
<summary><b>1. Tra Cứu Từ Cơ Bản</b></summary>

```sql
-- Lấy tất cả định nghĩa của một từ
SELECT d.definition, d.pos, d.sub_pos, wd.example
FROM words w
JOIN word_definitions wd ON w.id = wd.word_id
JOIN definitions d ON wd.definition_id = d.id
WHERE w.word = 'hello'
ORDER BY d.pos;
```

</details>

<details>
<summary><b>2. Tra Cứu Kèm Phát Âm IPA và Ví Dụ</b></summary>

```sql
-- Lấy từ cùng với phiên âm IPA (Anh-Anh, Anh-Mỹ) và câu ví dụ
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
<summary><b>3. Tìm Kiếm Theo Tiền Tố (Autocomplete)</b></summary>

```sql
-- Tìm từ bắt đầu bằng 'un...'
SELECT DISTINCT w.word
FROM words w
WHERE w.word LIKE 'un%'
LIMIT 20;
```

</details>

<details>
<summary><b>4. Tìm Kiếm Trong Nội Dung Định Nghĩa</b></summary>

```sql
-- Tìm các từ có chứa từ khóa 'animal' trong định nghĩa
SELECT w.word, d.definition, d.pos
FROM words w
JOIN word_definitions wd ON w.id = wd.word_id
JOIN definitions d ON wd.definition_id = d.id
WHERE d.definition LIKE '%animal%'
LIMIT 10;
```

</details>

## ❓ Câu Hỏi Thường Gặp (FAQ)

- **Q: Tôi có thể dùng cho dự án thương mại không?**  
  A: Có, nhưng tuân thủ giấy phép CC BY-SA 4.0. Bạn phải ghi công (`ATTRIBUTION.md`) và phần dữ liệu phái sinh cũng phải mở mã nguồn tương tự.
- **Q: Format của database là gì?**  
  A: Định dạng SQLite 3 tiêu chuẩn, chạy được trên mọi thư viện hỗ trợ SQLite (như `sqlite3` trong Python, Node.js, hay Room trong Android).

## 📄 Giấy Phép & Tác Giả

Cơ sở dữ liệu và kho lưu trữ này được cấp phép dưới **Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)**. Chi tiết [tại đây](https://creativecommons.org/licenses/by-sa/4.0/).

**📊 [Xem Thống Kê](stats.md) | 📄 [Xem Cấu Trúc Lược Đồ (Schema)](schema.sql)**

---

# 📖 Free English–Vietnamese Dictionary Database (SQLite)

**Offline English-Vietnamese dictionary database** featuring 109,924 vocabulary words and 162,124 detailed definitions. Specially optimized with **100% example sentence coverage**, an ultra-lightweight size of just 41 MB, and requires zero internet connection.

The perfect solution for vocabulary learning apps (flashcards), Natural Language Processing (NLP) projects, AI training, and mobile/web app integration.

![SQLite](https://img.shields.io/badge/SQLite-Database-blue)
![Words](https://img.shields.io/badge/Words-109.9k+-green)
![Definitions](https://img.shields.io/badge/Definitions-162.1k+-orange)
![IPA](https://img.shields.io/badge/IPA-71.1k+-informational)
![Examples](https://img.shields.io/badge/Examples-180.9k+-purple)
![License](https://img.shields.io/badge/License-CC%20BY--SA%204.0-blue)

> [!IMPORTANT]
> **Core Difference:** This version is fully enriched with **180,000 standard example sentences** for ALL definitions, corrects entry and IPA errors, and drastically reduces the database size from 170MB down to just 41MB.

**Author**: [Skypedia](skypediacode@gmail.com)

---

## ✨ Key Features

- 📚 **109,924 English words** with full Vietnamese definitions.
- 🔤 **162,124 accurate Vietnamese definitions**.
- 🔊 **71,051 IPA pronunciations** (64.6% coverage).
- 💬 **180,928 example sentences** (100% coverage - every definition has at least one example).
- 🚀 **Ultra-lightweight (41 MB)**: Easy to embed into mobile applications.
- 📦 **Zero dependencies**: Compatible with any programming language (Python, Node.js, C#, Java, Flutter...).
- 🔓 **100% Offline**: No API calls or internet required.
- ✅ **Production-ready**: Spell-checked, validated, deduplicated, and noise-free.

## 📊 Data Statistics

- **Word-Definition Pairs:** 180,928
- **Example Sentences:** 180,928 (100% coverage)
- **IPA Pronunciations:** 71,051 (64.6% coverage)
- **Database Size:** 41 MB (reduced by 75% from the original 170 MB)

> [!TIP]
> See [`stats.md`](stats.md) for detailed information on the data cleaning and optimization process.

## 💻 Use Cases

- 📖 **Offline Dictionaries** – Build dictionary apps without requiring internet access.
- 🎓 **Language Learning Tools** – Flashcard apps, Spaced Repetition Systems (SRS), quizzes.
- 🤖 **NLP & AI** – Machine learning training data, translation models, model evaluation.
- 👨‍💻 **Software Integration** – Text editor plugins, browser extensions, automation scripts.

## 📚 Data Source & Attribution

Built upon the original **[MinhQND Dictionary](https://github.com/minhqnd/dictionary)** (CC BY-SA 4.0), with powerful enhancements:

- Added learner-friendly example sentences (100% coverage, validated).
- Standardized and added IPA pronunciations.
- Used **[OVDP](https://sourceforge.net/projects/ovdp/)** to fix over 20,000 corrupted English entries.
- Data cleanup: Removed 273,073 orphaned definitions, ran VACUUM to drastically optimize the database.

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

**📊 [View Statistics](stats.md) | 📄 [View Schema](schema.sql)**
