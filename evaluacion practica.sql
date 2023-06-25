-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema evaluacion_practica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema evaluacion_practica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `evaluacion_practica` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `evaluacion_practica` ;

-- -----------------------------------------------------
-- Table `evaluacion_practica`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluacion_practica`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evaluacion_practica`.`notes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluacion_practica`.`notes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `creation_date` DATE NOT NULL,
  `date_of_last_modification` DATE NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `can_delete` TINYINT NOT NULL,
  `id_user` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `notes_users_idx` (`id_user` ASC) VISIBLE,
  CONSTRAINT `notes_users`
    FOREIGN KEY (`id_user`)
    REFERENCES `evaluacion_practica`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evaluacion_practica`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluacion_practica`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evaluacion_practica`.`notes_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluacion_practica`.`notes_categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_note` INT NOT NULL,
  `id_category` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `notes_categories_note_idx` (`id_note` ASC) VISIBLE,
  INDEX `notes_categories_category_idx` (`id_category` ASC) VISIBLE,
  CONSTRAINT `notes_categories_note`
    FOREIGN KEY (`id_note`)
    REFERENCES `evaluacion_practica`.`notes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `notes_categories_category`
    FOREIGN KEY (`id_category`)
    REFERENCES `evaluacion_practica`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO users (first_name, last_name, email) VALUES 
("Lionel", "Messi", "LM10@example.com"),
("Gustavo", "Romero", "gustavoRomero@example.com"),
("Dibu", "Martinez", "dibu@example.com"),
("Ángel", "Di María", "fideo@example.com"),
("Alexis", "Mac Allister", "alexis@example.com"),
("Julián", "Álvarez", "laArania@example.com"),
("Paulo", "Dybala", "laJoya@example.com"),
("Enzo", "Fernández", "enzo@example.com"),
("Rodrigo", "De Paul", "motorcito@example.com"),
("Lisandro", "Martínez", "thebutcher@example.com");

SELECT * FROM users;


INSERT INTO categories (name) VALUES 
('Música'),
('Deportes'),
('Viajes'),
('Comida'),
('Tecnología'),
('Educación'),
('Arte'),
('Cine'),
('Literatura'),
('Moda');

INSERT INTO notes (id_user, title, creation_date, date_of_last_modification, description, can_delete) VALUES
(1, 'Nota 1', '2022-01-01', '2022-01-01', 'Descripción de la nota 1', true),
(5, 'Nota 2', '2022-02-02', '2022-02-02', 'Descripción de la nota 2', false),
(2, 'Nota 3', '2022-03-03', '2022-03-03', 'Descripción de la nota 3', true),
(2, 'Nota 4', '2022-04-04', '2022-04-04', 'Descripción de la nota 4', false),
(3, 'Nota 5', '2022-05-05', '2022-05-05', 'Descripción de la nota 5', true),
(1, 'Nota 2', '2022-02-02', '2022-02-02', 'Descripción de la nota 2', false),
(9, 'Nota 3', '2022-03-03', '2022-03-03', 'Descripción de la nota 3', true),
(7, 'Nota 4', '2022-04-04', '2022-04-04', 'Descripción de la nota 4', false),
(3, 'Nota 5', '2022-05-05', '2022-05-05', 'Descripción de la nota 5', true),
(10, 'Nota 5', '2022-05-05', '2022-05-05', 'Descripción de la nota 5', true);


INSERT INTO notes_categories (id_note, id_category) VALUES 
(1, 1),
(1, 3),
(2, 2),
(3, 1),
(3, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);


