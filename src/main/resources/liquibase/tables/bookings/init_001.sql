create table bookings (
    id         bigint generated always as identity,
    user_id    bigint      not null,
    room_id    bigint      not null,
    request_id uuid        not null,
    start_date date        not null,
    end_date   date        not null,
    status     varchar(20) not null,
    created_at timestamp   not null default now(),

    constraint pk_bookings primary key (id),
    constraint fk_bookings_users foreign key (user_id) references users (id),
    constraint uq_bookings_user_request unique (user_id, request_id),
    constraint chk_bookings_dates check (start_date < end_date),
    constraint chk_bookings_status check (status in ('PENDING', 'CONFIRMED', 'CANCELLED'))
);

comment on table bookings is 'брони пользователей с датами проживания и статусами';
comment on column bookings.id is 'идентификатор брони';
comment on column bookings.user_id is 'идентификатор пользователя, которому принадлежит бронь';
comment on column bookings.room_id is 'идентификатор номера в hbs-hotel-service';
comment on column bookings.request_id is 'идентификатор запроса для защиты от повторного создания брони';
comment on column bookings.start_date is 'дата заезда, включается в период брони';
comment on column bookings.end_date is 'дата выезда, исключается из периода брони';
comment on column bookings.status is 'текущее состояние бронирования';
comment on column bookings.created_at is 'дата и время создания брони';
