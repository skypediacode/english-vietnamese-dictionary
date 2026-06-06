# Dataset Statistics

## English

### Overview

This SQLite dictionary database contains comprehensive English-Vietnamese translation data with supporting linguistic information.

### Core Statistics

| Metric                 | Count   |
| ---------------------- | ------- |
| English Words          | 118,356 |
| Vietnamese Definitions | 443,116 |
| Word-Definition Pairs  | 189,226 |
| IPA Pronunciations     | 70,631  |
| Example Sentences      | 162,243 |
| Database Size          | ~90 MB  |

### Definition Coverage

| Category               | Count   | Percentage |
| ---------------------- | ------- | ---------- |
| Word-Definition Pairs  | 189,226 | 100%       |
| Pairs with Examples    | 162,243 | 85.7%      |
| Pairs Missing Examples | 26,983  | 14.3%      |

### Pronunciation Coverage

| Category          | Count   | Percentage |
| ----------------- | ------- | ---------- |
| Total Words       | 118,356 | 100%       |
| Words with IPA    | 70,631  | 59.7%      |
| Words without IPA | 47,725  | 40.3%      |

IPA coverage varies because pronunciation data is not available for every entry.

### Database File Characteristics

| Property    | Value        |
| ----------- | ------------ |
| Format      | SQLite 3     |
| Compression | Uncompressed |
| Page Size   | 4096 bytes   |
| Encoding    | UTF-8        |
| File Size   | 89.4 MB      |

### Table Sizes

| Table            | Record Count |
| ---------------- | ------------ |
| words            | 118,356      |
| definitions      | 443,116      |
| word_definitions | 189,226      |
| pronunciations   | 70,631       |

### Index Statistics

The database includes optimized indexes on:

- `words(word, lang_code)` - for word lookups
- `word_definitions(word_id)` - for definition retrieval
- `word_definitions(definition_id)` - for reverse lookups
- `pronunciations(word_id, ipa, region)` - for pronunciation access

---

# Thống kê Tập dữ liệu

## Tiếng Việt

### Tổng quan

Cơ sở dữ liệu từ điển SQLite này chứa dữ liệu dịch tiếng Anh-Việt toàn diện với thông tin ngôn ngữ học hỗ trợ.

### Thống kê cốt lõi

| Chỉ số                   | Số lượng |
| ------------------------ | -------- |
| Từ tiếng Anh             | 118,356  |
| Định nghĩa tiếng Việt    | 443,116  |
| Cặp từ-định nghĩa        | 189,226  |
| Phiên âm IPA             | 70,631   |
| Câu ví dụ                | 162,243  |
| Kích thước cơ sở dữ liệu | ~90 MB   |

### Phạm vi định nghĩa

| Danh mục          | Số lượng | Phần trăm |
| ----------------- | -------- | --------- |
| Cặp từ-định nghĩa | 189,226  | 100%      |
| Cặp có ví dụ      | 162,243  | 85.7%     |
| Cặp thiếu ví dụ   | 26,983   | 14.3%     |

### Phạm vi phiên âm

| Danh mục        | Số lượng | Phần trăm |
| --------------- | -------- | --------- |
| Tổng số từ      | 118,356  | 100%      |
| Từ có IPA       | 70,631   | 59.7%     |
| Từ không có IPA | 47,725   | 40.3%     |

**Lưu ý:** Cơ sở dữ liệu tập trung vào những từ phổ biến và quan trọng nhất, điều này giải thích phạm vi IPA 59.7%.

### Đặc điểm tệp cơ sở dữ liệu

| Tài sản          | Giá trị   |
| ---------------- | --------- |
| Định dạng        | SQLite 3  |
| Nén              | Không nén |
| Kích thước trang | 4096 byte |
| Mã hóa           | UTF-8     |
| Kích thước tệp   | 89.4 MB   |

### Kích thước bảng

| Bảng             | Số bản ghi |
| ---------------- | ---------- |
| words            | 118,356    |
| definitions      | 443,116    |
| word_definitions | 189,226    |
| pronunciations   | 70,631     |
| sources          | ~5         |

### Thống kê chỉ mục

Cơ sở dữ liệu bao gồm các chỉ mục được tối ưu hóa trên:

- `words(word, lang_code)` - để tra cứu từ
- `word_definitions(word_id)` - để lấy định nghĩa
- `word_definitions(definition_id)` - để tìm kiếm ngược
- `pronunciations(word_id, ipa, region)` - để truy cập phiên âm
