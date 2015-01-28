CREATE TABLE users
(
	`id` INT NOT NULL AUTO_INCREMENT
	,PRIMARY KEY (id)
	,`email` VARCHAR(250) NOT NULL 
	,`password` VARCHAR(250) NOT NULL 
	,`type` VARCHAR(250) NOT NULL 
);

CREATE TABLE profiles
(
	`id` INT NOT NULL AUTO_INCREMENT
	,PRIMARY KEY (id)
	,`user_id` INT NOT NULL 
	,`first_name` VARCHAR(250) NOT NULL 
	,`last_name` VARCHAR(250) NOT NULL 
	,`address` VARCHAR(250) NULL 
	,`years_of_exprience` VARCHAR(250)  NULL 
);

CREATE TABLE mistakes
(
	`id` INT NOT NULL AUTO_INCREMENT
	,PRIMARY KEY (id)
	,`exercise_id` INT NOT NULL 
	,`desc` VARCHAR(250) NOT NULL 
	,`advise` VARCHAR(250)  NULL 
);

CREATE TABLE sequences
(
	`id` INT NOT NULL AUTO_INCREMENT
	,PRIMARY KEY (id)
	,`exercise_id` INT NOT NULL 
	,`workout_id` INT NOT NULL 
	,`order` INT NOT NULL 
	,`repeats` INT NOT NULL 
	,`duration` INT NOT NULL 
);

CREATE TABLE exercises
(
	`id` INT NOT NULL AUTO_INCREMENT
	,PRIMARY KEY (id)
	,`user_id` INT NOT NULL 
	,`type_id` INT NOT NULL 
	,`desc` VARCHAR(250)  NULL 
	,`goal` VARCHAR(250)  NULL 
);


CREATE TABLE types
(
	`id` INT NOT NULL AUTO_INCREMENT
  ,PRIMARY KEY (id)
	,`desc` VARCHAR(250)  NULL 
);

CREATE TABLE equipments
(
	`id` INT NOT NULL AUTO_INCREMENT
	,PRIMARY KEY (id)
	,`desc` VARCHAR(250)  NULL 
);

CREATE TABLE workouts
(
	`id` INT NOT NULL AUTO_INCREMENT
	,PRIMARY KEY (id)
	,`name` VARCHAR(250) NOT NULL 
	,`mom_id` INT NOT NULL 
	,`trainer_id` INT NOT NULL 
	,`timer` INT NOT NULL 
	,`status` VARCHAR(250)  NULL 
	,`start` DATETIME  NULL 
	,`end` DATETIME  NULL 
	,`focus` VARCHAR(250)  NULL 
	,`feedback_id` INT  NULL 
);

CREATE TABLE feedbacks
(
	`id` INT NOT NULL AUTO_INCREMENT
  ,PRIMARY KEY (id)
	,`workout_id` INT  NULL 
	,`mom_id` INT  NULL 
	,`feedbacks` VARCHAR(250)  NULL 
);

CREATE TABLE required_tools
(
	`id` INT NOT NULL AUTO_INCREMENT
	,PRIMARY KEY (id)
	,`exercise_id` INT NOT NULL 
	,`equipment_id` INT NOT NULL 
);


