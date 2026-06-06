# English–Vietnamese Dictionary Database (SQLite)

![SQLite](https://img.shields.io/badge/SQLite-Database-blue)
![Words](https://img.shields.io/badge/Words-118k+-green)
![Definitions](https://img.shields.io/badge/Definitions-443k+-orange)
![IPA](https://img.shields.io/badge/IPA-70k+-informational)
![Examples](https://img.shields.io/badge/Examples-162k+-purple)

A comprehensive, offline SQLite dictionary database with 118,000+ English words and 443,000+ Vietnamese definitions. Built from the excellent **[MinhQND Dictionary](https://github.com/minhqnd/dictionary)** project with added learner-friendly example sentences and SQLite formatting.

Perfect for flashcard apps, offline dictionaries, language-learning tools, NLP experiments, and educational projects.

**Features:**

- 📚 118,356 English words
- 🔤 443,116 Vietnamese definitions
- 🔊 70,631 IPA pronunciations
- 💬 162,243 example sentences
- 🚀 ~90 MB SQLite database
- 📦 Zero dependencies – use it anywhere
- 🔓 Offline access – no internet required

## Installation

Use any SQLite client or library to query the database file.

### Quick Start

```bash
# Install sqlite3 if needed
# macOS: brew install sqlite
# Ubuntu/Debian: sudo apt-get install sqlite3
# Windows: Download from https://www.sqlite.org/download.html

sqlite3 dictionary_en_vi.db
```

## Usage Examples

### Exact Word Lookup

```sql
-- Find all definitions for a word
SELECT d.definition, d.pos, d.sub_pos, wd.example
FROM words w
JOIN word_definitions wd ON w.id = wd.word_id
JOIN definitions d ON wd.definition_id = d.id
WHERE w.word = 'hello'
ORDER BY d.pos;
```

### Prefix Search

```sql
-- Find all words starting with a prefix
SELECT DISTINCT w.word
FROM words w
WHERE w.word LIKE 'un%'
LIMIT 20;
```

### Word with IPA and Examples

```sql
-- Get a word with pronunciation and example sentences
SELECT
  w.word,
  p.ipa,
  p.region,
  d.definition,
  d.pos,
  wd.example
FROM words w
LEFT JOIN pronunciations p ON w.id = p.word_id
JOIN word_definitions wd ON w.id = wd.word_id
JOIN definitions d ON wd.definition_id = d.id
WHERE w.word = 'run'
ORDER BY p.region, d.pos;
```

### Search Across Definitions

```sql
-- Search for definitions containing a keyword
SELECT
  w.word,
  d.definition,
  d.pos
FROM words w
JOIN word_definitions wd ON w.id = wd.word_id
JOIN definitions d ON wd.definition_id = d.id
WHERE d.definition LIKE '%animal%'
LIMIT 10;
```

## Database Schema

See [`schema.sql`](schema.sql) for complete schema documentation and table definitions.

**Main Tables:**

- **words**: English words with language code
- **definitions**: Vietnamese definitions with part of speech
- **word_definitions**: Links words to definitions with example sentences
- **pronunciations**: IPA pronunciations and regional variants

## Statistics

- **Total Word-Definition Pairs:** 189,226
- **Sentences with Examples:** 162,243 (85.7% coverage)
- **IPA Pronunciations:** 70,631 (59.7% word coverage)
- **Database Size:** ~90 MB

See [`stats.md`](stats.md) for detailed statistics.

## Data Source

This database is built from the **[MinhQND Dictionary](https://github.com/minhqnd/dictionary)** project (CC BY-SA 4.0).

**What we added:**
- Learner-friendly example sentences (generated and validated)
- SQLite database format with optimized schema
- Curated filtering and validation
- Offline queryable structure

**MinhQND Dictionary's upstream sources:**
- **Wiktionary** – Original lexical content and translations
- **vntk/dictionary** – Vietnamese dictionary data
- **Hồ Ngọc Đức's Vietnamese Dictionary Project** – Vietnamese lexical resources
- **WikDict & open-dict-data** – IPA pronunciation data

See [`ATTRIBUTION.md`](ATTRIBUTION.md) for complete attribution and licensing information.

## License

This database and repository are licensed under **Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)**.

You are free to:

- **Share** – copy and redistribute the database in any medium or format
- **Adapt** – remix, transform, and build upon the database

Under the following conditions:

- **Attribution** – credit the original sources (see [`ATTRIBUTION.md`](ATTRIBUTION.md))
- **ShareAlike** – distribute derivatives under the same CC BY-SA 4.0 license

See the [full license](https://creativecommons.org/licenses/by-sa/4.0/) for details.

## Use Cases

- 📱 **Flashcard Apps** – Build spaced-repetition learning systems
- 📖 **Offline Dictionaries** – Deploy without internet requirements
- 🎓 **Language Learning** – Power English-Vietnamese study tools
- 🤖 **NLP Projects** – Use for training, evaluation, and reference
- 👨‍💻 **Developer Tools** – Integrate into applications and scripts

## FAQ

**Q: Can I use this database commercially?**

A: Yes, under the CC BY-SA 4.0 license. You may use, modify, and distribute the database for commercial purposes, provided you:

- Attribute the original sources (see ATTRIBUTION.md)
- Distribute any modified versions under the same CC BY-SA 4.0 license
- Include a copy of the license with your distribution

**Q: Is this data updated regularly?**  
A: This is a snapshot. For updates, consider contributing back to Wiktionary or the original sources.

**Q: How do I contribute improvements?**  
A: Submit corrections and enhancements via pull request or open an issue to discuss.

**Q: How can I use this in my app?**  
A: Copy `dictionary_en_vi.db` to your project and use SQLite bindings for your language (Python, Node.js, C#, Java, etc.).

## Credits

Created and maintained by **[Skypedia](https://github.com/skypediacode)** (2026).

Built from the **[MinhQND Dictionary](https://github.com/minhqnd/dictionary)** project by minhqnd, with added learner-friendly example sentences and SQLite database optimization.

## File Structure

```
.
├── dictionary_en_vi.db    ← Main SQLite database
├── README.md              ← This file
├── schema.sql             ← Database schema documentation
├── stats.md               ← Detailed statistics
├── ATTRIBUTION.md         ← Data source attribution
├── LICENSE                ← CC BY-SA 4.0 License
└── .gitignore
```

---

# Cơ sở dữ liệu Từ điển Anh–Việt

Cơ sở dữ liệu từ điển ngoại tuyến toàn diện với 118,000+ từ tiếng Anh và 443,000+ định nghĩa tiếng Việt. Được xây dựng từ dự án **[Từ điển MinhQND](https://github.com/minhqnd/dictionary)** với các câu ví dụ thân thiện với người học và định dạng SQLite.

Lý tưởng cho các ứng dụng flashcard, từ điển ngoại tuyến, công cụ học tiếng Anh, thí nghiệm NLP và dự án giáo dục.

**Tính năng:**

- 📚 118,356 từ tiếng Anh
- 🔤 443,116 định nghĩa tiếng Việt
- 🔊 70,631 phiên âm IPA
- 💬 162,243 câu ví dụ
- 🚀 Cơ sở dữ liệu SQLite ~90 MB
- 📦 Không phụ thuộc – sử dụng ở bất kỳ đâu
- 🔓 Truy cập ngoại tuyến – không cần internet

## Cài đặt

Sử dụng bất kỳ ứng dụng hoặc thư viện SQLite để truy vấn file dữ liệu.

### Bắt đầu nhanh

```bash
# Cài đặt sqlite3 nếu chưa có
# macOS: brew install sqlite
# Ubuntu/Debian: sudo apt-get install sqlite3
# Windows: Tải từ https://www.sqlite.org/download.html

sqlite3 dictionary_en_vi.db
```

## Ví dụ sử dụng

### Tra cứu từ

```sql
-- Lấy tất cả định nghĩa của một từ
SELECT d.definition, d.pos, d.sub_pos, wd.example
FROM words w
JOIN word_definitions wd ON w.id = wd.word_id
JOIN definitions d ON wd.definition_id = d.id
WHERE w.word = 'hello'
ORDER BY d.pos;
```

### Tìm kiếm từ theo tiền tố

```sql
-- Tìm từ bắt đầu bằng tiền tố
SELECT DISTINCT w.word
FROM words w
WHERE w.word LIKE 'un%'
LIMIT 20;
```

### Tra cứu từ kèm phiên âm IPA và ví dụ

```sql
-- Lấy từ cùng với phiên âm IPA và câu ví dụ
SELECT
  w.word,
  p.ipa,
  p.region,
  d.definition,
  d.pos,
  wd.example
FROM words w
LEFT JOIN pronunciations p ON w.id = p.word_id
JOIN word_definitions wd ON w.id = wd.word_id
JOIN definitions d ON wd.definition_id = d.id
WHERE w.word = 'run'
ORDER BY p.region, d.pos;
```

### Tìm kiếm trong các định nghĩa

```sql
-- Tìm kiếm các định nghĩa chứa từ khóa
SELECT
  w.word,
  d.definition,
  d.pos
FROM words w
JOIN word_definitions wd ON w.id = wd.word_id
JOIN definitions d ON wd.definition_id = d.id
WHERE d.definition LIKE '%animal%'
LIMIT 10;
```

## Lược đồ cơ sở dữ liệu

Xem [`schema.sql`](schema.sql) để xem tài liệu lược đồ hoàn chỉnh và các định nghĩa bảng.

**Bảng chính:**

- **words**: Từ tiếng Anh có mã ngôn ngữ
- **definitions**: Định nghĩa tiếng Việt với loại từ
- **word_definitions**: Liên kết từ với định nghĩa cùng với câu ví dụ
- **pronunciations**: Phiên âm IPA và các biến thể khu vực

## Thống kê

- **Cặp từ-định nghĩa:** 189,226
- **Câu ví dụ:** 162,243 (85.7% coverage)
- **Phiên âm IPA:** 70,631 (59.7% coverage)
- **Kích thước cơ sở dữ liệu:** ~90 MB

Xem [`stats.md`](stats.md) để xem chi tiết đầy đủ.

## Nguồn dữ liệu

Cơ sở dữ liệu này được xây dựng từ dự án **[Từ điển MinhQND](https://github.com/minhqnd/dictionary)** (CC BY-SA 4.0).

**Những gì chúng tôi thêm:**
- Câu ví dụ thân thiện với người học (được tạo tự động và kiểm tra chất lượng)
- Định dạng cơ sở dữ liệu SQLite với schema được tối ưu hóa
- Lọc và xác nhận dữ liệu
- Cấu trúc truy vấn ngoại tuyến

**Các nguồn upstream của MinhQND Dictionary:**
- **Wiktionary** – Nội dung từ điển và bản dịch gốc
- **vntk/dictionary** – Dữ liệu từ điển tiếng Việt
- **Dự án Từ điển Tiếng Việt của Hồ Ngọc Đức** – Tài nguyên từ vựng tiếng Việt
- **WikDict & open-dict-data** – Dữ liệu phiên âm IPA

Xem [`ATTRIBUTION.md`](ATTRIBUTION.md) để biết thông tin attribution đầy đủ và nguồn.

## Giấy phép

Cơ sở dữ liệu và kho lưu trữ này được cấp phép theo **Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)**.

Bạn được phép:

- **Chia sẻ** – sao chép và phân phối lại cơ sở dữ liệu ở bất kỳ định dạng nào
- **Thích ứng** – remix, biến đổi và xây dựng trên cơ sở dữ liệu

Với các điều kiện sau:

- **Ghi công (Attribution)** – ghi nhận nguồn dữ liệu gốc (xem [`ATTRIBUTION.md`](ATTRIBUTION.md))
- **ShareAlike** – phân phối các phiên bản sửa đổi dưới cùng giấy phép CC BY-SA 4.0

Xem [full license](https://creativecommons.org/licenses/by-sa/4.0/) để biết chi tiết.

## Trường hợp sử dụng

- 📱 **Ứng dụng Flashcard** – Xây dựng hệ thống học lặp lại theo khoảng cách
- 📖 **Từ điển Ngoại tuyến** – Triển khai không cần kết nối internet
- 🎓 **Công cụ Học tiếng** – Hỗ trợ các ứng dụng học tiếng Anh–Việt
- 🤖 **Dự án NLP** – Sử dụng cho huấn luyện, đánh giá và tham khảo
- 👨‍💻 **Công cụ Nhà phát triển** – Tích hợp vào ứng dụng và tập lệnh

## Câu hỏi thường gặp

**Q: Tôi có thể sử dụng cho mục đích thương mại không?**

A: Có, dưới giấy phép CC BY-SA 4.0. Bạn có thể sử dụng, sửa đổi và phân phối cơ sở dữ liệu cho mục đích thương mại, với điều kiện:

- Ghi công nguồn gốc (xem ATTRIBUTION.md)
- Phân phối các phiên bản sửa đổi dưới cùng giấy phép CC BY-SA 4.0
- Kèm theo bản sao của giấy phép khi phân phối

**Q: Dữ liệu có được cập nhật thường xuyên không?**  
A: Đây là bản chụp tại thời điểm hiện tại. Để cập nhật, hãy đóng góp cho Wiktionary hoặc các nguồn gốc.

**Q: Làm cách nào để góp phần cải thiện?**  
A: Gửi các sửa chữa và cải tiến qua pull request hoặc mở issue để thảo luận.

**Q: Làm cách nào tích hợp vào ứng dụng của tôi?**  
A: Sao chép `dictionary_en_vi.db` vào dự án và sử dụng thư viện SQLite cho ngôn ngữ lập trình của bạn (Python, Node.js, C#, Java, v.v.).

## Tác giả

Được tạo và duy trì bởi **[Skypedia](https://github.com/skypediacode)** (2026).

Được xây dựng từ dự án **[Từ điển MinhQND](https://github.com/minhqnd/dictionary)** của minhqnd, với các câu ví dụ thân thiện với người học và tối ưu hóa cơ sở dữ liệu SQLite.

## Cấu trúc tệp

```
.
├── dictionary_en_vi.db    ← Cơ sở dữ liệu SQLite chính
├── README.md              ← Tệp này
├── schema.sql             ← Tài liệu lược đồ cơ sở dữ liệu
├── stats.md               ← Thống kê chi tiết
├── ATTRIBUTION.md         ← Thông tin attribution nguồn dữ liệu
├── LICENSE                ← Giấy phép CC BY-SA 4.0
└── .gitignore
```
