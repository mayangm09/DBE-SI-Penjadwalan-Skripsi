CREATE TRIGGER delete_user_mahasiswa
AFTER DELETE ON mahasiswa
FOR EACH ROW
DELETE FROM User WHERE username = OLD.npm;
