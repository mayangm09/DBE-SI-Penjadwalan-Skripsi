CREATE TRIGGER delete_user_dosen
AFTER DELETE ON dosen
FOR EACH ROW
DELETE FROM User WHERE username = OLD.nidn;
