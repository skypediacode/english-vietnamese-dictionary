# Thống kê Tập dữ liệu

## Tiếng Việt

### Tổng quan

Cơ sở dữ liệu từ điển SQLite này chứa dữ liệu dịch tiếng Anh-Việt toàn diện với thông tin ngôn ngữ học hỗ trợ.

### Thống kê cốt lõi

| Chỉ số                   | Số lượng |
| ------------------------ | -------- |
| Từ tiếng Anh             | 104,554  |
| Từ tiếng Việt            | 175      |
| Tổng số từ               | 104,729  |
| Định nghĩa tiếng Việt    | 158,044  |
| Cặp từ-định nghĩa        | 175,641  |
| Phiên âm IPA             | 108,671  |
| Câu ví dụ                | 175,641  |
| Kích thước cơ sở dữ liệu | ~41.2 MB |

### Phạm vi định nghĩa

| Danh mục          | Số lượng | Phần trăm |
| ----------------- | -------- | --------- |
| Cặp từ-định nghĩa | 175,641  | 100%      |
| Cặp có ví dụ      | 175,641  | 100%      |
| Cặp thiếu ví dụ   | 0        | 0%        |

### Phạm vi phiên âm

| Danh mục        | Số lượng | Phần trăm |
| --------------- | -------- | --------- |
| Tổng số từ      | 104,729  | 100%      |
| Từ có IPA       | 104,729  | 100%      |
| Từ không có IPA | 0        | 0%        |

### Đặc điểm tệp cơ sở dữ liệu

| Tài sản          | Giá trị   |
| ---------------- | --------- |
| Định dạng        | SQLite 3  |
| Nén              | Không nén |
| Kích thước trang | 4096 byte |
| Mã hóa           | UTF-8     |
| Kích thước tệp   | ~41.2 MB  |

### Kích thước bảng

| Bảng             | Số bản ghi |
| ---------------- | ---------- |
| words            | 104,729    |
| definitions      | 158,044    |
| word_definitions | 175,641    |
| pronunciations   | 108,671    |

### Tóm tắt tối ưu hóa

- Dọn dẹp từ điển: xóa các mục từ bị lỗi/hỏng (corrupted entries) và các từ mượn/phiên âm tiếng nước ngoài (foreign/transliteration entries).
- Chuẩn hóa ký tự dấu nháy đơn (apostrophes) đối với tất cả các mục từ (headwords).
- Thêm các câu ví dụ tiếng Anh dễ hiểu cho người học (AI tạo và xác thực).
- Đã thêm và sửa rất nhiều dữ liệu IPA so với nguồn minhqnd gốc.
- Khắc phục lỗi sai từ của 15.000+ từ trong từ điển gốc (ví dụ abiliti, fluentli --> ability, fluently hay số nhiều zippers --> zipper).
- Kiểm tra chính tả (spelling) + loại bỏ cột `definitions.links` không sử dụng.
- Đã loại bỏ hơn 270,000 mục từ không có định nghĩa (không có liên kết `word_definitions`) + các từ nhiễu (không phải ký tự ASCII hoặc chứa các ký tự đặc biệt: `$%!&=[]{}@#^*~\|`).
- Giải quyết triệt để các phiên âm IPA tiếng Anh bị thiếu (độ bao phủ IPA đạt 100%).
- Dọn dẹp các từ không hợp lệ và định nghĩa không còn sử dụng.
- Đã thêm hơn 1,350 thành ngữ (idioms) tiếng Anh thông dụng nhất và hơn 3000 cụm động từ với định nghĩa tiếng Việt tự nhiên, ví dụ minh họa và phiên âm IPA chuẩn Oxford.
- Đã xóa các bảng phân tích `sqlite_stat1` / `sqlite_stat4`.
- Chạy `VACUUM` để tối ưu kích thước từ điển.

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

| Metric                 | Count    |
| ---------------------- | -------- |
| English Words          | 104,554  |
| Vietnamese Words       | 175      |
| Total Words            | 104,729  |
| Vietnamese Definitions | 158,044  |
| Word-Definition Pairs  | 175,641  |
| IPA Pronunciations     | 108,671  |
| Example Sentences      | 175,641  |
| Database Size          | ~41.2 MB |

### Definition Coverage

| Category               | Count   | Percentage |
| ---------------------- | ------- | ---------- |
| Word-Definition Pairs  | 175,641 | 100%       |
| Pairs with Examples    | 175,641 | 100%       |
| Pairs Missing Examples | 0       | 0%         |

### Pronunciation Coverage

| Category          | Count   | Percentage |
| ----------------- | ------- | ---------- |
| Total Words       | 104,729 | 100%       |
| Words with IPA    | 104,729 | 100%       |
| Words without IPA | 0       | 0%         |

All English words now have 100% IPA coverage with 0 missing records.

### Database File Characteristics

| Property    | Value        |
| ----------- | ------------ |
| Format      | SQLite 3     |
| Compression | Uncompressed |
| Page Size   | 4096 bytes   |
| Encoding    | UTF-8        |
| File Size   | ~41.2 MB     |

### Table Sizes

| Table            | Record Count |
| ---------------- | ------------ |
| words            | 104,729      |
| definitions      | 158,044      |
| word_definitions | 175,641      |
| pronunciations   | 108,671      |

### Optimization Summary

- Dictionary cleanup: Deleted corrupted entries and approved foreign/transliteration entries.
- Normalized apostrophes across all headwords.
- Learner-friendly example sentences (generated and validated).
- Added and fixed numerous IPA data compared to the original minhqnd source.
- Fixed 15,000+ headwords issue from the original dictionary.
- Spell-checking pipeline and removed unused `definitions.links` column.
- Removed 270,000+ orphaned definition rows (no `word_definitions` link) + noise words (non-ASCII or containing special chars: `$%!&=[]{}@#^*~\|`).
- Resolved all missing English IPAs.
- Added over 1,350 of the most common American idioms and over 3000 phrasal verbs with natural Vietnamese translations, examples, and Oxford IPA.
- Dropped `sqlite_stat1` / `sqlite_stat4` analysis tables.
- Ran `VACUUM` to eliminate free-page bloat.

---

### Index Statistics

The database includes optimized indexes on:

- `words(word, lang_code)` - for word lookups
- `word_definitions(word_id)` - for definition retrieval
- `word_definitions(definition_id)` - for reverse lookups
- `pronunciations(word_id, ipa, region)` - for pronunciation access
