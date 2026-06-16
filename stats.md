# Thống kê Tập dữ liệu

## Tiếng Việt

### Tổng quan

Cơ sở dữ liệu từ điển SQLite này chứa dữ liệu dịch tiếng Anh-Việt toàn diện với thông tin ngôn ngữ học hỗ trợ.

### Thống kê cốt lõi

| Chỉ số                   | Số lượng |
| ------------------------ | -------- |
| Từ tiếng Anh             | 101,216  |
| Định nghĩa tiếng Việt    | 153,869  |
| Cặp từ-định nghĩa        | 171,100  |
| Phiên âm IPA             | 83,854   |
| Câu ví dụ                | 171,100  |
| Kích thước cơ sở dữ liệu | ~43 MB   |

### Phạm vi định nghĩa

| Danh mục          | Số lượng | Phần trăm |
| ----------------- | -------- | --------- |
| Cặp từ-định nghĩa | 171,100  | 100%      |
| Cặp có ví dụ      | 171,100  | 100%      |
| Cặp thiếu ví dụ   | 0        | 0%        |

### Phạm vi phiên âm

| Danh mục        | Số lượng |
| --------------- | -------- |
| Tổng số từ      | 101,216  |
| Từ có IPA       | 79,879   |
| Từ không có IPA | 21,337   |

**Lưu ý:** Cơ sở dữ liệu tập trung vào những từ phổ biến và quan trọng nhất, điều này giải thích phạm vi IPA 78.92%.

### Đặc điểm tệp cơ sở dữ liệu

| Tài sản          | Giá trị   |
| ---------------- | --------- |
| Định dạng        | SQLite 3  |
| Nén              | Không nén |
| Kích thước trang | 4096 byte |
| Mã hóa           | UTF-8     |
| Kích thước tệp   | ~43 MB    |

### Kích thước bảng

| Bảng             | Số bản ghi |
| ---------------- | ---------- |
| words            | 101,216    |
| definitions      | 153,869    |
| word_definitions | 171,100    |
| pronunciations   | 83,854     |

### Tóm tắt tối ưu hóa

- Dọn dẹp từ điển: xóa các mục từ bị lỗi/hỏng (corrupted entries) và các từ mượn/phiên âm tiếng nước ngoài (foreign/transliteration entries).
- Chuẩn hóa ký tự dấu nháy đơn (apostrophes) đối với tất cả các mục từ (headwords).
- Theme các câu ví dụ tiếng Anh dễ hiểu cho người học (AI tạo và xác thực)
- Đã thêm và sửa rất nhiều dữ liệu IPA so với nguồn minhqnd gốc
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
| English Words          | 101,216 |
| Vietnamese Definitions | 153,869 |
| Word-Definition Pairs  | 171,100 |
| IPA Pronunciations     | 83,854  |
| Example Sentences      | 171,100 |
| Database Size          | ~43 MB  |

### Definition Coverage

| Category               | Count   | Percentage |
| ---------------------- | ------- | ---------- |
| Word-Definition Pairs  | 171,100 | 100%       |
| Pairs with Examples    | 171,100 | 100%       |
| Pairs Missing Examples | 0       | 0%         |

### Pronunciation Coverage

| Category          | Count   | Percentage |
| ----------------- | ------- | ---------- |
| Total Words       | 101,216 | 100%       |
| Words with IPA    | 79,879  | 78.92%     |
| Words without IPA | 21,337  | 21.08%     |

IPA coverage varies because pronunciation data is not available for every entry.

### Database File Characteristics

| Property    | Value        |
| ----------- | ------------ |
| Format      | SQLite 3     |
| Compression | Uncompressed |
| Page Size   | 4096 bytes   |
| Encoding    | UTF-8        |
| File Size   | ~43 MB       |

### Table Sizes

| Table            | Record Count |
| ---------------- | ------------ |
| words            | 101,216      |
| definitions      | 153,869      |
| word_definitions | 171,100      |
| pronunciations   | 83,854       |

### Optimization Summary

- Dictionary cleanup: Deleted corrupted entries and approved foreign/transliteration entries.
- Normalized apostrophes across all headwords.
- Learner-friendly example sentences (generated and validated)
- Added and fix numerous IPA data compared to the original minhqnd source
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
