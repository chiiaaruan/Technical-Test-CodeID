-- Table: Data Owner
-- Description: Stores owner information

CREATE TABLE codeid.data_owner (
    do_id BIGSERIAL PRIMARY KEY,
    do_name VARCHAR(100),
    do_phone_number VARCHAR(20)
);




-- Table: Data Kavling
-- Description: Stores land/lot ownership information

CREATE TABLE codeid.data_kavling (
    dk_id BIGSERIAL PRIMARY KEY,
    dk_do_id BIGINT,
    dk_block VARCHAR(1),
    dk_number INT,
    dk_land_area INT,
    dk_status VARCHAR(30)
);





-- Table: Data Iuran
-- Description: Stores contribution fee master data

CREATE TABLE codeid.data_iuran (
    di_id BIGSERIAL PRIMARY KEY,
    di_kav_status VARCHAR(30),
    di_cntb_type VARCHAR(30),
    di_cntb_rate NUMERIC(15,2)
);




-- Table: Data Pembayaran
-- Description: Stores payment transactions

CREATE TABLE codeid.data_pembayaran (
    dp_id BIGSERIAL PRIMARY KEY,
    dp_do_id BIGINT,
    dp_pay_type VARCHAR(20),
    dp_pay_date DATE,
    dp_pay_total NUMERIC(15,2),
    dp_desc VARCHAR(255)
);




-- Table: Detail Pembayaran
-- Description: Stores payment details per lot and period

CREATE TABLE codeid.detail_pembayaran (
    dep_id BIGSERIAL PRIMARY KEY,
    dep_dp_id BIGINT,
    dep_dk_id BIGINT,
    dep_period_month INT,
    dep_period_year INT,
    dep_fee_type VARCHAR(30),
    dep_amount NUMERIC(15,2)
);




-- Table: Data Pengeluaran
-- Description: Stores expense transactions

CREATE TABLE codeid.data_pengeluaran (
    dpe_id BIGSERIAL PRIMARY KEY,
    dpe_exp_type VARCHAR(50),
    dpe_exp_date DATE,
    dpe_exp_total NUMERIC(15,2),
    dpe_exp_desc VARCHAR(255)
);