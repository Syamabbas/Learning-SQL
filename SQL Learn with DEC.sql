use FitnessTrackers
go

-- 1. Selecting all columns from the dbo.Fitness_trackers_updated table
select * from dbo.Fitness_trackers_updated;

-- 2. Selecting specific columns (Brand_Name, Device_Type, Model_Name, Color, Selling_Price)
select id, Brand_Name, Color, Selling_Price 
from dbo.Fitness_trackers_updated ft;

-- 3. Filtering products with a rating below 4
select * from dbo.Fitness_trackers_updated ft 
where Rating_Out_of_5 < 4;

-- 4. Filtering products with the color red
select * from dbo.Fitness_trackers_updated ft 
where Color = 'Red';

-- 5. Filtering products with a rating below 4 AND the color red
select id, Brand_Name, Model_Name, Color, Rating_Out_of_5
from dbo.Fitness_trackers_updated ft 
where Rating_Out_of_5 < 4 AND Color = 'Red';

-- 6. Filtering products with a rating above 3 OR the color red
select id, Brand_Name, Model_Name, Color, Rating_Out_of_5
from dbo.Fitness_trackers_updated ft 
where Rating_Out_of_5 > 3 OR Color = 'Red';

-- 7. Filter ID antara 2 sampai 19 (menggunakan BETWEEN agar inklusif dan rapi)
SELECT * FROM dbo.Fitness_trackers_updated ft 
WHERE ft.id BETWEEN 2 AND 19;

-- 8. Filter warna tertentu (Red, Pink, Blue)
SELECT brand_name, model_name, color 
FROM dbo.Fitness_trackers_updated ft 
WHERE color IN ('Red', 'Pink', 'Blue');

-- 9. Filter brand_name yang berakhiran 'IN'
SELECT * FROM dbo.Fitness_trackers_updated ft 
WHERE brand_name LIKE '%IN';

-- 10. Filter brand_name yang mengandung huruf 'S'
SELECT * FROM dbo.Fitness_trackers_updated ft 
WHERE ft.brand_name LIKE '%S%';

-- 11. Agregasi rata-rata harga untuk brand SAMSUNG di atas 30000
SELECT brand_name, model_name, AVG(selling_price) AS avg_sp
FROM dbo.Fitness_trackers_updated ft 
WHERE brand_name = 'SAMSUNG'
GROUP BY brand_name, model_name
HAVING AVG(selling_price) > 30000
ORDER BY avg_sp DESC;

-- 12. Menghitung total baris data
SELECT COUNT(*) AS total_rows
FROM dbo.Fitness_trackers_updated ft;

-- 13. Menampilkan brand_name yang unik (tidak duplikat)
SELECT DISTINCT brand_name 
FROM dbo.Fitness_trackers_updated ft;

-- 14. Menghitung jumlah brand_name yang unik
SELECT COUNT(DISTINCT brand_name) AS total_unique_brands
FROM dbo.Fitness_trackers_updated ft;

-- 15. Kategori status baterai menggunakan CASE Statement
SELECT brand_name, model_name, Average_Battery_Life_in_days, 
       CASE WHEN Average_Battery_Life_in_days >= 30 THEN 'tahan lama'
            WHEN Average_Battery_Life_in_days >= 20 THEN 'daya sedang'
            WHEN Average_Battery_Life_in_days >= 0  THEN 'daya kurang'
       END AS battere_status
FROM dbo.Fitness_trackers_updated;