# 🎓📚 Sistem Informasi Jadwal Sidang Skripsi

Sistem ini dirancang untuk mengelola **jadwal sidang skripsi mahasiswa**, termasuk menentukan peran dosen penguji, ruangan, dan pendataan mahasiswa. Proyek ini menyederhanakan alur manajemen akademik dalam proses sidang skripsi.

---

## 🗂️ Entity Relationship Diagram (ERD)

Berikut adalah diagram ERD dari sistem ini:

![SI Penjadwalan Skripsi Otomatis drawio](https://github.com/user-attachments/assets/ebbed26f-d0e2-41db-8368-d65c5a9c3265)


---

## 🛠️ Struktur Tabel

### 🧑‍🎓 Mahasiswa
- `npm` (PK) - `varchar(9)`
- `nama_mahasiswa` - `varchar(50)`
- `program_studi` - `enum`
- `judul_skripsi` - `varchar(150)`
- `email` - `varchar(30)`

---

### 👤 User
- `id_user` (PK) - `int(5)`
- `username` - `varchar(30)`
- `password` - `varchar(30)`
- `role` - `enum` (`mahasiswa`, `dosen`, `admin`)

---

### 👨‍🏫 Dosen
- `nidn` (PK) - `varchar(10)`
- `nama_dosen` - `varchar(100)`
- `program_studi` - `enum`
- `email` - `varchar(30)`

---

### 🗓️ Jadwal_Sidang
- `id_jadwal` (PK) - `int(5)`
- `npm` (FK ke Mahasiswa) - `varchar(9)` 
- `kode_ruangan` (FK ke Ruangan) - `char(6)`
- `waktu_sidang` - `timestamp`

---

### 🏢 Ruangan
- `kode_ruangan` (PK) - `char(6)`
- `nama_ruangan` - `varchar(40)`

---

### 🧑‍⚖️ Penguji_Sidang
- `id_penguji` (PK) - `int(5)`
- `id_jadwal` (FK ke Jadwal_Sidang) - `int(5)`
- `nidn` (FK ke Dosen) - `varchar(10)`
- `peran` - `enum` (`ketua`, `anggota1`, `anggota2`)

---

## 🔗 Relasi Antar Tabel

| Relasi | Tipe Relasi | Penjelasan |
|--------|-------------|------------|
| `Mahasiswa ↔ Jadwal_Sidang` | **One to One** | Satu mahasiswa hanya punya satu jadwal sidang |
| `Jadwal_Sidang ↔ Penguji_Sidang` | **One to Many** | Satu jadwal bisa memiliki banyak penguji |
| `Dosen ↔ Penguji_Sidang` | **One to Many** | Satu dosen bisa menguji beberapa sidang |
| `Ruangan ↔ Jadwal_Sidang` | **One to Many** | Satu ruangan bisa digunakan beberapa kali untuk sidang berbeda |
| `User ↔ Mahasiswa / Dosen` | **One to One** | Diasumsikan satu user hanya mewakili satu entitas (mahasiswa atau dosen) |

---
# 📚 Dokumentasi Skrip SQL - Sistem Penjadwalan Sidang Skripsi

Dokumentasi ini menjelaskan struktur database dan penggunaan perintah SQL dalam sistem penjadwalan sidang skripsi. Sistem ini membantu mengelola data mahasiswa, dosen, jadwal sidang, dan penguji secara otomatis dan konsisten.

---

## 🧱 1. CREATE TABLE – Membuat Struktur Tabel

Perintah `CREATE TABLE` digunakan untuk membuat tabel-tabel utama dalam database. Setiap tabel menyimpan data yang berbeda-beda dan saling terhubung melalui **primary key** dan **foreign key**.

- 🔑 **Primary key**: kolom unik sebagai identitas data (misal: NPM, NIDN, id_jadwal).
- 🔗 **Foreign key**: kolom yang mengacu pada tabel lain agar data tetap konsisten.

Contoh:

### 👤 User – Menyimpan akun login
```sql
CREATE TABLE User (
    id_user INT(5) AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(30) NOT NULL,
    password VARCHAR(30) NOT NULL,
    role ENUM('mahasiswa', 'dosen', 'admin') NOT NULL
);
```

### 🎓 Mahasiswa – Data mahasiswa dan judul skripsi
```sql
CREATE TABLE mahasiswa (
    npm VARCHAR(9) PRIMARY KEY,
    nama_mahasiswa VARCHAR(50) NOT NULL,
    program_studi ENUM (...),
    judul_skripsi VARCHAR(150) NOT NULL,
    email VARCHAR(30) NOT NULL
);
```

### 👨‍🏫 Dosen – Data dosen penguji
```sql
CREATE TABLE dosen (
    nidn VARCHAR(10) PRIMARY KEY,
    nama_dosen VARCHAR(100) NOT NULL,
    program_studi ENUM (...),
    email VARCHAR(30) NOT NULL
);
```

### 🏢 Ruangan – Daftar ruangan untuk sidang
```sql
CREATE TABLE ruangan (
    kode_ruangan CHAR(6) PRIMARY KEY,
    nama_ruangan VARCHAR(40) NOT NULL
);
```

### 🗓️ Jadwal Sidang – Menyimpan informasi waktu dan tempat sidang
```sql
CREATE TABLE jadwal_sidang (
    id_jadwal INT(5) AUTO_INCREMENT PRIMARY KEY,
    npm VARCHAR(9) NOT NULL,
    kode_ruangan CHAR(6) NOT NULL,
    waktu_sidang TIMESTAMP NOT NULL,
    FOREIGN KEY (npm) REFERENCES mahasiswa(npm),
    FOREIGN KEY (kode_ruangan) REFERENCES ruangan(kode_ruangan)
);
```

### 🧑‍⚖️ Penguji Sidang – Menyimpan dosen penguji dan perannya
```sql
CREATE TABLE penguji_sidang (
    id_penguji INT(5) AUTO_INCREMENT PRIMARY KEY,
    id_jadwal INT(5) NOT NULL,
    nidn VARCHAR(10) NOT NULL,
    peran ENUM('Penguji 1', 'Penguji 2') NOT NULL,
    FOREIGN KEY (id_jadwal) REFERENCES jadwal_sidang(id_jadwal),
    FOREIGN KEY (nidn) REFERENCES dosen(nidn),
    CONSTRAINT unique_penguji UNIQUE (id_jadwal, nidn)
);
```

---

## ⚙️ 2. TRIGGER – Menjaga Otomatisasi & Konsistensi Data

`TRIGGER` digunakan untuk melakukan **aksi otomatis** ketika data **ditambahkan**, **diperbarui**, atau **dihapus**. Dalam sistem ini, trigger digunakan agar:

- Saat **mahasiswa atau dosen baru** ditambahkan, akun di tabel `User` langsung dibuat.
- Saat **data berubah** (NPM/NIDN), username di tabel `User` ikut diperbarui.
- Saat **data dihapus**, akun `User` terkait ikut dihapus juga.

### ➕ INSERT Trigger
```sql
CREATE TRIGGER insert_user_mahasiswa
AFTER INSERT ON mahasiswa
FOR EACH ROW
INSERT INTO User (username, password, role)
VALUES (NEW.npm, '1234', 'mahasiswa');
```

```sql
CREATE TRIGGER insert_user_dosen
AFTER INSERT ON dosen
FOR EACH ROW
INSERT INTO User (username, password, role)
VALUES (NEW.nidn, '4321', 'dosen');
```

### 🔄 UPDATE Trigger
```sql
CREATE TRIGGER update_user_mahasiswa
AFTER UPDATE ON mahasiswa
FOR EACH ROW
IF OLD.npm != NEW.npm THEN
    UPDATE User
    SET username = NEW.npm
    WHERE username = OLD.npm;
END IF;
```

```sql
CREATE TRIGGER update_user_dosen
AFTER UPDATE ON dosen
FOR EACH ROW
IF OLD.nidn != NEW.nidn THEN
    UPDATE User
    SET username = NEW.nidn
    WHERE username = OLD.nidn;
END IF;
```

### ❌ DELETE Trigger
```sql
CREATE TRIGGER delete_user_mahasiswa
AFTER DELETE ON mahasiswa
FOR EACH ROW
DELETE FROM User WHERE username = OLD.npm;
```

```sql
CREATE TRIGGER delete_user_dosen
AFTER DELETE ON dosen
FOR EACH ROW
DELETE FROM User WHERE username = OLD.nidn;
```

---

## 📝 3. INSERT DATA – Menambahkan Data Awal

Untuk keperluan testing atau demo, berikut contoh perintah `INSERT`:

### 👨‍🎓 Mahasiswa
```sql
INSERT INTO mahasiswa VALUES
('230102067', 'Rafi Akbar', 'D3 Teknik Informatika', 'Prediksi Harga Saham', 'rafi.akbar@gmail.com');
```

### 👨‍🏫 Dosen
```sql
INSERT INTO dosen VALUES
('10111213', 'Dr. Budi Santoso', 'D3 Teknik Informatika', 'budi.santoso@kampus.ac.id');
```

### 🔐 Admin
```sql
INSERT INTO User (username, password, role) VALUES
('admin', '5678', 'admin');
```

---

## 🔗 4. JOIN – Menggabungkan Data dari Beberapa Tabel

`JOIN` digunakan untuk menampilkan data gabungan dari beberapa tabel, misalnya untuk keperluan **laporan sidang**.

### 📅 Jadwal Sidang + Mahasiswa + Ruangan
```sql
SELECT js.id_jadwal, m.nama_mahasiswa, r.nama_ruangan, js.waktu_sidang 
FROM Jadwal_Sidang js 
JOIN Mahasiswa m ON js.npm = m.npm 
JOIN Ruangan r ON js.kode_ruangan = r.kode_ruangan;
```

### 👨‍🏫 Penguji Sidang
```sql
SELECT js.id_jadwal, 
GROUP_CONCAT(d.nama_dosen SEPARATOR ', ') AS nama_dosen, 
GROUP_CONCAT(ps.peran SEPARATOR ', ') AS peran  
FROM Penguji_Sidang ps  
JOIN Jadwal_Sidang js ON ps.id_jadwal = js.id_jadwal  
JOIN Dosen d ON ps.nidn = d.nidn  
GROUP BY js.id_jadwal;
```

### 🧾 Penjadwalan Lengkap
```sql
SELECT js.id_jadwal, m.npm, m.nama_mahasiswa, m.program_studi, js.waktu_sidang, r.nama_ruangan, 
GROUP_CONCAT(CONCAT(d.nama_dosen, ' (', ps.peran, ')') SEPARATOR '; ') AS dosen_penguji
FROM jadwal_sidang js 
JOIN mahasiswa m ON js.npm = m.npm 
JOIN ruangan r ON js.kode_ruangan = r.kode_ruangan 
JOIN penguji_sidang ps ON js.id_jadwal = ps.id_jadwal 
JOIN dosen d ON ps.nidn = d.nidn 
GROUP BY js.id_jadwal, m.npm, m.nama_mahasiswa, m.program_studi, js.waktu_sidang, r.nama_ruangan;
```

---

## 👁️ 5. VIEW – Menyimpan Query sebagai Tampilan Virtual

`VIEW` berfungsi menyimpan hasil `JOIN` sebagai tampilan virtual agar query lebih praktis dipanggil.

### View Jadwal Sidang
```sql
CREATE VIEW view_jadwal_sidang AS 
SELECT js.id_jadwal, m.nama_mahasiswa, r.nama_ruangan, js.waktu_sidang 
FROM Jadwal_Sidang js 
JOIN Mahasiswa m ON js.npm = m.npm 
JOIN Ruangan r ON js.kode_ruangan = r.kode_ruangan;
```

### View Penguji Sidang
```sql
CREATE VIEW view_penguji_sidang AS 
SELECT js.id_jadwal, 
GROUP_CONCAT(d.nama_dosen SEPARATOR ', ') AS nama_dosen, 
GROUP_CONCAT(ps.peran SEPARATOR ', ') AS peran  
FROM Penguji_Sidang ps  
JOIN Jadwal_Sidang js ON ps.id_jadwal = js.id_jadwal  
JOIN Dosen d ON ps.nidn = d.nidn  
GROUP BY js.id_jadwal;
```

### View Penjadwalan Lengkap
```sql
CREATE VIEW view_penjadwalan AS 
SELECT js.id_jadwal, m.npm, m.nama_mahasiswa, m.program_studi, js.waktu_sidang, r.nama_ruangan, 
GROUP_CONCAT(CONCAT(d.nama_dosen, ' (', ps.peran, ')') SEPARATOR '; ') AS dosen_penguji
FROM jadwal_sidang js 
JOIN mahasiswa m ON js.npm = m.npm 
JOIN ruangan r ON js.kode_ruangan = r.kode_ruangan 
JOIN penguji_sidang ps ON js.id_jadwal = ps.id_jadwal 
JOIN dosen d ON ps.nidn = d.nidn 
GROUP BY js.id_jadwal, m.npm, m.nama_mahasiswa, m.program_studi, js.waktu_sidang, r.nama_ruangan;
```

---

## 📌 Penutup

✅ Sistem ini mendukung pengelolaan sidang yang terstruktur dan otomatis.  
🛠️ Dengan **TRIGGER**, **JOIN**, dan **VIEW**, pengelolaan data lebih efisien dan minim kesalahan.  

---



