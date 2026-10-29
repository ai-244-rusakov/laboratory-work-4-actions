CREATE TABLE users
(
    user_id INTEGER NOT NULL,
    full_name VARCHAR(60) NOT NULL,
    CONSTRAINT pk_users PRIMARY KEY (user_id),
    CONSTRAINT ck_users_full_name
    CHECK (full_name ~ '^[А-ЯІЇЄ]\w+ [А-ЯІЇЄ]\w+$')
);

CREATE TABLE rehabilitants
(
    user_id INTEGER NOT NULL,
    CONSTRAINT pk_rehabilitants PRIMARY KEY (user_id),
    CONSTRAINT fk_rehabilitants_users
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE specialists
(
    user_id INTEGER NOT NULL,
    CONSTRAINT pk_specialists PRIMARY KEY (user_id),
    CONSTRAINT fk_specialists_users
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE exercises
(
    exercise_id INTEGER NOT NULL,
    exercise_name VARCHAR(60) NOT NULL,
    CONSTRAINT pk_exercises PRIMARY KEY (exercise_id)
);

CREATE TABLE reports
(
    report_id INTEGER NOT NULL,
    rehabilitant_id INTEGER NOT NULL,
    specialist_id INTEGER NOT NULL,
    period_start_date DATE NOT NULL,
    period_end_date DATE NOT NULL,
    created_date DATE NOT NULL,
    CONSTRAINT pk_reports PRIMARY KEY (report_id),
    CONSTRAINT fk_reports_rehabilitants
    FOREIGN KEY (rehabilitant_id) REFERENCES rehabilitants (user_id),
    CONSTRAINT fk_reports_specialists
    FOREIGN KEY (specialist_id) REFERENCES specialists (user_id),
    CONSTRAINT ck_reports_period
    CHECK (period_end_date >= period_start_date)
);

CREATE TABLE training_sessions
(
    session_id INTEGER NOT NULL,
    rehabilitant_id INTEGER NOT NULL,
    exercise_id INTEGER NOT NULL,
    report_id INTEGER NULL,
    session_date DATE NOT NULL,
    tempo_num INTEGER NOT NULL,
    step_tally INTEGER NOT NULL,
    stability_num INTEGER NOT NULL,
    CONSTRAINT pk_training_sessions PRIMARY KEY (session_id),
    CONSTRAINT fk_sessions_rehabilitants
    FOREIGN KEY (rehabilitant_id) REFERENCES rehabilitants (user_id),
    CONSTRAINT fk_sessions_exercises
    FOREIGN KEY (exercise_id) REFERENCES exercises (exercise_id),
    CONSTRAINT fk_sessions_reports
    FOREIGN KEY (report_id) REFERENCES reports (report_id),
    CONSTRAINT ck_sessions_tempo CHECK (tempo_num > 0),
    CONSTRAINT ck_sessions_step_tally CHECK (step_tally >= 0),
    CONSTRAINT ck_sessions_stability
    CHECK (stability_num BETWEEN 0 AND 100)
);

CREATE TABLE warnings
(
    warning_id INTEGER NOT NULL,
    session_id INTEGER NOT NULL,
    warning_status VARCHAR(30) NOT NULL,
    warning_date DATE NOT NULL,
    message VARCHAR(255) NOT NULL,
    CONSTRAINT pk_warnings PRIMARY KEY (warning_id),
    CONSTRAINT fk_warnings_sessions
    FOREIGN KEY (session_id) REFERENCES training_sessions (session_id),
    CONSTRAINT ck_warnings_status
    CHECK (warning_status ~ '^(stability_loss|tempo_deviation)$')
);