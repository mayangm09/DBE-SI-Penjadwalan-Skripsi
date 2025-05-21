CREATE TRIGGER update_user_dosen
AFTER UPDATE ON dosen
FOR EACH ROW
IF OLD.nidn != NEW.nidn THEN
    UPDATE user
    SET username = NEW.nidn
    WHERE username = OLD.nidn;
END IF;
