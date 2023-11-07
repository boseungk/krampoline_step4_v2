CREATE SCHEMA IF NOT EXISTS `krampoline` DEFAULT CHARACTER SET utf8mb4;

GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY 'root' WITH GRANT OPTION;
GRANT ALL ON krampoline.* TO 'root'@'localhost';
FLUSH PRIVILEGES;

USE `krampoline`;

SET foreign_key_checks = 0;

DROP TABLE IF EXISTS `sample_data`;
CREATE TABLE `sample_data` (
                               `id` int(11) NOT NULL AUTO_INCREMENT,
                               `detail` varchar(100) NOT NULL,
                               PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO sample_data (`id`,`detail`) VALUES ('1', 'Hello DKOS!');

DROP TABLE IF EXISTS `celebrity`;
create table `celebrity`(
    `follower_count`  integer,
    `celebrity_id`   bigint      not null auto_increment,
    `created_at`      datetime(6) not null,
    `modified_at`     datetime(6) not null,
    `name`            varchar(15) not null,
    `celeb_group`     varchar(50),
    `approval_status` enum ('APPROVED','PENDING') not null,
    `celeb_type`      enum ('ACTOR','COMEDIAN','ETC','INFLUENCER','SINGER','SPORT') not null,
    `gender`          enum ('FEMALE','MALE') not null,
    `profile_image`   varchar(255),
    primary key (`celebrity_id`)
) engine=InnoDB;

SET foreign_key_checks = 1;
