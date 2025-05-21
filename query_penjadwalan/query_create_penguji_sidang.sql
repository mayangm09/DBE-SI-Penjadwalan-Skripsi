CREATE TABLE penguji_sidang (
    id_penguji INT(5) AUTO_INCREMENT PRIMARY KEY,
    id_jadwal INT(5) NOT NULL,
    nidn VARCHAR(10) NOT NULL,
    peran ENUM('Penguji 1', 'Penguji 2') NOT NULL,
    FOREIGN KEY (id_jadwal) REFERENCES jadwal_sidang(id_jadwal) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (nidn) REFERENCES dosen(nidn) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT unique_penguji UNIQUE (id_jadwal, nidn)
);

