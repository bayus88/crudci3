-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Des 2021 pada 03.56
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_apotik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `USERNAME` varchar(225) NOT NULL,
  `PASSWORD` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`USERNAME`, `PASSWORD`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detil_transaksi`
--

CREATE TABLE `detil_transaksi` (
  `KODE_DETIL` int(11) NOT NULL,
  `KODE_TRANSAKSI` int(11) NOT NULL,
  `KODE_OBAT` int(11) NOT NULL,
  `SUB_TOTAL` int(11) NOT NULL,
  `JUMLAH` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `obat`
--

CREATE TABLE `obat` (
  `KODE_OBAT` int(11) NOT NULL,
  `KODE_SUPPLIER` int(11) NOT NULL,
  `KODE_DETIL` int(11) NOT NULL,
  `NAMA_OBAT` varchar(225) NOT NULL,
  `PRODUSEN` varchar(225) NOT NULL,
  `HARGA` int(11) NOT NULL,
  `JML_STOK` int(11) NOT NULL,
  `FOTO` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `KODE_SUPPLIER` int(11) NOT NULL,
  `NAMA_SUPPLIER` varchar(225) NOT NULL,
  `ALAMAT` varchar(225) NOT NULL,
  `KOTA` varchar(225) NOT NULL,
  `TELP` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`KODE_SUPPLIER`, `NAMA_SUPPLIER`, `ALAMAT`, `KOTA`, `TELP`) VALUES
(2, 'Bayu', 'sedati', 'sidoarjo', 2147483647),
(4, 'Dani Rachmad', 'gilang', 'sidoarjo', 302402),
(5, 'Dani Rachmad R', 'gilang', 'sidoarjo', 121313131);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `KODE_TRANSAKSI` int(11) NOT NULL,
  `KODE_DETIL` int(11) NOT NULL,
  `USERNAME` varchar(225) NOT NULL,
  `NAMA_PEMBELI` varchar(225) NOT NULL,
  `TGL_TRANSAKSI` date NOT NULL,
  `SUB_TOTAL` int(11) NOT NULL,
  `TOTAL` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`USERNAME`);

--
-- Indeks untuk tabel `detil_transaksi`
--
ALTER TABLE `detil_transaksi`
  ADD PRIMARY KEY (`KODE_DETIL`),
  ADD KEY `KODE_TRANSAKSI` (`KODE_TRANSAKSI`),
  ADD KEY `KODE_OBAT` (`KODE_OBAT`);

--
-- Indeks untuk tabel `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`KODE_OBAT`),
  ADD KEY `KODE_DETIL` (`KODE_DETIL`),
  ADD KEY `KODE_SUPPLIER` (`KODE_SUPPLIER`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`KODE_SUPPLIER`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`KODE_TRANSAKSI`),
  ADD KEY `KODE_DETIL` (`KODE_DETIL`),
  ADD KEY `USERNAME` (`USERNAME`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detil_transaksi`
--
ALTER TABLE `detil_transaksi`
  MODIFY `KODE_DETIL` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `obat`
--
ALTER TABLE `obat`
  MODIFY `KODE_OBAT` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `KODE_SUPPLIER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `KODE_TRANSAKSI` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detil_transaksi`
--
ALTER TABLE `detil_transaksi`
  ADD CONSTRAINT `detil_transaksi_ibfk_1` FOREIGN KEY (`KODE_TRANSAKSI`) REFERENCES `transaksi` (`KODE_TRANSAKSI`),
  ADD CONSTRAINT `detil_transaksi_ibfk_2` FOREIGN KEY (`KODE_OBAT`) REFERENCES `obat` (`KODE_OBAT`);

--
-- Ketidakleluasaan untuk tabel `obat`
--
ALTER TABLE `obat`
  ADD CONSTRAINT `obat_ibfk_1` FOREIGN KEY (`KODE_DETIL`) REFERENCES `detil_transaksi` (`KODE_DETIL`),
  ADD CONSTRAINT `obat_ibfk_2` FOREIGN KEY (`KODE_SUPPLIER`) REFERENCES `supplier` (`KODE_SUPPLIER`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`KODE_DETIL`) REFERENCES `detil_transaksi` (`KODE_DETIL`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`USERNAME`) REFERENCES `admin` (`USERNAME`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
