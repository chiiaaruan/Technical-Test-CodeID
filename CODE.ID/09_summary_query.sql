--Task 2.1. Laporan Pemasukkan dan Pengeluaran Per Bulan secara Summary
SELECT 
    COALESCE(p.periode, e.periode) AS periode,
    COALESCE(p.total_pemasukan, 0) AS pemasukan,
    COALESCE(e.total_pengeluaran, 0) AS pengeluaran
FROM (
    SELECT 
        TO_CHAR(dp_pay_date, 'YYYY-MM') AS periode,
        SUM(dp_pay_total) AS total_pemasukan
    FROM codeid.data_pembayaran
    GROUP BY TO_CHAR(dp_pay_date, 'YYYY-MM')
) p
FULL JOIN (
    SELECT 
        TO_CHAR(dpe_exp_date, 'YYYY-MM') AS periode,
        SUM(dpe_exp_total) AS total_pengeluaran
    FROM codeid.data_pengeluaran
    GROUP BY TO_CHAR(dpe_exp_date, 'YYYY-MM')
) e
ON p.periode = e.periode
ORDER BY periode;



--Task 2.2 Laporan Pemasukan dan Pengeluaran Per Bulan secara Detail
SELECT
    CONCAT(p.tahun, '-', LPAD(p.bulan::text, 2, '0')) AS periode,
    COALESCE(o.do_name, 'Belum Ada Owner') AS owner,
    CONCAT(k.dk_block, '-', k.dk_number) AS kavling,
    k.dk_status AS status,
    i.di_cntb_type AS contribution_type,
    i.di_cntb_rate AS nominal,
    CASE 
		WHEN o.do_name IS NULL THEN 'Belum Ada Owner'
        WHEN dp.dep_id IS NOT NULL THEN 'Sudah Bayar'
        ELSE 'Menunggak'
    END AS status_pembayaran
FROM 
(
    SELECT 
        EXTRACT(MONTH FROM periode)::INT AS bulan,
        EXTRACT(YEAR FROM periode)::INT AS tahun
    FROM generate_series(
        '2026-01-01'::DATE,
        '2026-05-01'::DATE,
        INTERVAL '1 month'
    ) AS periode
) p
CROSS JOIN codeid.data_kavling k
JOIN codeid.data_iuran i
    ON k.dk_status = i.di_kav_status
LEFT JOIN codeid.data_owner o
    ON k.dk_do_id = o.do_id
LEFT JOIN codeid.detail_pembayaran dp
    ON dp.dep_dk_id = k.dk_id
    AND dp.dep_period_month = p.bulan
    AND dp.dep_period_year = p.tahun
    AND dp.dep_fee_type = i.di_cntb_type
ORDER BY
    p.tahun,
    p.bulan,
    k.dk_block,
    k.dk_number,
    i.di_cntb_type;



--Task 2.3 Total pemasukan dan pengeluaran dalam 1 bulan dalam kondisi normal (semua warga membayar / tidak ada yang menunggak)
SELECT
	'Dalam 1 Bulan' as periode,
    SUM(
        di.di_cntb_rate * (dk.dk_land_area / 100)
    ) AS total_pemasukan_normal,
    10000000 AS total_pengeluaran_normal,
	'Asumsi pengeluaran normal hanya berupa iuran kebersihan dan iuran keamanan saja' AS keterangan
FROM codeid.data_kavling dk
JOIN codeid.data_iuran di
    ON dk.dk_status = di.di_kav_status;
