CREATE TABLE jadwal_sidang (
    id_jadwal INT(5) AUTO_INCREMENT PRIMARY KEY,
    npm VARCHAR(9) NOT NULL,
    kode_ruangan CHAR(6) NOT NULL,
    waktu_sidang TIMESTAMP NOT NULL,
    FOREIGN KEY (npm) REFERENCES mahasiswa(npm)ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (kode_ruangan) REFERENCES ruangan(kode_ruangan)ON DELETE CASCADE ON UPDATE CASCADE
);
