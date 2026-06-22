# 📖 CSDL Từ điển Anh–Việt Offline & Miễn Phí (SQLite)

**Tiếng Việt** | [English](README.en.md)

**Cơ sở dữ liệu từ điển tiếng Anh – tiếng Việt ngoại tuyến (offline) và miễn phí** với 101,029 từ tiếng Anh (và 175 từ tiếng Việt) cùng 153,841 định nghĩa chi tiết. Đặc biệt tối ưu với **100% định nghĩa có câu ví dụ và 100% độ bao phủ phát âm IPA**, kích thước siêu nhẹ chỉ khoảng 41 MB, không cần kết nối internet.

Giải pháp hoàn hảo cho các ứng dụng học từ vựng (flashcards), dự án xử lý ngôn ngữ tự nhiên (NLP), AI, và tích hợp mobile/web app.

![SQLite](https://img.shields.io/badge/SQLite-Database-blue)
![Words](https://img.shields.io/badge/Words-101k+-green)
![Definitions](https://img.shields.io/badge/Definitions-153.8k+-orange)
![IPA](https://img.shields.io/badge/IPA-100%25-green)
![Examples](https://img.shields.io/badge/Examples-171k+-purple)
![License](https://img.shields.io/badge/License-CC%20BY--SA%204.0-blue)

> [!IMPORTANT]
> **Điểm khác biệt cốt lõi:** Phiên bản này được làm phong phú hoàn toàn với tổng cộng **171,072 câu ví dụ chuẩn** cho TẤT CẢ các định nghĩa, sửa đổi nhiều lỗi mục từ và giải quyết các lỗi IPA cũng như phiên âm IPA bị thiếu. Ngoài ra, chúng tôi tối ưu hóa kích thước tệp SQLite chỉ còn khoảng 41 MB.

---

## ✨ Tính Năng Nổi Bật

- 📚 **101,029 từ tiếng Anh** với định nghĩa tiếng Việt đầy đủ.
- 🔤 **153,841 định nghĩa tiếng Việt** chính xác.
- 🔊 **105,112 phiên âm IPA** trên tất cả các từ (độ bao phủ IPA đạt 100%).
- 💬 **171,072 câu ví dụ** (độ bao phủ 100% - mỗi định nghĩa đều có ít nhất 1 ví dụ).
- 🚀 **Siêu nhẹ (41 MB)**: Dễ dàng tích hợp vào các ứng dụng di động.
- 📦 **Không phụ thuộc**: Tương thích mọi ngôn ngữ lập trình (Python, Node.js, C#, Java, Flutter...).
- 🔓 **100% Ngoại tuyến (Offline)**: Không cần gọi API hoặc kết nối internet.
- ✅ **Chất lượng Production**: Đã qua kiểm tra chính tả, xác thực từ, loại bỏ trùng lặp và không chứa các từ không hợp lệ hoặc các định nghĩa không còn sử dụng.

## 📊 Thống Kê Dữ Liệu

- **Cặp từ-định nghĩa:** 171,072
- **Câu ví dụ:** 171,072 (độ bao phủ 100%)
- **Phiên âm IPA:** 105,112 (độ bao phủ 100%, 0 bản ghi bị thiếu)
- **Kích thước CSDL:** khoảng 41 MB

> [!TIP]
> Xem thêm tại [`stats.md`](stats.md) để biết chi tiết quá trình làm sạch dữ liệu và tối ưu hóa database.

## 💻 Trường Hợp Sử Dụng (Use Cases)

- 📖 **Từ điển Ngoại tuyến** – Xây dựng app tra từ không cần internet.
- 🎓 **Công cụ Học tiếng Anh** – App Flashcard, Spaced Repetition (SRS), bài tập trắc nghiệm.
- 🤖 **Xử lý ngôn ngữ tự nhiên (NLP) & AI** – Dữ liệu huấn luyện mô hình, dịch thuật, đánh giá model.
- 👨‍💻 **Tích hợp phần mềm** – Plugin cho text editor, extension trình duyệt, script tự động.

## 📚 Nguồn Dữ Liệu & Ghi Công

Dự án được xây dựng dựa trên bản gốc của **[Từ điển MinhQND](https://github.com/minhqnd/dictionary)** (CC BY-SA 4.0), kèm theo các nâng cấp mạnh mẽ:

- Bổ sung các câu ví dụ thân thiện với người học (độ bao phủ 100%).
- Chuẩn hóa và thêm phiên âm IPA.
- Sử dụng **[OVDP](https://sourceforge.net/projects/ovdp/)** để sửa đổi hơn 15,000 mục từ tiếng Anh bị lỗi.
- Dọn dẹp dữ liệu: loại bỏ nhiều từ không hợp lệ và các định nghĩa không còn sử dụng và liên quan. Chuẩn hóa và điền đầy đủ tất cả các phiên âm IPA tiếng Anh bị thiếu.

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

**Tác giả**: [Skypedia](mailto:skypediacode@gmail.com)

**📊 [Xem Thống Kê](stats.md) | 📄 [Xem Database Schema](schema.sql)**
