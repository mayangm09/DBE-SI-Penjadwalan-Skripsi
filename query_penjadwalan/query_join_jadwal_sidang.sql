SELECT js.id_jadwal, m.nama_mahasiswa, r.nama_ruangan, js.waktu_sidang 
FROM Jadwal_Sidang js JOIN Mahasiswa m ON js.npm = m.npm JOIN Ruangan r ON js.kode_ruangan = r.kode_ruangan;
