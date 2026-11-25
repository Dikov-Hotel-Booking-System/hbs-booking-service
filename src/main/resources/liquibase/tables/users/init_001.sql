create table users (
    id       bigint generated always as identity,
    username varchar(100) not null,
    password varchar(255) not null,
    role     varchar(20)  not null,

    constraint pk_users primary key (id),
    constraint uq_users_username unique (username),
    constraint chk_users_role check (role in ('USER', 'ADMIN'))
);

comment on table users is 'пользователи гостиничной системы и их роли';
comment on column users.id is 'идентификатор пользователя';
comment on column users.username is 'уникальный логин пользователя';
comment on column users.password is 'хэш пароля пользователя';
comment on column users.role is 'роль пользователя';
