CREATE TABLE mahasiswa (
    npm VARCHAR(9) PRIMARY KEY,
    nama_mahasiswa VARCHAR(50) NOT NULL,
    program_studi ENUM (
        'D3 Teknik Elektronika',
        'D3 Teknik Listrik',
        'D3 Teknik Informatika',
        'D3 Teknik Mesin',
        'D4 Teknik Pengendalian Pencemaran Lingkungan',
        'D4 Pengembangan Produk Agroindustri',
        'D4 Teknologi Rekayasa Energi Terbarukan',
        'D4 Rekayasa Kimia Industri',
        'D4 Teknologi Rekayasa Mekatronika',
        'D4 Rekayasa Keamanan Siber',
        'D4 Teknologi Rekayasa Multimedia',
        'D4 Akuntansi Lembaga Keuangan Syariah',
        'D4 Rekayasa Perangkat Lunak'
    ) NOT NULL,
    judul_skripsi VARCHAR(150) NOT NULL,
    email VARCHAR(30) NOT NULL
);
