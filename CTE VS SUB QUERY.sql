-- Kalau ingin mencoba nya bisa jalankan query paling bawah dahulu untuk membuat table dan isi nya
-- CONTOH SEDERHANA DARI SUB QUERY
SELECT
    p.nama_produk,
    t.total
FROM produk p
JOIN (
    SELECT
        id_produk,
        SUM(jumlah) AS total
    FROM transaksi
    WHERE status = 'SUCCESS'
      AND tanggal >= '2024-01-01'
    GROUP BY id_produk
) t
    ON p.id = t.id_produk
WHERE
    p.status = 'AKTIF'
    AND t.total > 100;

-- CONTOH NYA JIKA DIBUAH KE CTE
WITH transaksi_valid AS (
    SELECT
        t.id_produk,
        t.jumlah
    FROM dbo.transaksi t
    WHERE t.status = 'SUCCESS'
      AND t.tanggal >= CAST('2024-01-01' AS DATE)
),
total_penjualan AS (
    SELECT
        tv.id_produk,
        SUM(tv.jumlah) AS total
    FROM transaksi_valid tv
    GROUP BY tv.id_produk
),
produk_aktif AS (
    SELECT
        p.id,
        p.nama_produk
    FROM dbo.produk p
    WHERE p.status = 'AKTIF'
)
SELECT
    pa.nama_produk,
    tp.total
FROM produk_aktif pa
JOIN total_penjualan tp
    ON pa.id = tp.id_produk
WHERE tp.total > 100;




-- PEMBUATAN TABLE
CREATE TABLE produk (
    id INT PRIMARY KEY,
    nama_produk VARCHAR(100) NOT NULL,
    status VARCHAR(20) NOT NULL
);

CREATE TABLE transaksi (
    id INT PRIMARY KEY,
    id_produk INT NOT NULL,
    jumlah INT NOT NULL,
    status VARCHAR(20) NOT NULL,
    tanggal DATE NOT NULL,
    FOREIGN KEY (id_produk) REFERENCES produk(id)
);


-- INSERT DATA
INSERT INTO produk (id, nama_produk, status) VALUES
(1, 'Laptop', 'AKTIF'),
(2, 'Mouse', 'AKTIF'),
(3, 'Keyboard', 'AKTIF'),
(4, 'Monitor', 'AKTIF'),
(5, 'Printer', 'AKTIF'),
(6, 'Scanner', 'NONAKTIF'),
(7, 'Webcam', 'AKTIF'),
(8, 'Headset', 'AKTIF'),
(9, 'Speaker', 'NONAKTIF'),
(10, 'External HDD', 'AKTIF');

INSERT INTO transaksi (id, id_produk, jumlah, status, tanggal) VALUES
-- Laptop
(1, 1, 40, 'SUCCESS', '2024-01-05'),
(2, 1, 30, 'SUCCESS', '2024-01-12'),
(3, 1, 50, 'SUCCESS', '2024-02-01'),
(4, 1, 20, 'FAILED',  '2024-02-10'),

-- Mouse
(5, 2, 20, 'SUCCESS', '2024-01-03'),
(6, 2, 25, 'SUCCESS', '2024-01-20'),
(7, 2, 15, 'SUCCESS', '2024-02-05'),

-- Keyboard
(8, 3, 60, 'SUCCESS', '2024-01-07'),
(9, 3, 50, 'SUCCESS', '2024-02-11'),
(10,3, 10, 'FAILED',  '2024-02-20'),

-- Monitor
(11,4, 80, 'SUCCESS', '2024-01-15'),
(12,4, 50, 'SUCCESS', '2024-02-18'),

-- Printer
(13,5, 40, 'SUCCESS', '2024-01-25'),
(14,5, 30, 'SUCCESS', '2024-02-02'),
(15,5, 20, 'SUCCESS', '2024-03-01'),

-- Scanner (NONAKTIF, harus tidak ikut)
(16,6, 200, 'SUCCESS', '2024-01-10'),

-- Webcam
(17,7, 70, 'SUCCESS', '2024-01-08'),
(18,7, 40, 'SUCCESS', '2024-02-14'),

-- Headset
(19,8, 30, 'SUCCESS', '2024-01-05'),
(20,8, 20, 'SUCCESS', '2024-01-18'),
(21,8, 25, 'SUCCESS', '2024-02-22'),

-- Speaker (NONAKTIF)
(22,9, 150, 'SUCCESS', '2024-01-30'),

-- External HDD
(23,10, 60, 'SUCCESS', '2024-01-09'),
(24,10, 50, 'SUCCESS', '2024-02-12'),

-- Data lama (harus terfilter tanggal)
(25,1, 100, 'SUCCESS', '2023-12-15'),
(26,4, 100, 'SUCCESS', '2023-11-10');
