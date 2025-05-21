CREATE TRIGGER insert_user_mahasiswa
AFTER INSERT ON mahasiswa
FOR EACH ROW
INSERT INTO User (username, password, role)
VALUES (NEW.npm, '1234', 'mahasiswa');

