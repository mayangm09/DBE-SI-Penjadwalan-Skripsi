/*
 Navicat MySQL Dump SQL

 Source Server         : koneksi
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : penjadwalan_sidang

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 17/05/2025 14:45:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dosen
-- ----------------------------
DROP TABLE IF EXISTS `dosen`;
CREATE TABLE `dosen`  (
  `nidn` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama_dosen` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `program_studi` enum('D3 Teknik Elektronika','D3 Teknik Listrik','D3 Teknik Informatika','D3 Teknik Mesin','D4 Teknik Pengendalian Pencemaran Lingkungan','D4 Pengembangan Produk Agroindustri','D4 Teknologi Rekayasa Energi Terbarukan','D4 Rekayasa Kimia Industri','D4 Teknologi Rekayasa Mekatronika','D4 Rekayasa Keamanan Siber','D4 Teknologi Rekayasa Multimedia','D4 Akuntansi Lembaga Keuangan Syariah','D4 Rekayasa Perangkat Lunak') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`nidn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dosen
-- ----------------------------
INSERT INTO `dosen` VALUES ('1001001001', 'Hendra Saputra', 'D3 Teknik Informatika', 'hendra.saputra@gmail.com');
INSERT INTO `dosen` VALUES ('1001001002', 'Laras Wulandari', 'D4 Rekayasa Perangkat Lunak', 'laras.wulandari@gmail.com');
INSERT INTO `dosen` VALUES ('1001001003', 'Bambang Wijaya', 'D4 Rekayasa Keamanan Siber', 'bambang.wijaya@gmail.com');
INSERT INTO `dosen` VALUES ('1001001004', 'Siti Nurhaliza', 'D4 Rekayasa Perangkat Lunak', 'siti.nurhaliza@gmail.com');
INSERT INTO `dosen` VALUES ('1001001005', 'Santika Dewi', 'D4 Rekayasa Keamanan Siber', 'santika.dewi@gmail.com');
INSERT INTO `dosen` VALUES ('1001001006', 'Yoga Prasetyo', 'D3 Teknik Informatika', 'yoga.prasetyo@gmail.com');

-- ----------------------------
-- Table structure for jadwal_sidang
-- ----------------------------
DROP TABLE IF EXISTS `jadwal_sidang`;
CREATE TABLE `jadwal_sidang`  (
  `id_jadwal` int NOT NULL AUTO_INCREMENT,
  `npm` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `kode_ruangan` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `waktu_sidang` timestamp NOT NULL,
  PRIMARY KEY (`id_jadwal`) USING BTREE,
  INDEX `npm`(`npm` ASC) USING BTREE,
  INDEX `kode_ruangan`(`kode_ruangan` ASC) USING BTREE,
  CONSTRAINT `jadwal_sidang_ibfk_1` FOREIGN KEY (`npm`) REFERENCES `mahasiswa` (`npm`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jadwal_sidang_ibfk_2` FOREIGN KEY (`kode_ruangan`) REFERENCES `ruangan` (`kode_ruangan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jadwal_sidang
-- ----------------------------
INSERT INTO `jadwal_sidang` VALUES (1, '230102050', 'J.5.3', '2024-03-05 09:00:00');
INSERT INTO `jadwal_sidang` VALUES (2, '230102053', 'I.1.3', '2024-03-12 10:30:00');
INSERT INTO `jadwal_sidang` VALUES (3, '230102063', 'I.3.5', '2024-03-19 13:00:00');
INSERT INTO `jadwal_sidang` VALUES (4, '230102064', 'J.4.1', '2024-03-26 08:30:00');
INSERT INTO `jadwal_sidang` VALUES (5, '230102065', 'I.4.2', '2024-04-02 14:00:00');
INSERT INTO `jadwal_sidang` VALUES (6, '230102067', 'J.5.5', '2024-04-09 10:00:00');

-- ----------------------------
-- Table structure for mahasiswa
-- ----------------------------
DROP TABLE IF EXISTS `mahasiswa`;
CREATE TABLE `mahasiswa`  (
  `npm` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama_mahasiswa` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `program_studi` enum('D3 Teknik Elektronika','D3 Teknik Listrik','D3 Teknik Informatika','D3 Teknik Mesin','D4 Teknik Pengendalian Pencemaran Lingkungan','D4 Pengembangan Produk Agroindustri','D4 Teknologi Rekayasa Energi Terbarukan','D4 Rekayasa Kimia Industri','D4 Teknologi Rekayasa Mekatronika','D4 Rekayasa Keamanan Siber','D4 Teknologi Rekayasa Multimedia','D4 Akuntansi Lembaga Keuangan Syariah','D4 Rekayasa Perangkat Lunak') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `judul_skripsi` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`npm`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mahasiswa
-- ----------------------------
INSERT INTO `mahasiswa` VALUES ('230102050', 'Fikri Ramadhan', 'D4 Rekayasa Keamanan Siber', 'Optimasi Algoritma K-Means dalam Analisis Data Multimedia', 'fikri.ramadhan@gmail.com');
INSERT INTO `mahasiswa` VALUES ('230102053', 'Dina Ayu', 'D3 Teknik Informatika', 'Desain dan Implementasi Smart Grid Berbasis Energi Terbarukan Menggunakan Machine Learning', 'dina.ayu@gmail.com');
INSERT INTO `mahasiswa` VALUES ('230102063', 'Dimas Pratama', 'D4 Rekayasa Perangkat Lunak', 'Pengembangan Sistem Pendingin Otomatis Berbasis IoT pada Mesin CNC', 'dimas.pratama@gmail.com');
INSERT INTO `mahasiswa` VALUES ('230102064', 'Aulia Zahra', 'D4 Akuntansi Lembaga Keuangan Syariah', 'Analisis Implementasi IoT dalam Efisiensi Konsumsi Daya Listrik pada Lembaga Keuangan Syariah', 'aulia.zahra@gmail.com');
INSERT INTO `mahasiswa` VALUES ('230102065', 'Nadia Putri', 'D4 Rekayasa Keamanan Siber', 'Analisis Keamanan Jaringan Menggunakan Intrusion Detection System (IDS)', 'nadia.putri@gmail.com');
INSERT INTO `mahasiswa` VALUES ('230102067', 'Rafi Akbar', 'D3 Teknik Informatika', 'Penerapan Machine Learning untuk Prediksi Harga Saham', 'rafi.akbar@gmail.com');

-- ----------------------------
-- Table structure for penguji_sidang
-- ----------------------------
DROP TABLE IF EXISTS `penguji_sidang`;
CREATE TABLE `penguji_sidang`  (
  `id_penguji` int NOT NULL AUTO_INCREMENT,
  `id_jadwal` int NOT NULL,
  `nidn` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `peran` enum('Penguji 1','Penguji 2') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_penguji`) USING BTREE,
  UNIQUE INDEX `unique_penguji`(`id_jadwal` ASC, `nidn` ASC) USING BTREE,
  INDEX `nidn`(`nidn` ASC) USING BTREE,
  CONSTRAINT `penguji_sidang_ibfk_1` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal_sidang` (`id_jadwal`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `penguji_sidang_ibfk_2` FOREIGN KEY (`nidn`) REFERENCES `dosen` (`nidn`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of penguji_sidang
-- ----------------------------
INSERT INTO `penguji_sidang` VALUES (1, 1, '1001001003', 'Penguji 1');
INSERT INTO `penguji_sidang` VALUES (2, 1, '1001001005', 'Penguji 2');
INSERT INTO `penguji_sidang` VALUES (3, 2, '1001001001', 'Penguji 1');
INSERT INTO `penguji_sidang` VALUES (4, 2, '1001001006', 'Penguji 2');
INSERT INTO `penguji_sidang` VALUES (5, 3, '1001001002', 'Penguji 1');
INSERT INTO `penguji_sidang` VALUES (6, 3, '1001001004', 'Penguji 2');

-- ----------------------------
-- Table structure for ruangan
-- ----------------------------
DROP TABLE IF EXISTS `ruangan`;
CREATE TABLE `ruangan`  (
  `kode_ruangan` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama_ruangan` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`kode_ruangan`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ruangan
-- ----------------------------
INSERT INTO `ruangan` VALUES ('I.1.3', 'Lab Jaringan');
INSERT INTO `ruangan` VALUES ('I.3.5', 'Lab Komputer');
INSERT INTO `ruangan` VALUES ('I.4.2', 'Lab Desain Grafis');
INSERT INTO `ruangan` VALUES ('J.4.1', 'Lab Sistem Informasi');
INSERT INTO `ruangan` VALUES ('J.5.3', 'Ruangan Teori');
INSERT INTO `ruangan` VALUES ('J.5.5', 'Ruangan Teori');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role` enum('mahasiswa','dosen','admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '230102067', '1234', 'mahasiswa');
INSERT INTO `user` VALUES (2, '230102065', '1234', 'mahasiswa');
INSERT INTO `user` VALUES (3, '230102063', '1234', 'mahasiswa');
INSERT INTO `user` VALUES (4, '230102064', '1234', 'mahasiswa');
INSERT INTO `user` VALUES (5, '230102050', '1234', 'mahasiswa');
INSERT INTO `user` VALUES (6, '230102053', '1234', 'mahasiswa');
INSERT INTO `user` VALUES (7, 'admin', '5678', 'admin');
INSERT INTO `user` VALUES (8, '1001001001', '4321', 'dosen');
INSERT INTO `user` VALUES (9, '1001001002', '4321', 'dosen');
INSERT INTO `user` VALUES (10, '1001001003', '4321', 'dosen');
INSERT INTO `user` VALUES (11, '1001001004', '4321', 'dosen');
INSERT INTO `user` VALUES (12, '1001001005', '4321', 'dosen');
INSERT INTO `user` VALUES (13, '1001001006', '4321', 'dosen');

-- ----------------------------
-- View structure for view_jadwal_sidang
-- ----------------------------
DROP VIEW IF EXISTS `view_jadwal_sidang`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_jadwal_sidang` AS select `js`.`id_jadwal` AS `id_jadwal`,`m`.`nama_mahasiswa` AS `nama_mahasiswa`,`r`.`nama_ruangan` AS `nama_ruangan`,`js`.`waktu_sidang` AS `waktu_sidang` from ((`jadwal_sidang` `js` join `mahasiswa` `m` on((`js`.`npm` = `m`.`npm`))) join `ruangan` `r` on((`js`.`kode_ruangan` = `r`.`kode_ruangan`)));

-- ----------------------------
-- View structure for view_penguji_sidang
-- ----------------------------
DROP VIEW IF EXISTS `view_penguji_sidang`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_penguji_sidang` AS select `js`.`id_jadwal` AS `id_jadwal`,group_concat(`d`.`nama_dosen` separator ', ') AS `nama_dosen`,group_concat(`ps`.`peran` separator ', ') AS `peran` from ((`penguji_sidang` `ps` join `jadwal_sidang` `js` on((`ps`.`id_jadwal` = `js`.`id_jadwal`))) join `dosen` `d` on((`ps`.`nidn` = `d`.`nidn`))) group by `js`.`id_jadwal`;

-- ----------------------------
-- View structure for view_penjadwalan
-- ----------------------------
DROP VIEW IF EXISTS `view_penjadwalan`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `view_penjadwalan` AS select `js`.`id_jadwal` AS `id_jadwal`,`m`.`npm` AS `npm`,`m`.`nama_mahasiswa` AS `nama_mahasiswa`,`m`.`program_studi` AS `program_studi`,`js`.`waktu_sidang` AS `waktu_sidang`,`r`.`nama_ruangan` AS `nama_ruangan`,group_concat(concat(`d`.`nama_dosen`,' (',`ps`.`peran`,')') separator '; ') AS `dosen_penguji` from ((((`jadwal_sidang` `js` join `mahasiswa` `m` on((`js`.`npm` = `m`.`npm`))) join `ruangan` `r` on((`js`.`kode_ruangan` = `r`.`kode_ruangan`))) join `penguji_sidang` `ps` on((`js`.`id_jadwal` = `ps`.`id_jadwal`))) join `dosen` `d` on((`ps`.`nidn` = `d`.`nidn`))) group by `js`.`id_jadwal`,`m`.`npm`,`m`.`nama_mahasiswa`,`m`.`program_studi`,`js`.`waktu_sidang`,`r`.`nama_ruangan`;

-- ----------------------------
-- Triggers structure for table dosen
-- ----------------------------
DROP TRIGGER IF EXISTS `insert_user_dosen`;
delimiter ;;
CREATE TRIGGER `insert_user_dosen` AFTER INSERT ON `dosen` FOR EACH ROW INSERT INTO User (username, password, role)
VALUES (NEW.nidn, '4321', 'dosen')
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table dosen
-- ----------------------------
DROP TRIGGER IF EXISTS `update_user_dosen`;
delimiter ;;
CREATE TRIGGER `update_user_dosen` AFTER UPDATE ON `dosen` FOR EACH ROW IF OLD.nidn != NEW.nidn THEN
    UPDATE user
    SET username = NEW.nidn
    WHERE username = OLD.nidn;
END IF
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table dosen
-- ----------------------------
DROP TRIGGER IF EXISTS `delete_user_dosen`;
delimiter ;;
CREATE TRIGGER `delete_user_dosen` AFTER DELETE ON `dosen` FOR EACH ROW DELETE FROM User WHERE username = OLD.nidn
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table mahasiswa
-- ----------------------------
DROP TRIGGER IF EXISTS `insert_user_mahasiswa`;
delimiter ;;
CREATE TRIGGER `insert_user_mahasiswa` AFTER INSERT ON `mahasiswa` FOR EACH ROW INSERT INTO User (username, password, role)
VALUES (NEW.npm, '1234', 'mahasiswa')
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table mahasiswa
-- ----------------------------
DROP TRIGGER IF EXISTS `update_user_mahasiswa`;
delimiter ;;
CREATE TRIGGER `update_user_mahasiswa` AFTER UPDATE ON `mahasiswa` FOR EACH ROW IF OLD.npm != NEW.npm THEN
    UPDATE User
    SET username = NEW.npm
    WHERE username = OLD.npm;
END IF
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table mahasiswa
-- ----------------------------
DROP TRIGGER IF EXISTS `delete_user_mahasiswa`;
delimiter ;;
CREATE TRIGGER `delete_user_mahasiswa` AFTER DELETE ON `mahasiswa` FOR EACH ROW DELETE FROM User WHERE username = OLD.npm
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
