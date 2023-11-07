CREATE SCHEMA IF NOT EXISTS `krampoline` DEFAULT CHARACTER SET utf8mb4;

GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY 'root' WITH GRANT OPTION;
GRANT ALL ON krampoline.* TO 'root'@'localhost';
FLUSH PRIVILEGES;

USE `krampoline`;

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

DROP TABLE IF EXISTS `account`;
create table `account` (
                         `balance` integer,
                         `account_id` bigint not null auto_increment,
                         `manager_id` bigint not null,
                         `post_id` bigint not null,
                         primary key (`account_id`)
) engine=InnoDB;


DROP TABLE IF EXISTS `admin`;
create table admin (
                       `member_id` bigint not null,
                       `post_id` bigint not null,
                       primary key (`member_id`, `post_id`)
) engine=InnoDB;

DROP TABLE IF EXISTS `comment`;
create table `comment` (
                         `is_deleted` bit not null,
                         `comment_id` bigint not null auto_increment,
                         `created_at` datetime(6) not null,
                         `modified_at` datetime(6) not null,
                         `post_id` bigint not null,
                         `writer_id` bigint not null,
                         `comment_order` varchar(255) not null,
                         `content` varchar(255) not null,
                         primary key (`comment_id`)
) engine=InnoDB;

DROP TABLE IF EXISTS `evidence`;
create table `evidence` (
                          `applicant_id` bigint not null,
                          `created_at` datetime(6) not null,
                          `evidence_id` bigint not null auto_increment,
                          `modified_at` datetime(6) not null,
                          `post_id` bigint not null,
                          `withdrawal_id` bigint not null,
                          `url` varchar(255) not null,
                          primary key (`evidence_id`)
) engine=InnoDB;

DROP TABLE IF EXISTS `follow`;
create table `follow` (
                        `celebrity_id` bigint not null,
                        `member_id` bigint not null,
                        primary key (`celebrity_id`, `member_id`)
) engine=InnoDB;

DROP TABLE IF EXISTS `heart`;
create table `heart` (
                       `celeb_celebrity_id` bigint,
                       `heart_id` bigint not null auto_increment,
                       `member_member_id` bigint,
                       primary key (`heart_id`)
) engine=InnoDB;

DROP TABLE IF EXISTS `member`;
create table member (
                        `created_at` datetime(6) not null,
                        `member_id` bigint not null auto_increment,
                        `modified_at` datetime(6) not null,
                        `phone_number` varchar(11),
                        `nickname` varchar(15) not null,
                        `email` varchar(50) not null,
                        `password` varchar(255) not null,
                        `profile_image` varchar(255),
                        `refresh_token` varchar(255),
                        `social_id` varchar(255),
                        `user_role` enum ('ADMIN','USER'),
                        primary key (`member_id`)
) engine=InnoDB;

DROP TABLE IF EXISTS `news`;
create table news (
                      `created_at` datetime(6) not null,
                      `modified_at` datetime(6) not null,
                      `news_id` bigint not null auto_increment,
                      `post_id` bigint not null,
                      `writer_id` bigint not null,
                      `title` varchar(100) not null,
                      `content` TEXT not null,
                      `image_urls` varchar(255),
                      primary key (`news_id`)
) engine=InnoDB;

DROP TABLE IF EXISTS `payment`;
create table `payment` (
                         `amount` integer not null,
                         `created_at` datetime(6) not null,
                         `member_member_id` bigint,
                         `modified_at` datetime(6) not null,
                         `payment_id` bigint not null auto_increment,
                         `post_post_id` bigint,
                         `imp_uid` varchar(255),
                         primary key (`payment_id`)
) engine=InnoDB;

DROP TABLE IF EXISTS `post`;
create table post (
                      `participants` integer check (`participants`>=0),
                      target_price integer check (`target_price`>=1000),
                      `account_account_id` bigint,
                      `celebrity_celebrity_id` bigint,
                      `created_at` datetime(6) not null,
                      `deadline` datetime(6),
                      `modified_at` datetime(6) not null,
                      `post_id` bigint not null auto_increment,
                      `writer_member_id` bigint,
                      `title` varchar(100) not null,
                      `introduction` TEXT not null,
                      `post_status` enum ('CLOSED','COMPLETE','ONGOING'),
                      `thumbnail` varchar(255),
                      primary key (`post_id`)
) engine=InnoDB;

DROP TABLE IF EXISTS `withdrawal`;
create table withdrawal (
                            `balance` integer check (`balance`>=0),
                            `is_approved` bit not null,
                            `withdrawal_amount` integer not null check (`withdrawal_amount`>=0),
                            `applicant_id` bigint not null,
                            `created_at` datetime(6) not null,
                            `modified_at` datetime(6) not null,
                            `post_id` bigint not null,
                            `withdrawal_id` bigint not null auto_increment,
                            `deposit_account` varchar(255) not null,
                            `purpose` varchar(255) not null,
                            primary key (`withdrawal_id`)
) engine=InnoDB;
