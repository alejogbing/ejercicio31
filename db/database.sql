CREATE DATABASE IF NOT EXISTS family;

USE family;

CREATE TABLE person (
  id int(11) NOT NULL,
  fullname text,
  birth date DEFAULT NULL,
  father_id int(11) DEFAULT NULL,
  mother_id int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE person
  ADD PRIMARY KEY (id),
  ADD KEY padre_id (father_id),
  ADD KEY mother_id (mother_id);

ALTER TABLE person MODIFY id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE person
  ADD CONSTRAINT fk_father_id FOREIGN KEY (father_id) REFERENCES person (id),
  ADD CONSTRAINT fk_mother_id FOREIGN KEY (mother_id) REFERENCES person (id);

DESCRIBE person;

INSERT INTO `person` (`id`, `fullname`, `birth`, `father_id`, `mother_id`) VALUES (1, 'joselin garcia cubillos', '1959-01-03', NULL, NULL);
INSERT INTO `person` (`id`, `fullname`, `birth`, `father_id`, `mother_id`) VALUES (2, 'ana elba bello ramirez', '1969-06-03', NULL, NULL);
INSERT INTO `person` (`id`, `fullname`, `birth`, `father_id`, `mother_id`) VALUES (NULL, 'jose alejandro garcia bello', '1984-06-27', '1', '2');

SELECT * FROM person;