CREATE TRIGGER update_user_mahasiswa
AFTER UPDATE ON Mahasiswa
FOR EACH ROW
IF OLD.npm != NEW.npm THEN
    UPDATE User
    SET username = NEW.npm
    WHERE username = OLD.npm;
END IF;
