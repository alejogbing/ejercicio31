USE family;

DELIMITER $$
USE `family`$$

CREATE PROCEDURE `personAddOrEdit` (
  IN _id INT,
  IN _fullname text,
  IN _birth date,
  IN _father_id INT,
  IN _mother_id INT
)
BEGIN 
  IF _id = 0 THEN
    INSERT INTO person (fullname, birth, father_id, mother_id)
    VALUES (_fullname, _birth, _father_id, _mother_id);

    SET _id = LAST_INSERT_ID();
  ELSE
    UPDATE person 
    SET
	fullname = _fullname, 
	birth = _birth, 
	father_id = _father_id, 
	mother_id =  mother_id
    WHERE id = _id;
  END IF;

  SELECT _id AS 'id';
END
