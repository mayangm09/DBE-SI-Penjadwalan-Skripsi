CREATE TABLE User (
    id_user INT(5) AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(30) NOT NULL,
    password VARCHAR(30) NOT NULL,
    role ENUM('mahasiswa', 'dosen', 'admin') NOT NULL
);
