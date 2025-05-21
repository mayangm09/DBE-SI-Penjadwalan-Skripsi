CREATE TRIGGER insert_user_dosen
AFTER INSERT ON dosen
FOR EACH ROW
INSERT INTO User (username, password, role)
VALUES (NEW.nidn, '4321', 'dosen');

