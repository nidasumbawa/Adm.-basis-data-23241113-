-- Nama : Nidaul Hasanah
-- NIM : 23241113
-- Kelas : C
-- Modul : Modul 1 Data Definition Langauge

-- Mebuat Database
CREATE DATABASE pti_mart;

-- Menggunakan DATABASE
USE pti_mart;

-- Membuat Tabel
CREATE TABLE pelanggan(
 id_pelanggan int PRIMARY KEY NOT NULL,
 nama_pelanggan VARCHAR(50),
 alamat VARCHAR(100),
 kota VARCHAR (20),
 no_tlp VARCHAR (15)
);

CREATE TABLE produk(
 id_produk int PRIMARY KEY NOT NULL,
 nama_produk VARCHAR (50),
 kategori VARCHAR (20),
 harga int (17),
 stok int (10)
); 
 
-- membuat tabel dengan foreign key
CREATE TABLE transaksi(
 id_transaksi int PRIMARY KEY NOT NULL,
 tgl_transaksi DATE,
 id_produk int,
 id_pelanggan int,
 qty int,
 total_harga int,
 FOREIGN KEY (id_produk) REFERENCES produk (id_produk),
 FOREIGN KEY (id_pelanggan) REFERENCES pelanggan (id_pelanggan)
 );
 
-- mengisi data dalam tabel
INSERT INTO pelanggan(
id_pelanggan, nama_pelanggan, alamat, kota, no_tlp
)VALUES
(222,"nida", "JL pemuda No.777", "Sumbawa", "085178145268"),
(223,"wiwin", "Jl selaparang No.777", "Gontar", "134168251"),
(224,"diah", "Jl maja pahit No.888", "Gomong", "246168247198"),
(225,"sinta", "Jl selaparang No.999", "Taliwang","157251638"),
(226,"auliya", "Jl pemuda No.197", "Selaparang","164186382");


INSERT INTO produk(
id_produk, nama_produk, kategori, harga, stok
)VALUES
(444,"kopi", "minuman", "1000", "2"),
(445,"tiktak", "makanan", "2000", "11"),
(446,"nestar", "makanan", "3000", "10"),
(447,"sosis", "makanan", "1000", "1"),
(448,"fluss", "makanan", "2000", "10");

-- cek apakah data ada 
SELECT * FROM pelanggan;
SELECT * FROM produk;

-- mengisi data pada tabel yang ada foreign key
INSERT INTO transaksi
 set id_transaksi = 8910,
	 tgl_transaksi = "2025-04-25",
     id_produk = (
     SELECT id_produk FROM produk
     WHERE id_produk = 444),
     id_pelanggan = (
     SELECT id_pelanggan FROM pelanggan
     WHERE id_pelanggan = 222),
     qty = 1,
     total_harga = (
     SELECT harga FROM produk
     WHERE id_produk = 444) * qty;
     
SELECT * FROM transaksi;
     
 
 