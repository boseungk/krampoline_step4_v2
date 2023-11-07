CREATE SCHEMA IF NOT EXISTS `krampoline` DEFAULT CHARACTER SET utf8mb4;

GRANT ALL ON krampoline.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;

-- create user root@'%' identified by 'Kakao@123';
-- GRANT ALL ON krampoline.* TO 'root'@'%';




FLUSH
PRIVILEGES;

USE
`krampoline`;

create table celebrity
(
    follower_count  integer,
    celebrity_id    bigint      not null auto_increment,
    created_at      datetime(6) not null,
    modified_at     datetime(6) not null,
    name            varchar(15) not null,
    celeb_group     varchar(50),
    approval_status enum ('APPROVED','PENDING') not null,
    celeb_type      enum ('ACTOR','COMEDIAN','ETC','INFLUENCER','SINGER','SPORT') not null,
    gender          enum ('FEMALE','MALE') not null,
    profile_image   varchar(255),
    primary key (celebrity_id)
) engine=InnoDB