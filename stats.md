# Thống kê Tập dữ liệu

## Tiếng Việt

### Tổng quan

Cơ sở dữ liệu từ điển SQLite này chứa dữ liệu dịch tiếng Anh-Việt toàn diện với thông tin ngôn ngữ học hỗ trợ, ví dụ câu hoàn chỉnh và phiên âm IPA 100%.

### Thống kê cốt lõi

| Chỉ số                   | Số lượng |
| ------------------------ | -------- |
| Từ tiếng Anh             | 104,829  |
| Từ tiếng Việt            | 0        |
| Tổng số từ               | 104,829  |
| Định nghĩa tiếng Việt    | 158,307  |
| Cặp từ-định nghĩa        | 175,735  |
| Phiên âm IPA             | 108,776  |
| Câu ví dụ                | 175,735  |
| Kích thước cơ sở dữ liệu | ~42.2 MB |

### Phạm vi định nghĩa

| Danh mục          | Số lượng | Phần trăm |
| ----------------- | -------- | --------- |
| Cặp từ-định nghĩa | 175,735  | 100%      |
| Cặp có ví dụ      | 175,735  | 100%      |
| Cặp thiếu ví dụ   | 0        | 0%        |

### Phạm vi phiên âm

| Danh mục        | Số lượng | Phần trăm |
| --------------- | -------- | --------- |
| Tổng số từ      | 104,829  | 100%      |
| Từ có IPA       | 104,829  | 100%      |
| Từ không có IPA | 0        | 0%        |

### Đặc điểm tệp cơ sở dữ liệu

| Tài sản          | Giá trị   |
| ---------------- | --------- |
| Định dạng        | SQLite 3  |
| Nén              | Không nén |
| Kích thước trang | 4096 byte |
| Mã hóa           | UTF-8     |
| Kích thước tệp   | ~42.2 MB  |

### Kích thước bảng

| Bảng             | Số bản ghi |
| ---------------- | ---------- |
| words            | 104,829    |
| definitions      | 158,307    |
| word_definitions | 175,735    |
| pronunciations   | 108,776    |

### Tóm tắt tối ưu hóa

- Dọn dẹp từ điển: xóa các mục từ bị lỗi/hỏng (corrupted entries) và các từ mượn/phiên âm tiếng nước ngoài (foreign/transliteration entries).
- Chuẩn hóa ký tự dấu nháy đơn (apostrophes) đối với tất cả các mục từ (headwords).
- Thêm các câu ví dụ tiếng Anh dễ hiểu cho người học (chuẩn hóa và thay thế 18,636 ví dụ dạng fragment/mảnh thành các câu hoàn chỉnh chứa chính xác từ mục từ).
- Đã thêm và sửa rất nhiều dữ liệu IPA so với nguồn minhqnd gốc.
- Khắc phục lỗi sai từ của 15.000+ từ trong từ điển gốc (ví dụ abiliti, fluentli --> ability, fluently hay số nhiều zippers --> zipper).
- Kiểm tra chính tả (spelling) + loại bỏ cột `definitions.links` không sử dụng.
- Đã loại bỏ hơn 270,000 mục từ không có định nghĩa (không có liên kết `word_definitions`) + các từ nhiễu (không phải ký tự ASCII hoặc chứa các ký tự đặc biệt: `$%!&=[]{}@#^*~\|`).
- Giải quyết triệt để các phiên âm IPA tiếng Anh bị thiếu (độ bao phủ IPA đạt 100%).
- Dọn dẹp các từ không hợp lệ và định nghĩa không còn sử dụng.
- Đã thêm hơn 1,350 thành ngữ (idioms) tiếng Anh thông dụng nhất và hơn 3,000 cụm động từ với định nghĩa tiếng Việt tự nhiên, ví dụ minh họa và phiên âm IPA chuẩn Oxford.
- Chuẩn hóa đồng bộ mã ngôn ngữ `lang_code = 'en'` cho 100% mục từ tiếng Anh.
- Tối ưu hóa tệp CSDL với `PRAGMA optimize`, `ANALYZE`, `VACUUM` và kiểm tra toàn vẹn (`PRAGMA integrity_check`).

---

### Thống kê chỉ mục

Cơ sở dữ liệu bao gồm các chỉ mục được tối ưu hóa trên:

- `words(word, lang_code)` - để tra cứu từ
- `word_definitions(word_id)` - để lấy định nghĩa
- `word_definitions(definition_id)` - để tìm kiếm ngược
- `pronunciations(word_id)` và `pronunciations(word_id, ipa, region)` - để truy cập phiên âm

---

# Dataset Statistics

## English

### Overview

This SQLite dictionary database contains comprehensive English-Vietnamese translation data with supporting linguistic information, complete sentence examples, and 100% IPA coverage.

### Core Statistics

| Metric                 | Count    |
| ---------------------- | -------- |
| English Words          | 104,829  |
| Vietnamese Words       | 0        |
| Total Words            | 104,829  |
| Vietnamese Definitions | 158,307  |
| Word-Definition Pairs  | 175,735  |
| IPA Pronunciations     | 108,776  |
| Example Sentences      | 175,735  |
| Database Size          | ~42.2 MB |

### Definition Coverage

| Category               | Count   | Percentage |
| ---------------------- | ------- | ---------- |
| Word-Definition Pairs  | 175,735 | 100%       |
| Pairs with Examples    | 175,735 | 100%       |
| Pairs Missing Examples | 0       | 0%         |

### Pronunciation Coverage

| Category          | Count   | Percentage |
| ----------------- | ------- | ---------- |
| Total Words       | 104,829 | 100%       |
| Words with IPA    | 104,829 | 100%       |
| Words without IPA | 0       | 0%         |

All English words now have 100% IPA coverage with 0 missing records.

### Database File Characteristics

| Property    | Value        |
| ----------- | ------------ |
| Format      | SQLite 3     |
| Compression | Uncompressed |
| Page Size   | 4096 bytes   |
| Encoding    | UTF-8        |
| File Size   | ~42.2 MB     |

### Table Sizes

| Table            | Record Count |
| ---------------- | ------------ |
| words            | 104,829      |
| definitions      | 158,307      |
| word_definitions | 175,735      |
| pronunciations   | 108,776      |

### Optimization Summary

- Dictionary cleanup: Deleted corrupted entries and approved foreign/transliteration entries.
- Normalized apostrophes across all headwords.
- Learner-friendly example sentences (replaced 18,636 fragment examples with complete sentences containing exact headwords).
- Added and fixed numerous IPA data compared to the original minhqnd source.
- Fixed 15,000+ headwords issue from the original dictionary.
- Spell-checking pipeline and removed unused `definitions.links` column.
- Removed 270,000+ orphaned definition rows (no `word_definitions` link) + noise words (non-ASCII or containing special chars: `$%!&=[]{}@#^*~\|`).
- Resolved all missing English IPAs (100% IPA coverage).
- Added over 1,350 of the most common idioms and over 3,000 phrasal verbs with natural Vietnamese translations, examples, and Oxford IPA.
- Standardized `lang_code = 'en'` across all English headwords.
- Optimized database with `PRAGMA optimize`, `ANALYZE`, `VACUUM` and verified via `PRAGMA integrity_check`.

---

### Index Statistics

The database includes optimized indexes on:

- `words(word, lang_code)` - for word lookups
- `word_definitions(word_id)` - for definition retrieval
- `word_definitions(definition_id)` - for reverse lookups
- `pronunciations(word_id)` and `pronunciations(word_id, ipa, region)` - for pronunciation access
