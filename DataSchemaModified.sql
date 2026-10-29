create table users
(
user_id INTEGER NOT NULL,
full_name  VARCHAR(60) NOT NULL,
CONSTRAINT pk_users PRIMARY KEY (user_id),
CONSTRAINT ck_users_full_name
    check (full_name ~ '^[A-ZА-ЯІЇЄ][a-zа-яіїє]+ [A-ZА-ЯІЇЄ][a-zа-яіїє]+$')
)

create table rehabilitants
(
user_id INTEGER NOT NULL,
CONSTRAINT pk_rehabilitants PRIMARY KEY (user_id),
CONSTRAINT fk_rehabilitants_users FOREIGN KEY (user_id)
    references users (user_id)
)
