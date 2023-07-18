--Soal 1: Tampilkan semua kota-kota 'unik' di mana pelanggan customer berasal! 
SELECT 
DISTINCT kota
FROM rakamin_customer_address;

--Soal 2: Tampilkan 10 baris transaksi terbaru (most recent) dari tabel rakamin_order untuk melihat format dari tabel ini!
SELECT *
FROM rakamin_order
ORDER BY tanggal_pembelian DESC
LIMIT 10;

--Soal 3: Tunjukkan data-data customer yang terdeteksi sebagai penipu di RakaFood!
SELECT *
FROM  rakamin_customer
WHERE penipu = 1;

--Soal 4: data order dari Rakafood yang menggunakan metode bayar ShopeePay dan jumlah transaksi yang terbesar
SELECT *
FROM rakamin_order
WHERE metode_bayar = 'shopeepay'
ORDER BY harga DESC;

--Soal 5: buatlah satu tabel baru bernama rakamin_customer_address_tangerang yang berisi data tabel rakamin_customer_address khusus di kota Tangerang
CREATE TABLE rakamin_customer_address_tangerang as
SELECT *
FROM rakamin_customer_address
WHERE kota = 'Tangerang';

--Soal 6a: Kolom provinsi untuk kota Tangerang seharusnya adalah Banten 
UPDATE rakamin_customer_address_tangerang 
SET provinsi = 'Banten'
 
--Soal 6b:  untuk customer dengan id_pelanggan 10 seharusnya beralamat di Karawaci 
UPDATE rakamin_customer_address_tangerang 
SET alamat = 'Karawaci'
WHERE id_pelanggan = 10;

--Soal 7: Ternyata tabel rakamin_customer_address_tangerang belum memiliki data customer baru.Tambahkan satu baris data berikut ke dalam tabel tersebut: Id_alamat: 101, id_pelanggan: 70, alamat: Ciledug
INSERT INTO rakamin_customer_address_tangerang
VALUES (101, 70, 'Ciledug', 'Tangerang', 'Banten');

--Soal 8: Kesalahan ditemukan lagi dari tabel rakamin_customer_address_tangerang. Ternyata id_alamat = 54 adalah data yang tidak valid dan salah input. Hapus baris data tersebut agar tim Marketing dapat menggunakan tabel tersebut dengan lebih baik 
DELETE FROM  rakamin_customer_address_tangerang
WHERE id_alamat = 54;






