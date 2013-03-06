SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';


-- -----------------------------------------------------
-- Table `faculties`
-- -----------------------------------------------------
use expert;
CREATE  TABLE IF NOT EXISTS `faculties` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `departments`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `departments` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(50) NULL ,
  `faculties_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_department_faculty`
    FOREIGN KEY (`faculties_id` )
    REFERENCES `faculties` (`id` )
    )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `users` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL ,
  `surname` VARCHAR(45) NULL ,
  `phone` VARCHAR(45) NULL ,
  `email` VARCHAR(45) NULL ,
  `password` VARCHAR(45) NULL ,
  `photo` VARCHAR(100) NULL ,
  `departments_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_expert_department1`
    FOREIGN KEY (`departments_id` )
    REFERENCES `departments` (`id` )
    )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `professions`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `professions` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `key_word` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `users_has_professions`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `users_has_professions` (
  `users_id` INT NOT NULL ,
  `professions_id` INT NOT NULL ,
  PRIMARY KEY (`users_id`, `professions_id`) ,
  CONSTRAINT `fk_users_has_professions_users1`
    FOREIGN KEY (`users_id` )
    REFERENCES `users` (`id` ),
   
  CONSTRAINT `fk_users_has_professions_professions1`
    FOREIGN KEY (`professions_id` )
    REFERENCES `professions` (`id` )
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `articles`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `articles` (
  `id` INT NOT NULL ,
  `subject` VARCHAR(100) NULL ,
  `content` TEXT NULL ,
  `file_path` VARCHAR(100) NULL ,
  `users_id` INT NOT NULL ,
  `professions_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  CONSTRAINT `fk_articles_users1`
    FOREIGN KEY (`users_id` )
    REFERENCES `users` (`id` ),
  CONSTRAINT `fk_articles_professions1`
    FOREIGN KEY (`professions_id` )
    REFERENCES `professions` (`id` ))
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
