-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 26 Bulan Mei 2020 pada 08.46
-- Versi server: 10.3.22-MariaDB-log-cll-lve
-- Versi PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trophych_hutanku`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `id_user`, `nama`, `foto`) VALUES
(45, 241, 'Admin', '20190621113959.png'),
(49, 243, 'Okie', '20200502195405.png'),
(50, 244, 'admin2', 'default.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `config`
--

CREATE TABLE `config` (
  `id_config` int(11) NOT NULL,
  `nama_config` varchar(100) NOT NULL,
  `isi_config` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `config`
--

INSERT INTO `config` (`id_config`, `nama_config`, `isi_config`) VALUES
(1, 'Warna', '#84bf29'),
(2, 'Logo', '20200501082955.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_produk_supplier`
--

CREATE TABLE `detail_produk_supplier` (
  `id_detail_produk_supplier` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `jumlah_stok` int(11) NOT NULL,
  `spek` longtext NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_produk_supplier`
--

INSERT INTO `detail_produk_supplier` (`id_detail_produk_supplier`, `id_produk`, `id_supplier`, `jumlah_stok`, `spek`, `harga`) VALUES
(4, 9, 2, 5000, 'Tinggi : 45-50	\r\nUkuran Polibag : 10x15	\r\nBulan Sapih : Januari 2020	4\r\n\r\n', 1750),
(5, 43, 1, 1000, 'test', 5000),
(8, 64, 6, 5000, 'Tinggi 30-40 cm, polibag 10X15 cm, umur 3 bulan', 2000),
(9, 9, 6, 50000, '', 1750),
(10, 9, 3, 30000, '', 1750),
(11, 9, 5, 10000, '', 1750),
(12, 9, 7, 30000, '', 1750),
(13, 11, 2, 5000, '', 2500),
(14, 11, 6, 50000, '', 2500);

-- --------------------------------------------------------

--
-- Struktur dari tabel `info`
--

CREATE TABLE `info` (
  `id_info` int(11) NOT NULL,
  `judul_info` varchar(1000) NOT NULL,
  `konten_info` mediumtext NOT NULL,
  `tanggal_info` datetime NOT NULL,
  `gambar_info` varchar(100) NOT NULL,
  `status_info` int(1) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `info`
--

INSERT INTO `info` (`id_info`, `judul_info`, `konten_info`, `tanggal_info`, `gambar_info`, `status_info`, `id_user`) VALUES
(7, 'Testing', '<p>Ini hanya test</p>\r\n\r\n<div class=\"youtube-embed-wrapper\" style=\"position:relative;padding-bottom:56.25%;padding-top:30px;height:0;overflow:hidden\"><iframe allow=\";\" allowfullscreen=\"\" frameborder=\"0\" height=\"360\" src=\"https://www.youtube.com/embed/kkSDsUifKHk\" style=\"position:absolute;top:0;left:0;width:100%;height:100%\" width=\"640\"></iframe></div>\r\n\r\n<p>&nbsp;</p>\r\n', '2020-05-25 20:49:58', '20200525204958.png', 1, 241);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_produk`
--

CREATE TABLE `kategori_produk` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `icon` varchar(25) NOT NULL,
  `no_wa` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori_produk`
--

INSERT INTO `kategori_produk` (`id`, `nama`, `icon`, `no_wa`) VALUES
(7, 'Bibit', '20200501004002.png', '085349980806'),
(11, 'Pupuk', '20200501004135.png', '085349980806'),
(12, 'Alat Pemadam ', '20200502155812.png', '085349980806'),
(13, 'Madu', '20200503210818.png', '085349980806');

-- --------------------------------------------------------

--
-- Struktur dari tabel `konsultasi`
--

CREATE TABLE `konsultasi` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `icon` varchar(25) NOT NULL,
  `no_wa` varchar(50) NOT NULL,
  `kata_sapa` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `konsultasi`
--

INSERT INTO `konsultasi` (`id`, `nama`, `icon`, `no_wa`, `kata_sapa`) VALUES
(1, 'Konsultasi Bibit', '20200429224232.png', '085349980806', 'Hallo hutanku, Saya ingin konsultasi mengenai bibit..'),
(2, 'Konsultasi Pupuk', '20200503203111.png', '085349980806', 'Hallo hutanku, Saya ingin konsultasi mengenai produk pupuk..'),
(4, 'Konsultasi madu', '20200523104617.png', '085349980806', 'Hallo hutanku, Saya ingin konsultasi mengenai produk madu..');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `tanggal_pesanan` datetime NOT NULL,
  `kode_promo` varchar(50) NOT NULL,
  `potongan_promo` int(11) NOT NULL,
  `biaya_desain` int(11) NOT NULL,
  `status_lunas` int(1) NOT NULL,
  `status_pesanan` varchar(100) NOT NULL,
  `keterangan_admin` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan_detail`
--

CREATE TABLE `pesanan_detail` (
  `id_pesanan_detail` int(11) NOT NULL,
  `id_pesanan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `catatan_pesanan` mediumtext NOT NULL,
  `harga` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `panjang` decimal(65,3) NOT NULL,
  `lebar` decimal(65,3) NOT NULL,
  `ukuran` decimal(65,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan_temp`
--

CREATE TABLE `pesanan_temp` (
  `id_pesanan_temp` int(11) NOT NULL,
  `id_customer` varchar(100) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `catatan_pesanan` mediumtext NOT NULL,
  `tanggal_pesanan` datetime NOT NULL,
  `harga` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `jenis_order` varchar(20) NOT NULL,
  `panjang` decimal(65,3) NOT NULL,
  `lebar` decimal(65,3) NOT NULL,
  `ukuran` decimal(65,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pesanan_temp`
--

INSERT INTO `pesanan_temp` (`id_pesanan_temp`, `id_customer`, `id_produk`, `catatan_pesanan`, `tanggal_pesanan`, `harga`, `qty`, `jenis_order`, `panjang`, `lebar`, `ukuran`) VALUES
(16, '5e6b0a64b9fe4', 1, '', '2020-03-13 14:26:02', 32000, 0, 'delivery', 0.000, 0.000, 0.000),
(17, '5e6b0a64b9fe4', 2, '', '2020-03-13 14:26:01', 35000, 0, 'delivery', 0.000, 0.000, 0.000),
(18, '5e6b0a64b9fe4', 2, '', '2020-03-13 15:16:52', 35000, 0, 'fast', 0.000, 0.000, 0.000),
(19, '5e6b0a64b9fe4', 1, '', '2020-03-13 15:14:26', 32000, 0, 'fast', 0.000, 0.000, 0.000),
(20, '5e6b0a64b9fe4', 3, '', '2020-03-13 15:16:53', 30000, 0, 'fast', 0.000, 0.000, 0.000),
(21, '5e6c4a5245c0b', 1, '', '2020-03-14 11:36:50', 32000, 0, 'fast', 0.000, 0.000, 0.000),
(22, '5e6c4a5245c0b', 2, '', '2020-03-14 11:36:51', 35000, 0, 'fast', 0.000, 0.000, 0.000),
(23, '5e6c4a5245c0b', 3, '', '2020-03-14 11:33:26', 30000, 1, 'delivery', 0.000, 0.000, 0.000),
(24, '5e6c595578738', 1, '', '2020-03-14 13:05:26', 32000, 0, 'fast', 0.000, 0.000, 0.000),
(25, '5e6c5a7d2ffe8', 1, '', '2020-03-14 12:53:03', 32000, 0, 'delivery', 0.000, 0.000, 0.000),
(26, '5e6c5a7d2ffe8', 2, '', '2020-03-14 12:49:14', 35000, 0, 'delivery', 0.000, 0.000, 0.000),
(27, '5e6c5a7d2ffe8', 3, '', '2020-03-14 12:49:15', 30000, 0, 'delivery', 0.000, 0.000, 0.000),
(28, '5e6c5a7d2ffe8', 2, '', '2020-03-14 12:42:38', 35000, 0, 'fast', 0.000, 0.000, 0.000),
(29, '5e6c595578738', 2, '', '2020-03-14 13:05:27', 35000, 0, 'fast', 0.000, 0.000, 0.000),
(30, '5e6c595578738', 2, '', '2020-03-14 12:57:55', 35000, 0, 'delivery', 0.000, 0.000, 0.000),
(31, '5e6c595578738', 3, '', '2020-03-14 12:49:00', 30000, 0, 'delivery', 0.000, 0.000, 0.000),
(32, '5e6c595578738', 1, '', '2020-03-14 12:57:54', 32000, 0, 'delivery', 0.000, 0.000, 0.000),
(33, '5e6c650cde72c', 2, '', '2020-03-14 13:01:27', 35000, 1, 'delivery', 0.000, 0.000, 0.000),
(34, '5e6c595578738', 3, '', '2020-03-14 13:05:29', 30000, 0, 'fast', 0.000, 0.000, 0.000),
(35, '5e6c9d20ec18a', 1, '', '2020-03-14 17:20:26', 32000, 0, 'delivery', 0.000, 0.000, 0.000),
(36, '5e6c9d20ec18a', 2, '', '2020-03-14 17:27:21', 35000, 0, 'delivery', 0.000, 0.000, 0.000),
(37, '5e6c985071403', 4, '', '2020-03-14 18:16:11', 10000, 1, 'delivery', 0.000, 0.000, 0.000),
(38, '5e6c985071403', 5, '', '2020-03-14 18:16:12', 10000, 1, 'delivery', 0.000, 0.000, 0.000),
(39, '5e6c985071403', 6, '', '2020-03-14 18:16:12', 13000, 1, 'delivery', 0.000, 0.000, 0.000),
(40, '5e6d72b693125', 4, '', '2020-03-15 08:15:17', 10000, 0, 'delivery', 0.000, 0.000, 0.000),
(41, '5e6d72b693125', 5, '', '2020-03-15 08:15:16', 10000, 0, 'delivery', 0.000, 0.000, 0.000),
(42, '5e6d72b693125', 6, '', '2020-03-15 08:15:18', 13000, 0, 'delivery', 0.000, 0.000, 0.000),
(43, '5e6dc1443bdb5', 6, '', '2020-03-15 13:47:39', 13000, 1, 'fast', 0.000, 0.000, 0.000),
(44, '5e6dc1443bdb5', 5, '', '2020-03-15 13:47:41', 10000, 1, 'fast', 0.000, 0.000, 0.000),
(45, '5e6dc1443bdb5', 4, '', '2020-03-15 13:47:43', 10000, 1, 'fast', 0.000, 0.000, 0.000),
(46, '5e6dc05d202a1', 1, '', '2020-03-15 13:52:01', 32000, 1, 'delivery', 0.000, 0.000, 0.000),
(47, '5e6dc05d202a1', 2, '', '2020-03-15 13:52:02', 35000, 1, 'delivery', 0.000, 0.000, 0.000),
(48, '5e6dc05d202a1', 3, '', '2020-03-15 13:52:03', 30000, 1, 'delivery', 0.000, 0.000, 0.000),
(49, '5e6dc722a4e25', 1, '', '2020-03-15 14:57:59', 32000, 0, 'delivery', 0.000, 0.000, 0.000),
(50, '5e6dc722a4e25', 2, '', '2020-03-15 14:58:00', 35000, 0, 'delivery', 0.000, 0.000, 0.000),
(51, '5e6dca71d3763', 1, '', '2020-03-15 14:26:00', 32000, 1, 'delivery', 0.000, 0.000, 0.000),
(52, '5e6dcaa646293', 6, '', '2020-03-15 14:27:46', 13000, 0, 'fast', 0.000, 0.000, 0.000),
(53, '5e6dcaa646293', 5, '', '2020-03-15 14:27:50', 10000, 0, 'fast', 0.000, 0.000, 0.000),
(54, '5e6dcaa646293', 4, '', '2020-03-15 14:27:51', 10000, 0, 'fast', 0.000, 0.000, 0.000),
(55, '5e6dcab406a0f', 2, '', '2020-03-15 14:28:54', 35000, 0, 'fast', 0.000, 0.000, 0.000),
(56, '5e6dcab406a0f', 1, '', '2020-03-15 14:28:55', 32000, 0, 'fast', 0.000, 0.000, 0.000),
(57, '5e6dcab406a0f', 2, '', '2020-03-15 14:29:09', 35000, 0, 'delivery', 0.000, 0.000, 0.000),
(58, '5e6dcab406a0f', 3, '', '2020-03-15 14:29:10', 30000, 0, 'delivery', 0.000, 0.000, 0.000),
(59, '5e6dcb0595aa2', 3, '', '2020-03-15 14:29:34', 30000, 0, 'fast', 0.000, 0.000, 0.000),
(60, '5e6dcb0595aa2', 2, '', '2020-03-15 14:29:38', 35000, 0, 'fast', 0.000, 0.000, 0.000),
(61, '5e6dcb0595aa2', 1, '', '2020-03-15 14:31:20', 32000, 0, 'fast', 0.000, 0.000, 0.000),
(62, '5e6dcaefee86f', 6, '', '2020-03-15 14:31:26', 13000, 0, 'delivery', 0.000, 0.000, 0.000),
(63, '5e6dcaefee86f', 4, '', '2020-03-15 14:31:28', 10000, 0, 'delivery', 0.000, 0.000, 0.000),
(64, '5e6dcaefee86f', 3, '', '2020-03-15 14:32:02', 30000, 0, 'delivery', 0.000, 0.000, 0.000),
(65, '5e6dcc9a5a870', 4, '', '2020-03-15 14:35:12', 10000, 1, 'fast', 0.000, 0.000, 0.000),
(66, '5e6dcc9a5a870', 5, '', '2020-03-15 14:49:07', 10000, 1, 'fast', 0.000, 0.000, 0.000),
(67, '5e6dd279c5366', 1, '', '2020-03-15 16:30:56', 32000, 0, 'fast', 0.000, 0.000, 0.000),
(68, '5e6dd279c5366', 4, '', '2020-03-15 16:31:31', 10000, 1, 'delivery', 0.000, 0.000, 0.000),
(69, '5e6dd279c5366', 5, '', '2020-03-15 16:31:32', 10000, 2, 'delivery', 0.000, 0.000, 0.000),
(70, '5e6dd279c5366', 6, '', '2020-03-15 16:31:33', 13000, 2, 'delivery', 0.000, 0.000, 0.000),
(71, '5e6e4d7d2c087', 1, '', '2020-03-15 23:45:38', 32000, 1, 'fast', 0.000, 0.000, 0.000),
(72, '5e6e4d7d2c087', 2, '', '2020-03-15 23:45:40', 35000, 1, 'fast', 0.000, 0.000, 0.000),
(73, '5e6eed2f7b637', 4, '', '2020-03-16 11:11:30', 10000, 0, 'delivery', 0.000, 0.000, 0.000),
(74, '5e6eed2f7b637', 5, '', '2020-03-16 11:11:31', 10000, 0, 'delivery', 0.000, 0.000, 0.000),
(75, '5e6eed2f7b637', 6, '', '2020-03-16 11:11:38', 13000, 1, 'delivery', 0.000, 0.000, 0.000),
(76, '5e6eed2f7b637', 6, '', '2020-03-16 11:10:38', 13000, 0, 'fast', 0.000, 0.000, 0.000),
(77, '5e6eed2f7b637', 2, '', '2020-03-16 11:23:53', 35000, 0, 'delivery', 0.000, 0.000, 0.000),
(78, '5e6eed2f7b637', 1, '', '2020-03-16 11:23:56', 32000, 0, 'delivery', 0.000, 0.000, 0.000),
(79, '5e6eed2f7b637', 3, '', '2020-03-16 11:23:42', 30000, 0, 'delivery', 0.000, 0.000, 0.000),
(80, '5e6f7c5ad326f', 5, '', '2020-03-16 21:18:18', 10000, 0, 'delivery', 0.000, 0.000, 0.000),
(81, '5e6f8a77517a3', 1, '', '2020-03-16 22:17:55', 32000, 1, 'delivery', 0.000, 0.000, 0.000),
(82, '5e70374684e00', 1, '', '2020-03-17 10:35:40', 32000, 1, 'delivery', 0.000, 0.000, 0.000),
(83, '5e705553e0d43', 1, '', '2020-03-17 16:31:21', 32000, 2, 'delivery', 0.000, 0.000, 0.000),
(84, '5e705553e0d43', 2, '', '2020-03-17 14:44:56', 35000, 0, 'delivery', 0.000, 0.000, 0.000),
(85, '5e705553e0d43', 3, '', '2020-03-17 14:44:56', 30000, 1, 'delivery', 0.000, 0.000, 0.000),
(86, '5e74865e13220', 4, '', '2020-03-20 17:02:35', 12000, 0, 'delivery', 0.000, 0.000, 0.000),
(87, '5e74865e13220', 5, '', '2020-03-20 17:02:36', 10000, 0, 'delivery', 0.000, 0.000, 0.000),
(88, '5e74865e13220', 6, '', '2020-03-20 17:02:37', 13000, 0, 'delivery', 0.000, 0.000, 0.000),
(89, '5e76ebb9cbaa0', 4, '', '2020-03-22 12:40:42', 12000, 2, 'fast', 0.000, 0.000, 0.000),
(90, '5e7741e0ad3ba', 8, '', '2020-03-22 18:55:06', 17000, 0, 'fast', 0.000, 0.000, 0.000),
(91, '5e7767ef74354', 7, '', '2020-03-22 21:43:46', 15000, 1, 'delivery', 0.000, 0.000, 0.000),
(92, '5e77fea2c1349', 7, '', '2020-03-23 08:11:21', 15000, 1, 'fast', 0.000, 0.000, 0.000),
(93, '5e780df22475b', 7, '', '2020-03-23 09:18:42', 15000, 0, 'delivery', 0.000, 0.000, 0.000),
(94, '5e785d3e2d7a6', 7, '', '2020-03-23 15:36:44', 15000, 1, 'fast', 0.000, 0.000, 0.000),
(95, '5e830570f0f7d', 7, '', '2020-03-31 16:55:51', 15000, 0, 'delivery', 0.000, 0.000, 0.000),
(96, '5e8428edcf4b1', 7, '', '2020-04-01 13:41:31', 15000, 0, 'delivery', 0.000, 0.000, 0.000),
(97, '5e84b43923109', 7, '', '2020-04-02 01:21:51', 15000, 0, 'delivery', 0.000, 0.000, 0.000),
(98, '5e84b43923109', 8, '', '2020-04-02 01:21:47', 17000, 0, 'delivery', 0.000, 0.000, 0.000),
(99, '5e84b43923109', 9, '', '2020-04-01 23:39:27', 17000, 0, 'delivery', 0.000, 0.000, 0.000),
(100, '5e896cad09bac', 7, '', '2020-04-05 13:30:27', 15000, 0, 'delivery', 0.000, 0.000, 0.000),
(101, '5e896cad09bac', 8, '', '2020-04-05 13:30:28', 17000, 0, 'delivery', 0.000, 0.000, 0.000),
(102, '5e896cad09bac', 9, '', '2020-04-05 13:33:54', 17000, 0, 'delivery', 0.000, 0.000, 0.000),
(103, '5e896cad09bac', 8, '', '2020-04-05 13:34:11', 17000, 0, 'fast', 0.000, 0.000, 0.000),
(104, '5e896cad09bac', 9, '', '2020-04-05 13:34:11', 17000, 0, 'fast', 0.000, 0.000, 0.000),
(105, '5e896cad09bac', 7, '', '2020-04-05 13:34:10', 15000, 0, 'fast', 0.000, 0.000, 0.000),
(106, '5e8a1c7ee1120', 7, '', '2020-04-06 02:18:43', 15000, 0, 'delivery', 0.000, 0.000, 0.000),
(107, '5e8a1c7b1bdbd', 7, '', '2020-04-06 02:18:33', 15000, 3, 'delivery', 0.000, 0.000, 0.000),
(108, '5e8a1c7ee1120', 8, '', '2020-04-06 02:18:44', 17000, 0, 'delivery', 0.000, 0.000, 0.000),
(109, '5e8a1c7b1bdbd', 8, '', '2020-04-06 02:18:24', 17000, 1, 'delivery', 0.000, 0.000, 0.000),
(110, '5e8a874d066a3', 7, '', '2020-04-06 09:42:43', 15000, 0, 'delivery', 0.000, 0.000, 0.000),
(111, '5e8a89ebe6545', 7, '', '2020-04-06 09:46:46', 15000, 1, 'delivery', 0.000, 0.000, 0.000),
(112, '5e8a89ebe6545', 8, '', '2020-04-06 09:46:58', 17000, 2, 'delivery', 0.000, 0.000, 0.000),
(113, '5e8a8cbda8d58', 15, '', '2020-04-06 10:02:07', 13000, 8, 'fast', 0.000, 0.000, 0.000),
(114, '5e8acc35bfc56', 7, '', '2020-04-06 14:29:33', 15000, 1, 'delivery', 0.000, 0.000, 0.000),
(115, '5e8aca7dc8165', 7, '', '2020-04-06 14:29:41', 15000, 0, 'delivery', 0.000, 0.000, 0.000),
(116, '5e8c8959b5cc1', 7, '', '2020-04-07 22:09:03', 15000, 1, 'delivery', 0.000, 0.000, 0.000),
(117, '5e8c8959b5cc1', 8, '', '2020-04-07 22:09:10', 17000, 1, 'delivery', 0.000, 0.000, 0.000),
(118, '5e8c8cd4467e2', 7, '', '2020-04-07 22:25:13', 15000, 2, 'delivery', 0.000, 0.000, 0.000),
(119, '5e8d668136d1b', 7, '', '2020-04-08 15:54:05', 15000, 2, 'delivery', 0.000, 0.000, 0.000),
(120, '5e9011dd16148', 7, '', '2020-04-10 14:28:25', 15000, 0, 'delivery', 0.000, 0.000, 0.000),
(121, '5e9011dd16148', 8, '', '2020-04-10 14:28:27', 17000, 0, 'delivery', 0.000, 0.000, 0.000),
(122, '5e919c3fa1346', 7, '', '2020-04-11 18:30:44', 15000, 1, 'delivery', 0.000, 0.000, 0.000),
(123, '5e919c3fa1346', 8, '', '2020-04-11 18:30:46', 17000, 2, 'delivery', 0.000, 0.000, 0.000),
(124, '5e919c3fa1346', 9, '', '2020-04-11 18:31:16', 17000, 1, 'delivery', 0.000, 0.000, 0.000),
(125, '5e91c4c787bc2', 7, '', '2020-04-11 21:24:37', 15000, 2, 'delivery', 0.000, 0.000, 0.000),
(126, '5e92d0833a538', 7, '', '2020-04-12 18:00:45', 15000, 0, 'delivery', 0.000, 0.000, 0.000),
(127, '5e92d0833a538', 8, '', '2020-04-12 16:26:21', 17000, 0, 'delivery', 0.000, 0.000, 0.000),
(128, '5e92c82728d7e', 7, '', '2020-04-12 16:41:15', 15000, 0, 'delivery', 0.000, 0.000, 0.000),
(129, '5e93d1277309d', 7, '', '2020-04-13 10:41:51', 15000, 1, 'delivery', 0.000, 0.000, 0.000),
(130, '5e99ad021eca0', 7, '', '2020-04-17 21:20:22', 15000, 5, 'delivery', 0.000, 0.000, 0.000),
(131, '5e99ad021eca0', 8, '', '2020-04-17 21:20:29', 17000, 3, 'delivery', 0.000, 0.000, 0.000),
(132, '5e99ad021eca0', 9, '', '2020-04-17 21:20:32', 17000, 3, 'delivery', 0.000, 0.000, 0.000),
(133, '5e9aa57cb9cc9', 7, '', '2020-04-18 15:02:26', 15000, 3, 'delivery', 0.000, 0.000, 0.000),
(134, '5e9aa57cb9cc9', 8, '', '2020-04-18 15:02:27', 17000, 2, 'delivery', 0.000, 0.000, 0.000),
(135, '5e9ab2c0bc958', 7, '', '2020-04-18 16:40:03', 15000, 2, 'delivery', 0.000, 0.000, 0.000),
(136, '5e9d6172b84cf', 7, '', '2020-04-20 16:48:50', 15000, 1, 'fast', 0.000, 0.000, 0.000),
(137, '5e9d63daac228', 7, '', '2020-04-20 17:01:52', 15000, 1, 'delivery', 0.000, 0.000, 0.000),
(138, '5e9d63daac228', 8, '', '2020-04-20 17:01:57', 17000, 0, 'delivery', 0.000, 0.000, 0.000),
(139, '5e9d63daac228', 9, '', '2020-04-20 17:00:48', 17000, 2, 'delivery', 0.000, 0.000, 0.000),
(140, '5e9d63daac228', 10, '', '2020-04-20 17:00:49', 17000, 1, 'delivery', 0.000, 0.000, 0.000),
(141, '5e9fb0a960e5a', 7, '', '2020-04-22 10:49:40', 15000, 0, 'delivery', 0.000, 0.000, 0.000),
(142, '5e9fb163b698a', 7, '', '2020-04-22 10:55:58', 15000, 1, 'delivery', 0.000, 0.000, 0.000),
(143, '5ea81fd76af0c', 7, '', '2020-04-28 20:21:57', 15000, 8, 'delivery', 0.000, 0.000, 0.000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_kategori_produk` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `judul_produk` varchar(1000) NOT NULL,
  `konten_produk` mediumtext NOT NULL,
  `tanggal_produk` datetime NOT NULL,
  `gambar_produk` varchar(100) NOT NULL,
  `status_produk` int(1) NOT NULL,
  `id_user` int(11) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `ukuran` varchar(20) NOT NULL,
  `hpp` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori_produk`, `id_anggota`, `judul_produk`, `konten_produk`, `tanggal_produk`, `gambar_produk`, `status_produk`, `id_user`, `satuan`, `ukuran`, `hpp`, `harga_jual`, `stok`) VALUES
(9, 7, 0, 'Jengkol (Archidendron pauciflorum)', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table align=\"center\" border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran&nbsp; Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>30-60</td>\r\n			<td>10x15</td>\r\n			<td>Januari dan Februari 2020</td>\r\n			<td>3-4</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-03-19 20:50:49', '20200506100256.png', 0, 244, '', '', 0, 1750, 125000),
(11, 7, 0, 'Petai (Parkia speciosa)', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>30-70</td>\r\n			<td>10x15</td>\r\n			<td>Januari dan Februari 2020</td>\r\n			<td>3-4</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-03-19 20:52:17', '20200506101103.png', 0, 241, '', '', 0, 2500, 122000),
(23, 7, 0, 'Durian (Durio zibethinus)', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>30-60</td>\r\n			<td>10x15</td>\r\n			<td>Januari dan Februari 2020</td>\r\n			<td>3-4</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-03-19 21:01:16', '20200506101222.png', 0, 241, '', '', 0, 1500, 46000),
(28, 12, 0, 'Pompa Punggung JUFA', '<ul>\r\n	<li>Bahan kantong air (terpal)</li>\r\n	<li>Bahan pompa kuningan</li>\r\n	<li>Sistem kerja pompa 2 langkah</li>\r\n	<li>Kapasitas 15 liter</li>\r\n</ul>\r\n', '2020-05-02 15:42:30', '20200502160229.png', 0, 241, '', '', 0, 2500000, 10),
(29, 12, 0, 'Kepyok', '<ul>\r\n	<li>Bahan gagang rotan manau</li>\r\n	<li>Bahan kipas kawat jenis kawat ram ayam galvanis</li>\r\n</ul>\r\n', '2020-05-02 15:43:46', '20200502160345.png', 0, 241, '', '', 0, 250000, 10),
(30, 12, 0, 'Cangkul Garu', '<ul>\r\n	<li>Bahan plat besi 23 mm</li>\r\n	<li>Gagang kayu olahan</li>\r\n</ul>\r\n', '2020-05-02 15:44:46', '20200502160716.png', 0, 241, '', '', 0, 275000, 10),
(31, 12, 0, 'Sekop', '<ul>\r\n	<li>Bahan plat besi 23 mm</li>\r\n	<li>Gagang kayu olahan</li>\r\n</ul>\r\n', '2020-05-02 15:45:05', '20200502161111.png', 0, 241, '', '', 0, 250000, 10),
(32, 12, 0, 'Helm Pemadam', '<p>Warna merah/orange</p>\r\n', '2020-05-02 15:45:37', '20200502161325.png', 0, 241, '', '', 0, 150000, 10),
(33, 12, 0, 'Sarung Tangan Pemadam', '<ul>\r\n	<li>Kain</li>\r\n	<li>Tahan panas</li>\r\n</ul>\r\n', '2020-05-02 15:46:15', '20200502161553.png', 0, 241, '', '', 0, 125000, 10),
(34, 12, 0, 'Baju Dan Celana Lapangan', '<ul>\r\n	<li>Kain America drill</li>\r\n	<li>Warna merah</li>\r\n	<li>Segala ukuran</li>\r\n</ul>\r\n', '2020-05-02 15:46:50', '20200502161717.png', 0, 241, '', '', 0, 225000, 10),
(35, 12, 0, 'Kacamata Pemadam', '', '2020-05-02 15:47:19', '20200502161850.png', 0, 241, '', '', 0, 150000, 10),
(36, 12, 0, 'Sepatu Lapangan', '<ul>\r\n	<li>Bahan kulit</li>\r\n	<li>Alas karet anti slip terdapat besi safety penahan berat</li>\r\n</ul>\r\n', '2020-05-02 15:47:46', '20200502162019.png', 0, 241, '', '', 0, 275000, 10),
(37, 12, 0, 'Hammock', '<ul>\r\n	<li>Bahan parasut</li>\r\n	<li>Bahan kain dalam polar berbulu hangat</li>\r\n</ul>\r\n', '2020-05-02 15:48:07', 'default.jpg', 0, 241, '', '', 0, 175000, 10),
(38, 12, 0, 'Kantong Air Portable', '<ul>\r\n	<li>Bahan terpal korea</li>\r\n	<li>Kapasitas 1000 l, 3000 l</li>\r\n</ul>\r\n', '2020-05-02 15:48:36', '20200502162158.png', 0, 241, '', '', 0, 7000000, 10),
(39, 11, 0, 'Pupuk Organik Blok', '<p>Jumlah Stock 4.000 Biji</p>\r\n', '2020-05-02 16:33:26', '20200502163851.png', 0, 244, '', '', 0, 5500, 3000),
(40, 11, 0, 'Pupuk Organik Curah/Kg', '<p>Jumlah Stock 1.000&nbsp;Kg</p>\r\n', '2020-05-02 16:34:03', '20200502164028.png', 0, 244, '', '', 0, 1500, 800),
(41, 7, 0, 'Mahoni (Swietenia sp)', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>70-100</td>\r\n			<td>15x20</td>\r\n			<td>Juni 2019</td>\r\n			<td>10-12</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 16:56:14', '20200506101414.png', 0, 241, '', '', 0, 6000, 15000),
(42, 7, 0, 'Mahoni (Swietenia sp)', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>30-60</td>\r\n			<td>10x15 dan 9x13</td>\r\n			<td>Januari dan Februari 2020</td>\r\n			<td>3-4</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 16:58:28', '20200506101639.png', 0, 241, '', '', 0, 1750, 332000),
(43, 7, 0, 'Gaharu (Aquilaria malaccensis)', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>50-80</td>\r\n			<td>10x15 dan 8x12</td>\r\n			<td>April 2019</td>\r\n			<td>12</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 16:59:32', '20200506101812.png', 0, 241, '', '', 0, 4000, 10000),
(44, 7, 0, 'Gaharu (Aquilaria malaccensis)', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>30-50</td>\r\n			<td>10x15 dan 8x12</td>\r\n			<td>November dan Desember 2019</td>\r\n			<td>4-6</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:00:43', '20200506101837.png', 0, 241, '', '', 0, 2000, 25000),
(45, 7, 0, 'Nangka (Artocarpus heterophyllus)', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>60-70</td>\r\n			<td>10x15</td>\r\n			<td>Desember 2019</td>\r\n			<td>4</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:01:34', '20200506102022.png', 0, 241, '', '', 0, 2000, 20000),
(46, 7, 0, 'Sengon Buto (Enterolobium cyclocarpum)', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>40-80</td>\r\n			<td>10x15 dan 8x12</td>\r\n			<td>Februari 2020</td>\r\n			<td>3</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:02:44', '20200506102345.png', 0, 241, '', '', 0, 1500, 130000),
(47, 7, 0, 'Johar (Cassia siamea)', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>40-50</td>\r\n			<td>10x15</td>\r\n			<td>Desember 2019</td>\r\n			<td>4</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:03:39', '20200506102541.png', 0, 241, '', '', 0, 2000, 5000),
(48, 7, 0, 'Jabon  Putih (Anthocephalus cadamba)', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>30-60</td>\r\n			<td>10x15</td>\r\n			<td>Januari dan Februari 2020</td>\r\n			<td>\r\n			<p>3-4</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:04:44', '20200506102726.png', 0, 241, '', '', 0, 3000, 6000),
(49, 7, 0, 'Karet (Hevea brasiliensis) Cabutan', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>60-100</td>\r\n			<td>10x15 dan 8x12</td>\r\n			<td>Februari dan Maret 2020</td>\r\n			<td>2-3</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:10:37', '20200506102921.png', 0, 241, '', '', 0, 1100, 185000),
(50, 7, 0, 'Karet (Hevea brasiliensis) Okulasi ', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>30-50</td>\r\n			<td>15x20 dan 15x25</td>\r\n			<td>Februari 2020</td>\r\n			<td>3</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:11:29', '20200506102950.png', 0, 241, '', '', 0, 7000, 5000),
(51, 7, 0, 'Minyak Kayu Putih (Melaleuca leucadendron)', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>30-53</td>\r\n			<td>10x15 dan 8x12</td>\r\n			<td>Februari 2020</td>\r\n			<td>3</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:12:39', '20200506103212.png', 0, 241, '', '', 0, 3500, 43000),
(52, 7, 0, 'Minyak Kayu Putih (Melaleuca leucadendron)', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>10</td>\r\n			<td>9x13</td>\r\n			<td>Maret 2020</td>\r\n			<td>1</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:13:27', '20200506103339.png', 0, 241, '', '', 0, 3500, 5000),
(53, 7, 0, 'Ketapang (Terminalia catappa)', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>40-50</td>\r\n			<td>10x15</td>\r\n			<td>Februari 2020</td>\r\n			<td>3</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:14:35', '20200506103617.png', 0, 241, '', '', 0, 1300, 8000),
(54, 7, 0, 'Kemiri (Terminalia catappa)', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>50-70</td>\r\n			<td>10x15</td>\r\n			<td>Februari 2020</td>\r\n			<td>3</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:15:17', '20200506103832.png', 0, 241, '', '', 0, 3500, 10000),
(55, 7, 0, 'Kopi Arabika (Coffea arabica)', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>30-50</td>\r\n			<td>10x15 dan 8x12</td>\r\n			<td>Januari dan Februari 2020</td>\r\n			<td>3-4</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:16:11', '20200506104044.png', 0, 241, '', '', 0, 1600, 19000),
(56, 7, 0, 'Sungkai Stek (Peronema canescens) ', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>40-100</td>\r\n			<td>10x15</td>\r\n			<td>Januari dan Februari 2020</td>\r\n			<td>3-4</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:17:02', '20200502171702.png', 0, 241, '', '', 0, 2500, 23000),
(57, 7, 0, 'Langsat (Lansium domesticum)', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>25-30</td>\r\n			<td>10x15</td>\r\n			<td>Desember 2019</td>\r\n			<td>5</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:17:38', '20200506104419.png', 0, 241, '', '', 0, 3000, 5000),
(58, 7, 0, 'Trembesi (Samanea saman)', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>30-70</td>\r\n			<td>10x15</td>\r\n			<td>Februari 2020</td>\r\n			<td>3</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:18:55', '20200506104551.png', 0, 241, '', '', 0, 1500, 30000),
(59, 7, 0, 'Randu (Ceiba pentandra)', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>30-40</td>\r\n			<td>10x15</td>\r\n			<td>Februari dan Maret 2020</td>\r\n			<td>2-3</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:20:03', '20200506104757.png', 0, 241, '', '', 0, 1500, 6500),
(60, 7, 0, 'Kasturi (Mangifera casturi)', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>30</td>\r\n			<td>10x15 dan 9x13</td>\r\n			<td>Maret 2020</td>\r\n			<td>2</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:21:00', '20200506104954.png', 0, 241, '', '', 0, 2500, 2000),
(61, 7, 0, 'Kayu Manis (Cinnamomum verum)', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>15</td>\r\n			<td>9x13</td>\r\n			<td>Maret 2020</td>\r\n			<td>2</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:21:59', '20200502172159.png', 0, 241, '', '', 0, 3500, 2000),
(62, 7, 0, 'Sengon Laut (Albizia chinensis)', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>30-40</td>\r\n			<td>10x15 dan 8x12</td>\r\n			<td>Februari 2020</td>\r\n			<td>3</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:23:16', '20200502172316.png', 0, 241, '', '', 0, 1500, 10000),
(63, 7, 0, 'Sengon Laut (Albizia chinensis)', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>5</td>\r\n			<td>8x12</td>\r\n			<td>April 2020</td>\r\n			<td>1</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:24:31', '20200502172431.png', 0, 241, '', '', 0, 1500, 15000),
(64, 7, 0, 'Cempedak (Artocarpus integer)', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>30-40</td>\r\n			<td>10x15</td>\r\n			<td>Februari 2020</td>\r\n			<td>3</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:25:21', '20200502172521.png', 0, 241, '', '', 0, 2000, 5000),
(65, 7, 0, 'Alaban (Vitex pubescens)', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>30-40</td>\r\n			<td>10x15</td>\r\n			<td>Februari 2020</td>\r\n			<td>3</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:26:09', '20200506105405.png', 0, 241, '', '', 0, 2000, 5000),
(66, 7, 0, 'Mangga (Mangifera indica) Biji', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>30-50</td>\r\n			<td>10x15</td>\r\n			<td>Januari 2020</td>\r\n			<td>4</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:27:29', '20200502172729.png', 0, 241, '', '', 0, 3500, 2000),
(67, 7, 0, 'Mangga (Mangifera indica) Okulasi ', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>40-50</td>\r\n			<td>15x20</td>\r\n			<td>Februari 2020</td>\r\n			<td>3</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:28:20', '20200502172820.png', 0, 241, '', '', 0, 25000, 2000),
(68, 7, 0, 'Pulai (Alstonia scholaris)', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>8x13</td>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:29:08', '20200502172908.png', 0, 241, '', '', 0, 2000, 350000),
(69, 7, 0, 'Pantung (Dyera costulata)', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>50</td>\r\n			<td>8x13</td>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:29:58', '20200502172958.png', 0, 241, '', '', 0, 2500, 500000),
(70, 7, 0, 'Balangeran (Shorea balangeran)', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>8x13</td>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:30:53', '20200502173053.png', 0, 241, '', '', 0, 1500, 350000),
(71, 7, 0, 'Jambu-Jambu', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>50</td>\r\n			<td>10x15 dan 8x13</td>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:31:48', '20200502173148.png', 0, 241, '', '', 0, 2000, 50000),
(72, 7, 0, 'Tumih', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>55-60</td>\r\n			<td>10x15 dan 8x13</td>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:32:31', '20200502173231.png', 0, 241, '', '', 0, 3000, 30000),
(73, 7, 0, 'Gerunggang', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>10x15</td>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:33:16', '20200502173316.png', 0, 241, '', '', 0, 2500, 20000),
(74, 7, 0, 'Galam (Melaleuca leucadendron)', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<table border=\"1\" bordercolor=\"#ccc\" cellpadding=\"5\" cellspacing=\"0\" style=\"border-collapse:collapse\">\r\n	<tbody>\r\n		<tr>\r\n			<td>Tinggi (cm)</td>\r\n			<td>Ukuran Polibag</td>\r\n			<td>Bulan Sapih</td>\r\n			<td>Umur (Bulan)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n			<td>10x15</td>\r\n			<td>&nbsp;</td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '2020-05-02 17:34:09', '20200502173409.png', 0, 241, '', '', 0, 2000, 20000),
(75, 13, 0, 'Madu Kelulut/Box', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<p>1 box terdiri dari 3 botol masing-masing 85 gr</p>\r\n', '2020-05-03 21:11:44', '20200504145356.png', 0, 241, '', '', 0, 110000, 200),
(76, 13, 0, 'Madu Mangrove/Box', '<p><strong>SPESIFIKASI</strong></p>\r\n\r\n<p>1 box berisi 3 botol masing-masing 85 gr</p>\r\n', '2020-05-04 12:55:04', '20200504132655.png', 0, 241, '', '', 0, 110000, 500);

-- --------------------------------------------------------

--
-- Struktur dari tabel `profile`
--

CREATE TABLE `profile` (
  `id_profile` int(11) NOT NULL,
  `foto_profile` varchar(100) NOT NULL,
  `isi_profile` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `profile`
--

INSERT INTO `profile` (`id_profile`, `foto_profile`, `isi_profile`) VALUES
(1, '20200502093357.png', '<p><strong>HUTANKU</strong> adalah aplikasi berbasis web</p>\r\n\r\n<p>Yang membantu para petani hutan dalam memasarkan produk-produknya lebih luas ke masyarakat, seperti bibit, pupuk organik, madu, alat pemadam dan produk turunan hasil hutan bukan kayu lainnya.</p>\r\n\r\n<p><strong>A. Bibit</strong></p>\r\n\r\n<p>Salah satu produk petani hutan diantaranya bibit-bibit tanaman kehutanan yang dibutuhkan untuk kegiatan penghijauan, rehabilitasi dan reboisasi seperti Jengkol, Petai, Durian, Mahoni, Gaharu, Nangka, Sengon, Sengon Buto, Johar, Jabon, Karet, Minyak Kayu Putih, Ketapang, Kemiri, Kopi, Sungkai, Langsat, Trembesi, Randu, Kasturi, Kayu Manis, Sengon, Cempedak, Alaban, Mangga, Pulai, Pantung, Balangeran, Jambu-Jambu, Tumih, Gerunggang, Galam, dll.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>B. Pupuk Organik</strong></p>\r\n\r\n<p>Pupuk yang diproduksi berbahan baku organik karena berasal dari kotoran hewan yang sudah difermentasi. Terdapat 2 varian yaitu blok dan curah. Pupuk organik ini cocok untuk segala jenis macam tanaman, seperti sawit, jagung, tanaman kehutanan, dll.</p>\r\n\r\n<p>Aplikasi di lapangan sangat efektif dan efisien. Pupuk organik blok dapat langsung dimasukkan ke lubang tanam bersamaan dengan pembuatan lubang tanam dan proses penanaman bibit. Sedangkan pupuk organik curah dapat langsung dicampur dengan tanah atau ditempatkan di permukaan tanah pada saat proses penanaman ataupun pemeliharaan tanaman.</p>\r\n\r\n<p>Keunggulan pupuk organik ini adalah ramah lingkungan, tahan lama (hingga 1 tahun), meningkatkan kesuburan tanah dan mampu menampung kadar air tanah.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>C. Madu</strong></p>\r\n\r\n<p>Madu yang diproduksi para petani hutan berasal dari pedalaman hutan kalimantan seperti madu kelulut&nbsp; dan madu mangrove.&nbsp;</p>\r\n\r\n<p>Apa itu madu kelulut ?</p>\r\n\r\n<p>Madu kelulut merupakan madu yang dihasilkan dari lebah tanpa sengat (Stingless bee). Lebah ini lebih dikenal dengan nama Kelulut atau Klanceng atau Teuweul (Trigona sp). Terdapat lebih dari 500 spesies kelulut di dunia, termasuk di Indonesia.</p>\r\n\r\n<p>Kelulut menyimpan madu di dalam tempayan atau sarang kecil yang dilapisi propolis. Propolis terbentuk dari bahan resin atau getah yang diambil lebah dari pohon.</p>\r\n\r\n<p>Kenapa rasa madu kelulut cenderung asam/pahit ?</p>\r\n\r\n<p>Rasa asam atau pahit yang identik dengan madu kelulut disebabkan kandungan beberapa jenis asam penting dan ester. Rasa tersebut juga disebabkan adanya madu dengan bee pollen (serbuk sari) dan propolis.</p>\r\n\r\n<p>Apa itu madu mangrove ?</p>\r\n\r\n<p>Madu Mangrove merupakan madu yang dihasilkan dari lebah Apis dorsata, Apis cerana dan Apis mellifera. Lebah mengambil nektar bunga mangrove untuk diolah menjadi madu.</p>\r\n\r\n<p>Madu mangrove masuk dalam kategori langka, hal ini dikarenakan keberadaan hutan mangrove di banyak tempat sudah mengalami kerusakan.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>D. Alat-Alat Pemadam Kebakaran</strong></p>\r\n\r\n<p>Alat-alat pemadam ini merupakan peralatan dan perlengkapan standart yang dibutuhkan dalam rangka pengamanan dan pengendalian kebakaran hutan dan lahan.</p>\r\n');

-- --------------------------------------------------------

--
-- Struktur dari tabel `promo`
--

CREATE TABLE `promo` (
  `kode_promo` varchar(50) NOT NULL,
  `deskripsi_promo` mediumtext NOT NULL,
  `potongan_promo` int(11) NOT NULL,
  `tanggal_awal_promo` date NOT NULL,
  `tanggal_akhir_promo` date NOT NULL,
  `minimal_transaksi` int(11) NOT NULL,
  `id_user_promo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `promo`
--

INSERT INTO `promo` (`kode_promo`, `deskripsi_promo`, `potongan_promo`, `tanggal_awal_promo`, `tanggal_akhir_promo`, `minimal_transaksi`, `id_user_promo`) VALUES
('ANTONIO', 'Test', 10000, '2019-06-01', '2019-06-01', 25000, 1),
('Galih', '-', 5000, '2019-06-24', '2019-06-24', 1000, 1),
('RAMADHAN', 'Promo selama bulan ramadhan1', 10000, '2019-05-05', '2019-06-04', 100000, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `cabang` tinyint(1) NOT NULL,
  `sms` tinyint(1) NOT NULL,
  `harga_wa` double NOT NULL,
  `harga_sms` double NOT NULL,
  `bonus_wa` double NOT NULL,
  `bonus_sms` double NOT NULL,
  `sms_user` varchar(255) NOT NULL,
  `sms_pass` varchar(255) NOT NULL,
  `wa_apikey1` varchar(255) NOT NULL,
  `wa_apikey2` varchar(255) NOT NULL,
  `wa_apikey3` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `setting`
--

INSERT INTO `setting` (`id`, `nama`, `cabang`, `sms`, `harga_wa`, `harga_sms`, `bonus_wa`, `bonus_sms`, `sms_user`, `sms_pass`, `wa_apikey1`, `wa_apikey2`, `wa_apikey3`) VALUES
(1, 'MAN 2 TAPIN', 0, 0, 200000, 0, 0, 0, 'n34xjv', 'PuL$@20!7', 'GOFGIFLL2HU9L5CYSOJH', 'GOFGIFLL2HU9L5CYSOJH', 'GOFGIFLL2HU9L5CYSOJH');

-- --------------------------------------------------------

--
-- Struktur dari tabel `slide`
--

CREATE TABLE `slide` (
  `id_slide` int(11) NOT NULL,
  `gambar_slide` varchar(100) NOT NULL,
  `status_slide` int(1) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `slide`
--

INSERT INTO `slide` (`id_slide`, `gambar_slide`, `status_slide`, `id_user`) VALUES
(4, '20200501005922.png', 1, 241),
(8, '20200508072044.png', 1, 244);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sosmed`
--

CREATE TABLE `sosmed` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `icon` varchar(25) NOT NULL,
  `link` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sosmed`
--

INSERT INTO `sosmed` (`id`, `nama`, `icon`, `link`) VALUES
(1, 'Facebook Hutanku', '20200501082509.png', 'https://web.facebook.com/citraberkahsejahtera'),
(2, 'Youtube Hutanku', '20200501082746.png', 'https://www.youtube.com/channel/UCti5bY3Yz1pKr2VTmjV22Mg/?guided_help_flow=5'),
(3, 'Instagram Hutanku', '20200503202818.png', 'https://www.instagram.com/hutanku.id/');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL,
  `nama_supplier` varchar(100) NOT NULL,
  `alamat_supplier` varchar(100) NOT NULL,
  `no_telp_supplier` varchar(50) NOT NULL,
  `no_rek_supplier` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `alamat_supplier`, `no_telp_supplier`, `no_rek_supplier`) VALUES
(2, 'BU YENI', 'Jl. Trikora, Sidomulyo Landasan Ulin', '081259767878', ''),
(3, 'M. Harun', 'Jl. Trikora, Sidomulyo Landasan Ulin', '000', ''),
(4, 'Pitoko', 'Jl. Sei Salak Landasan Ulin', '085251110698', ''),
(5, 'Ramin', 'Jl. Sei Salak Landasan Ulin', '081349763493', ''),
(6, 'Ngadi KT. Segar Sari', 'Jl. Sei Salak RT 33 Kel.Gt.Manggis Kec. Land.Ulin', '081351243806', ''),
(7, 'Irus', 'Gt. Harapan', '000', ''),
(8, 'Tumbang Nusa', 'Kalimantan Tengah', '000', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `role` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `token`, `role`, `last_login`) VALUES
(241, 'admin', '59144aac813e88c019183501de759149', '0c2ee8261d684cafab1a0a1a8adfbab7', 2, '2020-05-25 20:47:26'),
(243, 'okiest', '59144aac813e88c019183501de759149', 'f0efc2ce2ff4490cebd641190f98c74b', 2, '2020-05-02 19:54:22'),
(244, 'admin2', '59144aac813e88c019183501de759149', '6679e0fd16e6e28629c5d1439b2e790f', 2, '2020-05-19 12:48:48');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id_config`);

--
-- Indeks untuk tabel `detail_produk_supplier`
--
ALTER TABLE `detail_produk_supplier`
  ADD PRIMARY KEY (`id_detail_produk_supplier`);

--
-- Indeks untuk tabel `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id_info`);

--
-- Indeks untuk tabel `kategori_produk`
--
ALTER TABLE `kategori_produk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `konsultasi`
--
ALTER TABLE `konsultasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesanan`);

--
-- Indeks untuk tabel `pesanan_detail`
--
ALTER TABLE `pesanan_detail`
  ADD PRIMARY KEY (`id_pesanan_detail`);

--
-- Indeks untuk tabel `pesanan_temp`
--
ALTER TABLE `pesanan_temp`
  ADD PRIMARY KEY (`id_pesanan_temp`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id_profile`);

--
-- Indeks untuk tabel `promo`
--
ALTER TABLE `promo`
  ADD PRIMARY KEY (`kode_promo`);

--
-- Indeks untuk tabel `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id_slide`);

--
-- Indeks untuk tabel `sosmed`
--
ALTER TABLE `sosmed`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `config`
--
ALTER TABLE `config`
  MODIFY `id_config` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `detail_produk_supplier`
--
ALTER TABLE `detail_produk_supplier`
  MODIFY `id_detail_produk_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `info`
--
ALTER TABLE `info`
  MODIFY `id_info` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `kategori_produk`
--
ALTER TABLE `kategori_produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `konsultasi`
--
ALTER TABLE `konsultasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_pesanan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pesanan_detail`
--
ALTER TABLE `pesanan_detail`
  MODIFY `id_pesanan_detail` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pesanan_temp`
--
ALTER TABLE `pesanan_temp`
  MODIFY `id_pesanan_temp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT untuk tabel `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `slide`
--
ALTER TABLE `slide`
  MODIFY `id_slide` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `sosmed`
--
ALTER TABLE `sosmed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
