SELECT js.id_jadwal, 
GROUP_CONCAT(d.nama_dosen SEPARATOR ', ') AS nama_dosen, 
GROUP_CONCAT(ps.peran SEPARATOR ', ') AS peran  
FROM Penguji_Sidang ps  
JOIN Jadwal_Sidang js ON ps.id_jadwal = js.id_jadwal  
JOIN Dosen d ON ps.nidn = d.nidn  
GROUP BY js.id_jadwal;

