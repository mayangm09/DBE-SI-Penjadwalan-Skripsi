# 🎓📚 Sistem Informasi Jadwal Sidang Skripsi

Sistem ini dirancang untuk mengelola **jadwal sidang skripsi mahasiswa**, termasuk pengaturan dosen penguji, ruangan, dan pengguna sistem. Proyek ini menyederhanakan alur manajemen akademik dalam proses sidang skripsi.

---

## 🗂️ Entity Relationship Diagram (ERD)

Berikut adalah diagram ERD dari sistem ini:

![ERD](./path-ke-gambar/erd.png) <!-- Ganti dengan path file ERD kamu -->

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
- `npm` (FK ke Mahasiswa) - `varchar(9)` ✅ One to One
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
