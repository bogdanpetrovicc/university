create table company
(
    company_id int auto_increment
        primary key,
    name       varchar(255) null,
    address    varchar(255) null
);

create table job
(
    job_id      int auto_increment
        primary key,
    company_fk  int          not null,
    name        varchar(255) null,
    description varchar(255) null,
    constraint fk_company_job
        foreign key (company_fk) references company (company_id)
);

create table role
(
    role_id int auto_increment
        primary key,
    role    varchar(255) null
);

create table user
(
    user_id  int auto_increment
        primary key,
    role_fk  int          not null,
    username varchar(255) null,
    password varchar(255) null,
    email    varchar(255) null,
    constraint fk_user_role
        foreign key (role_fk) references role (role_id)
);

create table user_job
(
    user_job_id int auto_increment
        primary key,
    user_fk     int not null,
    job_fk      int not null,
    constraint fk_user_job_job
        foreign key (job_fk) references job (job_id),
    constraint fk_user_job_user
        foreign key (user_fk) references user (user_id)
);

