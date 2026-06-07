# Thống kê Tập dữ liệu

## Tiếng Việt

### Tổng quan

Cơ sở dữ liệu từ điển SQLite này chứa dữ liệu dịch tiếng Anh-Việt toàn diện với thông tin ngôn ngữ học hỗ trợ.

### Thống kê cốt lõi

| Chỉ số                   | Số lượng |
| ------------------------ | -------- |
| Từ tiếng Anh             | 109,924  |
| Định nghĩa tiếng Việt    | 162,124  |
| Cặp từ-định nghĩa        | 180,928  |
| Phiên âm IPA             | 71,051   |
| Câu ví dụ                | 180,928  |
| Kích thước cơ sở dữ liệu | 41 MB    |

### Phạm vi định nghĩa

| Danh mục          | Số lượng | Phần trăm |
| ----------------- | -------- | --------- |
| Cặp từ-định nghĩa | 180,928  | 100%      |
| Cặp có ví dụ      | 180,928  | 100%      |
| Cặp thiếu ví dụ   | 0        | 0%        |

### Phạm vi phiên âm

| Danh mục        | Số lượng |
| --------------- | -------- |
| Tổng số từ      | 109,924  |
| Từ có IPA       | 71,051   |
| Từ không có IPA | 38,873   |

**Lưu ý:** Cơ sở dữ liệu tập trung vào những từ phổ biến và quan trọng nhất, điều này giải thích phạm vi IPA 64.6%.

### Đặc điểm tệp cơ sở dữ liệu

| Tài sản          | Giá trị   |
| ---------------- | --------- |
| Định dạng        | SQLite 3  |
| Nén              | Không nén |
| Kích thước trang | 4096 byte |
| Mã hóa           | UTF-8     |
| Kích thước tệp   | 41 MB     |

### Kích thước bảng

| Bảng             | Số bản ghi |
| ---------------- | ---------- |
| words            | 109,924    |
| definitions      | 162,124    |
| word_definitions | 180,928    |
| pronunciations   | 71,051     |

### Tóm tắt tối ưu hóa

- Theme các câu ví dụ tiếng Anh dễ hiểu cho người học (AI tạo và xác thực)
- Đã sửa dữ liệu IPA từ nguồn minhqnd gốc
- Khắc phục lỗi sai từ của 15.000+ từ trong từ điển gốc (ví dụ abiliti, fluentli --> ability, fluently hay số nhiều zippers --> zipper)
- Kiểm tra chính tả (spelling) + loại bỏ cột `definitions.links` không sử dụng
- Đã loại bỏ hơn 270,000 mục từ không có định nghĩa (không có liên kết `word_definitions`) + các từ nhiễu (không phải ký tự ASCII hoặc chứa các ký tự đặc biệt: `$%!&=[]{}@#^*~\|`)
- Đã xóa các bảng phân tích `sqlite_stat1` / `sqlite_stat4`
- Chạy `VACUUM` để tối ưu kích thước từ điển

---

### Thống kê chỉ mục

Cơ sở dữ liệu bao gồm các chỉ mục được tối ưu hóa trên:

- `words(word, lang_code)` - để tra cứu từ
- `word_definitions(word_id)` - để lấy định nghĩa
- `word_definitions(definition_id)` - để tìm kiếm ngược
- `pronunciations(word_id, ipa, region)` - để truy cập phiên âm

---

# Dataset Statistics

## English

### Overview

This SQLite dictionary database contains comprehensive English-Vietnamese translation data with supporting linguistic information.

### Core Statistics

| Metric                 | Count   |
| ---------------------- | ------- |
| English Words          | 109,924 |
| Vietnamese Definitions | 162,124 |
| Word-Definition Pairs  | 180,928 |
| IPA Pronunciations     | 71,051  |
| Example Sentences      | 180,928 |
| Database Size          | 41 MB   |

### Definition Coverage

| Category               | Count   | Percentage |
| ---------------------- | ------- | ---------- |
| Word-Definition Pairs  | 180,928 | 100%       |
| Pairs with Examples    | 180,928 | 100%       |
| Pairs Missing Examples | 0       | 0%         |

### Pronunciation Coverage

| Category          | Count   | Percentage |
| ----------------- | ------- | ---------- |
| Total Words       | 109,924 | 100%       |
| Words with IPA    | 71,051  | 64.6%      |
| Words without IPA | 38,873  | 35.4%      |

IPA coverage varies because pronunciation data is not available for every entry.

### Database File Characteristics

| Property    | Value        |
| ----------- | ------------ |
| Format      | SQLite 3     |
| Compression | Uncompressed |
| Page Size   | 4096 bytes   |
| Encoding    | UTF-8        |
| File Size   | 41 MB        |

### Table Sizes

| Table            | Record Count |
| ---------------- | ------------ |
| words            | 109,924      |
| definitions      | 162,124      |
| word_definitions | 180,928      |
| pronunciations   | 71,051       |

### Optimization Summary

- Learner-friendly example sentences (generated and validated)
- Fixed IPA data from the original minhqnd source
- Fix 15,000+ headwords issue from the original dictionary
- Spell-checking pipeline and remove unused `definitions.links` column
- Removed 270,000+ orphaned definition rows (no `word_definitions` link) + noise words (non-ASCII or containing special chars: `$%!&=[]{}@#^*~\|`)
- Dropped `sqlite_stat1` / `sqlite_stat4` analysis tables
- Ran `VACUUM` to eliminate free-page bloat

---

### Index Statistics

The database includes optimized indexes on:

- `words(word, lang_code)` - for word lookups
- `word_definitions(word_id)` - for definition retrieval
- `word_definitions(definition_id)` - for reverse lookups
- `pronunciations(word_id, ipa, region)` - for pronunciation access
