CREATE VIEW view_penjadwalan AS 
SELECT 
    js.id_jadwal, 
    m.npm, 
    m.nama_mahasiswa, 
    m.program_studi, 
    js.waktu_sidang, 
    r.nama_ruangan, 
    GROUP_CONCAT(CONCAT(d.nama_dosen, ' (', ps.peran, ')') SEPARATOR '; ') AS dosen_penguji
FROM jadwal_sidang js 
JOIN mahasiswa m ON js.npm = m.npm 
JOIN ruangan r ON js.kode_ruangan = r.kode_ruangan 
JOIN penguji_sidang ps ON js.id_jadwal = ps.id_jadwal 
JOIN dosen d ON ps.nidn = d.nidn 
GROUP BY js.id_jadwal, m.npm, m.nama_mahasiswa, m.program_studi, js.waktu_sidang, r.nama_ruangan;
