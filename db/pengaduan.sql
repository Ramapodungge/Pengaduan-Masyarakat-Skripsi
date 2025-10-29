-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 29 Okt 2025 pada 06.50
-- Versi server: 8.0.30
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Basis data: `pengaduan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int UNSIGNED NOT NULL,
  `id_instansi` int DEFAULT NULL,
  `nama_admin` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `level` enum('Admin','Operator') COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `id_instansi`, `nama_admin`, `username`, `password`, `level`) VALUES
(1, 6, 'RandomNameFormAdmin', 'gen_z@gmail.com', '$2y$10$1m03wbZh68UevqROvqIkC.Lq0aMtZVe74exbQeNdinKqXYhQuCbm2', 'Admin'),
(2, 1, 'Eko Prasetiyo', 'eko778@gmail.com', '$2y$10$MoRmADEdlBMN6NMhsPPMMOGOwp1MjSORJiBPzj1VBmCId9vOc.XOa', 'Operator'),
(3, 2, 'Admin 2', 'admin@gmail.com', '$2y$10$36nYXKUp8N3Iz7Rv1Q2oAOBsx5ymxV3siWnQJqxJ5WgtfjJNugNyK', 'Operator'),
(4, 3, 'Admin 3', 'admin3@gmail.com', '$2y$10$n4kIJPQOwiw0ne1EP0V2AeprEFIwTvf6XZw7oUgj3TQ7Ha7sYeTZe', 'Operator'),
(5, 4, 'Admin 4', 'admin4@gmail.com', '$2y$10$8/Gn0l5QX1XlufNxjqzNmOcfU0mnN3gSqqXL7rpN3mVQnkC/GLbqW', 'Operator'),
(6, 5, 'Admin 5', 'admin5@gmail.com', '$2y$10$veyjjtr8qtMB1lXGR9b6M.uId0Cc6slH5Q..T6zRc2yyfEpGbKz76', 'Operator'),
(7, 6, 'Super Admin', 'super.admin@gmail.com', '$2y$10$6MDBbr8.3OqSVH2lBvh.Tej7nh9YC8g.qpJaZqEg5d2OXpJKfUCdO', 'Admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `deskripsi_kategori`
--

CREATE TABLE `deskripsi_kategori` (
  `id_deskripsi` int UNSIGNED NOT NULL,
  `id_kategori` int NOT NULL,
  `isi_deskripsi` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `deskripsi_kategori`
--

INSERT INTO `deskripsi_kategori` (`id_deskripsi`, `id_kategori`, `isi_deskripsi`) VALUES
(1, 3, 'Jalan dan Jembatan: Kerusakan pada jalan, jembatan yang tidak aman, atau proyek infrastruktur yang terhambat.'),
(2, 3, 'Taman dan Fasilitas Umum: Kerusakan pada taman, lapangan olahraga, atau fasilitas umum lainnya.'),
(3, 6, 'Kejahatan atau Keamanan: Pengaduan tentang tindakan kriminal, pencurian, atau masalah keamanan lainnya.'),
(4, 6, 'Pemadam Kebakaran: Keluhan terkait pelayanan pemadam kebakaran atau penanganan bencana kebakaran'),
(5, 5, 'Fasilitas Kesehatan: Masalah terkait rumah sakit, puskesmas, klinik, atau fasilitas kesehatan lainnya.'),
(6, 5, 'Pelayanan Kesehatan: Pengaduan tentang pelayanan medis yang kurang memadai, obat-obatan yang tidak tersedia, atau penanganan pasien.'),
(7, 2, 'Pendaftaran dan Perizinan: Pengaduan terkait pembuatan KTP, SIM, paspor, perizinan usaha, atau administrasi lainnya.'),
(8, 2, 'Bantuan Sosial: Masalah terkait distribusi bantuan sosial atau ketidakadilan dalam penerimaannya.'),
(9, 2, 'Pajak dan Retribusi: Keluhan terkait pengelolaan pajak atau retribusi daerah'),
(10, 4, 'Sekolah dan Pendidikan: Masalah terkait fasilitas pendidikan, kualitas pengajaran, atau kebijakan pendidikan.'),
(11, 4, 'Beasiswa dan Dukungan Pendidikan: Permasalahan terkait pengajuan beasiswa atau program dukungan pendidikan lainnya.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `feedback`
--

CREATE TABLE `feedback` (
  `id_feedback` int UNSIGNED NOT NULL,
  `id_pengaduan` int NOT NULL,
  `feedback` text COLLATE utf8mb4_general_ci,
  `waktu_kirim` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `feedback`
--

INSERT INTO `feedback` (`id_feedback`, `id_pengaduan`, `feedback`, `waktu_kirim`) VALUES
(1, 201, 'Terimakasih Sudah Dialokasi Pak🔥', '2025-10-29 03:50:49'),
(3, 202, 'Waduh. Makasih banyak nih pak. Responya Cepat Sekali❤️🔥', '2025-10-29 03:44:32'),
(4, 203, 'Okeii Min', '2025-10-29 04:44:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `histori_pengaduan`
--

CREATE TABLE `histori_pengaduan` (
  `id_histori` int UNSIGNED NOT NULL,
  `id_pengaduan` int NOT NULL,
  `status` enum('Diajukan','Terverifikasi','Dialokasi','Dalam Proses','Selesai','Ditolak') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `keterangan` text COLLATE utf8mb4_general_ci,
  `created_att` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `histori_pengaduan`
--

INSERT INTO `histori_pengaduan` (`id_histori`, `id_pengaduan`, `status`, `keterangan`, `created_att`) VALUES
(1, 1, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(2, 2, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(3, 2, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:00'),
(4, 2, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:00'),
(5, 2, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:00'),
(6, 3, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(7, 3, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:00'),
(8, 3, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:00'),
(9, 3, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:00'),
(10, 3, 'Selesai', 'Status Selesai', '2025-10-28 03:29:00'),
(11, 4, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(12, 4, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:00'),
(13, 4, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:00'),
(14, 5, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(15, 5, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:00'),
(16, 5, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:00'),
(17, 5, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:00'),
(18, 6, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(19, 6, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:00'),
(20, 7, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(21, 8, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(22, 8, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:00'),
(23, 9, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(24, 9, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:00'),
(25, 9, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:00'),
(26, 9, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:00'),
(27, 9, 'Selesai', 'Status Selesai', '2025-10-28 03:29:00'),
(28, 10, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(29, 11, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(30, 12, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(31, 13, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(32, 13, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:00'),
(33, 14, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(34, 14, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:00'),
(35, 14, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:00'),
(36, 14, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:00'),
(37, 14, 'Selesai', 'Status Selesai', '2025-10-28 03:29:00'),
(38, 15, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(39, 15, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:00'),
(40, 15, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:00'),
(41, 16, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(42, 16, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:00'),
(43, 16, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:00'),
(44, 16, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:00'),
(45, 17, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(46, 18, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(47, 18, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:00'),
(48, 18, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:00'),
(49, 18, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:00'),
(50, 19, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(51, 20, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(52, 21, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(53, 21, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:00'),
(54, 21, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:00'),
(55, 21, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:00'),
(56, 22, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(57, 23, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(58, 23, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:00'),
(59, 23, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:00'),
(60, 24, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(61, 25, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(62, 25, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:00'),
(63, 25, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:00'),
(64, 25, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:00'),
(65, 25, 'Selesai', 'Status Selesai', '2025-10-28 03:29:00'),
(66, 26, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(67, 26, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:00'),
(68, 26, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:00'),
(69, 26, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:00'),
(70, 27, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(71, 27, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:00'),
(72, 27, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:00'),
(73, 27, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:00'),
(74, 27, 'Selesai', 'Status Selesai', '2025-10-28 03:29:00'),
(75, 28, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(76, 28, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:00'),
(77, 28, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:00'),
(78, 29, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(79, 30, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(80, 31, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(81, 31, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:00'),
(82, 31, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:00'),
(83, 31, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:00'),
(84, 32, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(85, 32, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:00'),
(86, 32, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:00'),
(87, 32, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:00'),
(88, 33, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(89, 34, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(90, 34, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:00'),
(91, 34, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:00'),
(92, 35, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(93, 35, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:00'),
(94, 36, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:00'),
(95, 36, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:00'),
(96, 36, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:00'),
(97, 36, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(98, 36, 'Selesai', 'Status Selesai', '2025-10-28 03:29:01'),
(99, 37, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(100, 37, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(101, 37, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(102, 38, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(103, 38, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(104, 38, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(105, 38, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(106, 38, 'Selesai', 'Status Selesai', '2025-10-28 03:29:01'),
(107, 39, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(108, 39, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(109, 39, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(110, 40, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(111, 41, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(112, 41, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(113, 41, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(114, 42, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(115, 43, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(116, 44, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(117, 45, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(118, 46, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(119, 46, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(120, 47, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(121, 47, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(122, 47, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(123, 47, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(124, 48, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(125, 48, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(126, 49, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(127, 49, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(128, 49, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(129, 49, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(130, 50, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(131, 51, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(132, 52, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(133, 52, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(134, 53, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(135, 54, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(136, 54, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(137, 54, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(138, 55, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(139, 55, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(140, 56, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(141, 57, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(142, 58, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(143, 58, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(144, 59, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(145, 59, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(146, 59, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(147, 59, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(148, 59, 'Selesai', 'Status Selesai', '2025-10-28 03:29:01'),
(149, 60, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(150, 60, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(151, 61, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(152, 61, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(153, 61, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(154, 61, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(155, 62, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(156, 62, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(157, 62, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(158, 62, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(159, 63, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(160, 64, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(161, 64, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(162, 64, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(163, 64, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(164, 64, 'Selesai', 'Status Selesai', '2025-10-28 03:29:01'),
(165, 65, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(166, 66, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(167, 66, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(168, 66, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(169, 66, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(170, 67, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(171, 68, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(172, 68, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(173, 68, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(174, 68, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(175, 68, 'Selesai', 'Status Selesai', '2025-10-28 03:29:01'),
(176, 69, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(177, 70, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(178, 71, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(179, 71, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(180, 71, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(181, 72, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(182, 72, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(183, 72, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(184, 73, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(185, 74, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(186, 74, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(187, 74, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(188, 74, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(189, 75, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(190, 75, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(191, 75, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(192, 75, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(193, 75, 'Selesai', 'Status Selesai', '2025-10-28 03:29:01'),
(194, 76, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(195, 76, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(196, 76, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(197, 76, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(198, 77, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(199, 77, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(200, 77, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(201, 78, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(202, 78, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(203, 79, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(204, 80, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(205, 80, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(206, 80, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(207, 80, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(208, 81, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(209, 82, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(210, 83, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(211, 83, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(212, 84, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(213, 85, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(214, 85, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(215, 85, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(216, 86, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(217, 86, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(218, 86, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(219, 87, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(220, 88, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(221, 88, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(222, 88, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(223, 88, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(224, 88, 'Selesai', 'Status Selesai', '2025-10-28 03:29:01'),
(225, 89, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(226, 89, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(227, 89, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(228, 89, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(229, 90, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(230, 91, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(231, 91, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(232, 92, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(233, 93, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(234, 93, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(235, 93, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(236, 94, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(237, 95, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(238, 96, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(239, 97, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(240, 97, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(241, 97, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(242, 97, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(243, 97, 'Selesai', 'Status Selesai', '2025-10-28 03:29:01'),
(244, 98, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(245, 98, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(246, 98, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(247, 99, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(248, 99, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(249, 99, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(250, 99, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(251, 100, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(252, 100, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(253, 101, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(254, 101, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(255, 101, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(256, 101, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(257, 102, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(258, 102, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(259, 102, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(260, 103, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(261, 103, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(262, 103, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(263, 103, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(264, 104, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(265, 105, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(266, 106, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(267, 106, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(268, 106, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(269, 106, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(270, 107, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(271, 107, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(272, 107, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(273, 108, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(274, 109, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(275, 109, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(276, 109, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(277, 109, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(278, 109, 'Selesai', 'Status Selesai', '2025-10-28 03:29:01'),
(279, 110, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(280, 111, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(281, 112, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(282, 113, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(283, 113, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(284, 113, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(285, 113, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(286, 113, 'Selesai', 'Status Selesai', '2025-10-28 03:29:01'),
(287, 114, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(288, 114, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(289, 115, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(290, 116, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(291, 116, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(292, 116, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(293, 117, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(294, 117, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(295, 117, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(296, 118, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(297, 118, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(298, 118, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(299, 119, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(300, 120, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(301, 121, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(302, 121, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(303, 121, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(304, 122, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(305, 122, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(306, 122, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(307, 123, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(308, 123, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(309, 123, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(310, 124, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(311, 124, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(312, 125, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(313, 125, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(314, 125, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(315, 125, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(316, 125, 'Selesai', 'Status Selesai', '2025-10-28 03:29:01'),
(317, 126, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(318, 126, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(319, 127, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(320, 127, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(321, 127, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(322, 128, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(323, 128, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(324, 128, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(325, 128, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(326, 129, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(327, 129, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(328, 129, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(329, 129, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(330, 129, 'Selesai', 'Status Selesai', '2025-10-28 03:29:01'),
(331, 130, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(332, 130, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(333, 130, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(334, 130, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(335, 131, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(336, 132, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(337, 133, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(338, 133, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(339, 133, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(340, 133, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(341, 134, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(342, 134, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(343, 135, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(344, 135, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(345, 136, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(346, 136, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(347, 136, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(348, 136, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(349, 136, 'Selesai', 'Status Selesai', '2025-10-28 03:29:01'),
(350, 137, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(351, 137, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(352, 137, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(353, 138, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(354, 139, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(355, 140, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(356, 140, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(357, 140, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(358, 141, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(359, 141, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(360, 141, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(361, 142, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(362, 142, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(363, 142, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(364, 143, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(365, 143, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(366, 143, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(367, 144, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(368, 144, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(369, 144, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(370, 145, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(371, 146, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(372, 146, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(373, 146, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(374, 147, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(375, 147, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(376, 147, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(377, 148, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(378, 149, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(379, 149, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(380, 149, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(381, 149, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(382, 149, 'Selesai', 'Status Selesai', '2025-10-28 03:29:01'),
(383, 150, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(384, 150, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(385, 150, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(386, 151, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(387, 151, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(388, 152, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(389, 152, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(390, 152, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(391, 152, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(392, 153, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(393, 153, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(394, 153, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(395, 153, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(396, 153, 'Selesai', 'Status Selesai', '2025-10-28 03:29:01'),
(397, 154, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(398, 154, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(399, 154, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(400, 155, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(401, 155, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(402, 155, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(403, 156, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(404, 156, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(405, 157, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(406, 157, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(407, 158, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(408, 158, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(409, 158, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(410, 158, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:01'),
(411, 159, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(412, 160, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:01'),
(413, 160, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:01'),
(414, 160, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:01'),
(415, 161, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(416, 162, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(417, 162, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:02'),
(418, 162, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:02'),
(419, 163, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(420, 163, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:02'),
(421, 163, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:02'),
(422, 163, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:02'),
(423, 164, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(424, 165, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(425, 165, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:02'),
(426, 165, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:02'),
(427, 166, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(428, 167, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(429, 168, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(430, 169, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(431, 169, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:02'),
(432, 170, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(433, 170, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:02'),
(434, 171, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(435, 171, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:02'),
(436, 171, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:02'),
(437, 171, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:02'),
(438, 171, 'Selesai', 'Status Selesai', '2025-10-28 03:29:02'),
(439, 172, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(440, 172, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:02'),
(441, 173, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(442, 174, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(443, 174, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:02'),
(444, 174, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:02'),
(445, 175, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(446, 176, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(447, 177, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(448, 177, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:02'),
(449, 177, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:02'),
(450, 177, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:02'),
(451, 178, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(452, 178, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:02'),
(453, 178, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:02'),
(454, 179, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(455, 179, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:02'),
(456, 179, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:02'),
(457, 180, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(458, 181, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(459, 181, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:02'),
(460, 181, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:02'),
(461, 181, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:02'),
(462, 181, 'Selesai', 'Status Selesai', '2025-10-28 03:29:02'),
(463, 182, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(464, 183, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(465, 183, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:02'),
(466, 183, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:02'),
(467, 183, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:02'),
(468, 183, 'Selesai', 'Status Selesai', '2025-10-28 03:29:02'),
(469, 184, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(470, 185, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(471, 185, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:02'),
(472, 185, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:02'),
(473, 185, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:02'),
(474, 186, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(475, 187, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(476, 187, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:02'),
(477, 187, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:02'),
(478, 187, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:02'),
(479, 187, 'Selesai', 'Status Selesai', '2025-10-28 03:29:02'),
(480, 188, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(481, 189, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(482, 190, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(483, 191, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(484, 191, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:02'),
(485, 191, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:02'),
(486, 191, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:02'),
(487, 192, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(488, 192, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:02'),
(489, 192, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:02'),
(490, 193, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(491, 194, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(492, 195, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(493, 195, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:02'),
(494, 195, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:02'),
(495, 195, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:02'),
(496, 196, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(497, 197, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(498, 198, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(499, 198, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:02'),
(500, 199, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(501, 199, 'Terverifikasi', 'Status Terverifikasi', '2025-10-28 03:29:02'),
(502, 199, 'Dialokasi', 'Status Dialokasi', '2025-10-28 03:29:02'),
(503, 199, 'Dalam Proses', 'Status Dalam Proses', '2025-10-28 03:29:02'),
(504, 200, 'Diajukan', 'Status Diajukan', '2025-10-28 03:29:02'),
(505, 1, 'Terverifikasi', 'Pengaduan Anda telah diverifikasi oleh pihak kecamatan. Pengaduan akan segera dialokasikan ke instansi terkait.', '2025-10-28 04:20:04'),
(506, 1, 'Dalam Proses', 'Pengaduan Anda sedang dalam proses peninjauan atau penanganan oleh pihak instansi. Kami akan menginformasikan kembali setelah proses selesai.', '2025-10-28 04:21:22'),
(507, 1, 'Selesai', 'Pengaduan Anda telah selesai diproses oleh pihak instansi. Terima kasih telah berpartisipasi dalam membangun lingkungan yang lebih baik.', '2025-10-28 04:22:49'),
(508, 1, 'Selesai', 'Pengaduan Anda telah selesai diproses oleh pihak instansi. Terima kasih telah berpartisipasi dalam membangun lingkungan yang lebih baik.', '2025-10-28 04:22:54'),
(509, 10, 'Terverifikasi', 'Pengaduan Anda telah diverifikasi oleh pihak kecamatan. Pengaduan akan segera dialokasikan ke instansi terkait.', '2025-10-28 04:23:48'),
(510, 8, 'Dalam Proses', 'Pengaduan Anda sedang dalam proses peninjauan atau penanganan oleh pihak instansi. Kami akan menginformasikan kembali setelah proses selesai.', '2025-10-28 04:24:09'),
(511, 8, 'Selesai', 'Pengaduan Anda telah selesai diproses oleh pihak instansi. Terima kasih telah berpartisipasi dalam membangun lingkungan yang lebih baik.', '2025-10-28 04:24:45'),
(512, 201, 'Diajukan', 'Pengaduan Anda telah berhasil diajukan dan menunggu proses verifikasi dari pihak kecamatan. Mohon bersabar, kami akan segera menindaklanjuti laporan Anda.', '2025-10-28 06:11:04'),
(513, 201, 'Terverifikasi', 'Pengaduan Anda telah diverifikasi oleh pihak kecamatan. Pengaduan akan segera dialokasikan ke instansi terkait.', '2025-10-28 06:16:26'),
(517, 201, 'Dialokasi', 'Pengaduan Anda telah dialokasikan ke instansi yang sesuai, dan sedang menunggu tindak lanjut dari pihak terkait.', '2025-10-28 06:50:38'),
(518, 201, 'Dalam Proses', 'Pengaduan Anda sedang dalam proses peninjauan atau penanganan oleh pihak instansi. Kami akan menginformasikan kembali setelah proses selesai.', '2025-10-28 07:02:52'),
(519, 201, 'Selesai', 'Pengaduan Anda telah selesai diproses oleh pihak instansi. Terima kasih telah berpartisipasi dalam membangun lingkungan yang lebih baik.', '2025-10-28 07:04:25'),
(520, 202, 'Diajukan', 'Pengaduan Anda telah berhasil diajukan dan menunggu proses verifikasi dari pihak kecamatan. Mohon bersabar, kami akan segera menindaklanjuti laporan Anda.', '2025-10-29 03:07:36'),
(521, 202, 'Terverifikasi', 'Pengaduan Anda telah diverifikasi oleh pihak kecamatan. Pengaduan akan segera dialokasikan ke instansi terkait.', '2025-10-29 03:13:46'),
(522, 202, 'Dialokasi', 'Pengaduan Anda telah dialokasikan ke instansi yang sesuai, dan sedang menunggu tindak lanjut dari pihak terkait.', '2025-10-29 03:18:29'),
(523, 202, 'Dalam Proses', 'Pengaduan Anda sedang dalam proses peninjauan atau penanganan oleh pihak instansi. Kami akan menginformasikan kembali setelah proses selesai.', '2025-10-29 03:23:36'),
(524, 202, 'Selesai', 'Pengaduan Anda telah selesai diproses oleh pihak instansi. Terima kasih telah berpartisipasi dalam membangun lingkungan yang lebih baik.', '2025-10-29 03:36:01'),
(525, 203, 'Diajukan', 'Pengaduan Anda telah berhasil diajukan dan menunggu proses verifikasi dari pihak kecamatan. Mohon bersabar, kami akan segera menindaklanjuti laporan Anda.', '2025-10-29 04:17:50'),
(526, 203, 'Terverifikasi', 'Pengaduan Anda telah diverifikasi oleh pihak kecamatan. Pengaduan akan segera dialokasikan ke instansi terkait.', '2025-10-29 04:21:07'),
(527, 203, 'Dalam Proses', 'Pengaduan Anda sedang dalam proses peninjauan atau penanganan oleh pihak instansi. Kami akan menginformasikan kembali setelah proses selesai.', '2025-10-29 04:21:43'),
(528, 203, 'Selesai', 'Pengaduan Anda telah selesai diproses oleh pihak instansi. Terima kasih telah berpartisipasi dalam membangun lingkungan yang lebih baik.', '2025-10-29 04:43:21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `instansi`
--

CREATE TABLE `instansi` (
  `id_instansi` int UNSIGNED NOT NULL,
  `nama_instansi` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `instansi`
--

INSERT INTO `instansi` (`id_instansi`, `nama_instansi`) VALUES
(1, 'Instansi A'),
(2, 'Instansi B'),
(3, 'Instansi C'),
(4, 'Instansi D'),
(5, 'Instansi E'),
(6, 'Kecamatan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_pengaduan`
--

CREATE TABLE `kategori_pengaduan` (
  `id_kategori` int UNSIGNED NOT NULL,
  `nama_kategori` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori_pengaduan`
--

INSERT INTO `kategori_pengaduan` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Layanan Publik'),
(2, 'Pelayanan Pemerintah'),
(3, 'Infrastruktur dan Fasilitas Umum'),
(4, 'Pendidikan'),
(5, 'Kesehatan'),
(6, 'Keamanan dan Ketertiban');

-- --------------------------------------------------------

--
-- Struktur dari tabel `masyarakat`
--

CREATE TABLE `masyarakat` (
  `nik` varchar(17) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_pengadu` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_general_ci,
  `tgl_lahir` date DEFAULT NULL,
  `no_telpon` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jenis_kelamin` enum('L','P') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pekerjaan` enum('Pelajar/Mahasiswa/Akademisi','Profesional','Wirausaha','Pemerintahan','Petani','Nelayan','Lainnya') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kampus` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jurusan` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `instansi` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jabatan` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `level` enum('warga','tamu') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `masyarakat`
--

INSERT INTO `masyarakat` (`nik`, `nama_pengadu`, `email`, `password`, `alamat`, `tgl_lahir`, `no_telpon`, `jenis_kelamin`, `pekerjaan`, `kampus`, `jurusan`, `instansi`, `jabatan`, `level`, `created_at`, `updated_at`) VALUES
('1212332332323232', 'Moh.Ramadhan Podungge', 'rama.podungge46@gmail.com', '$2y$10$ZkXOhzQLHCGmb6ryAY01Pue87ZxAvAdQQkRAYCC93ygigOpGw2t4S', 'JL.Bali III, Kecamatan Pulubala, Kota Gorontalo', '2000-01-01', '098778877889', 'L', 'Pelajar/Mahasiswa/Akademisi', 'Universitas Negeri Gorontalo', 'Teknik Informatika', '', '', 'tamu', '2025-10-28 06:05:43', '2025-10-28 09:28:53'),
('3201010101010001', 'Budi Santoso', 'budi@example.com', '$2y$10$riDb5C.D7zFcW1n2AiwhgeE7PJC1mB8wL.1w/lqpPZofJadlpkGLG', 'Jl. Merdeka No. 1', '1995-04-12', '081234567890', 'L', 'Profesional', NULL, NULL, 'PT. Sinar Jaya', 'Staff', 'warga', '2025-10-27 19:08:15', NULL),
('3201010101010002', 'Siti Aisyah', 'siti@example.com', '$2y$10$Qlu/PuUTWhtn8a62c0GyVO448EQic0DWa/LJXNxoQ3Qle0Jtavqzi', 'Jl. Kenangan No. 45', '1998-10-21', '082345678901', 'P', 'Pelajar/Mahasiswa/Akademisi', 'Universitas Maju Bersama', 'Sistem Informasi', NULL, NULL, 'warga', '2025-10-27 19:08:16', NULL),
('3201010101010003', 'Joko Pratama', 'joko@example.com', '$2y$10$CdE8zrRW0XKejdKAeJTDwOgd96CO1MRQx5pqkUVre7Corn7uwqHh.', 'Jl. Pantai Indah No. 78', '1990-02-05', '083345678900', 'L', 'Nelayan', NULL, NULL, NULL, NULL, 'tamu', '2025-10-27 19:08:16', NULL),
('3201010101010004', 'Agus Kurniawan', 'agus@example.com', '$2y$10$7iWSru6I335JEkqJJRAZce71eJ8S137zwzOs5ukMtSQ6qt8Kp7Ch6', 'Jl. Melati No. 10', '1988-11-20', '081267890111', 'L', '', NULL, NULL, NULL, NULL, 'warga', '2025-10-27 19:08:16', NULL),
('3201010101010005', 'Dewi Lestari', 'dewi@example.com', '$2y$10$vFs6KkHgCONYqCYlODeFheflptBzlTd/GSO6sG7/O5GYfVUYmUXjy', 'Jl. Mawar No. 22', '1993-07-09', '081299887766', 'P', 'Profesional', NULL, NULL, 'PT. Makmur Sejahtera', 'Manager', 'warga', '2025-10-27 19:08:16', NULL),
('3201010101010006', 'Rahmat Hidayat', 'rahmat@example.com', '$2y$10$pwDruIwzfr4D2tqWvDBZe.d11ElIGMmuJKMdXKK9iJyWarGz9N4f.', 'Jl. Sudirman No. 3', '1996-03-03', '081244789000', 'L', 'Petani', NULL, NULL, NULL, NULL, 'tamu', '2025-10-27 19:08:16', NULL),
('3201010101010007', 'Putri Maharani', 'putri@example.com', '$2y$10$G8vpSswivgEtcYXvWIJOA.qCAnqj0URYAvyeLK96wIHSU5/TAndaq', 'Jl. Cendana No. 19', '2000-06-15', '081212345678', 'P', 'Pelajar/Mahasiswa/Akademisi', 'Universitas Teknologi Nasional', 'Teknik Informatika', NULL, NULL, 'warga', '2025-10-27 19:08:16', NULL),
('3201010101010008', 'Anto Gunawan', 'anto@example.com', '$2y$10$OpMq2kolqpFMabMgx5e2n.HECN1eOr8Vub/U5QPjO5FKDSi5VJfeq', 'Jl. Pesona Indah Gg 3', '1985-02-22', '081234332221', 'L', 'Nelayan', NULL, NULL, NULL, NULL, 'warga', '2025-10-27 19:08:16', NULL),
('3201010101010009', 'Maya Sari', 'maya@example.com', '$2y$10$uMGNEGxFpp/e1gEpaNlD1.rxKse9N79EVxhJE1uGLf.5IwzKLLdSa', 'Jl. Pasar Baru No. 88', '1999-09-09', '081222334455', 'P', '', NULL, NULL, 'Toko Sari Abadi', 'Owner', 'warga', '2025-10-27 19:08:16', NULL),
('3201010101010010', 'Fajar Nugraha', 'fajar@example.com', '$2y$10$NlTf/vofU1gqZ0xvdSFvzePzX4YbwZPhIWrkMtSGJLlLQGvN0Iwmy', 'Jl. Garuda No. 17', '1994-12-12', '085678901234', 'L', 'Profesional', NULL, NULL, 'PT. Global Tech', 'Operator', 'warga', '2025-10-27 19:08:16', NULL),
('3201010101010011', 'User Dummy 11', 'dummy11@example.com', '$2y$10$CobmtDJTZPgh0p7HXv6GDuRjClMFOM91TvtHgzUo9nhnmPwLEIQn.', 'Alamat Dummy 11', '1990-01-01', '0812000011', 'L', 'Lainnya', NULL, NULL, NULL, NULL, 'tamu', '2025-10-27 19:08:16', NULL),
('3201010101010012', 'User Dummy 12', 'dummy12@example.com', '$2y$10$QbdyxqDKby52k1flFwbpkeFrLoVP11bz1kfq2VEGZw.YNc7hodvOS', 'Alamat Dummy 12', '1990-01-01', '0812000012', 'P', 'Lainnya', NULL, NULL, NULL, NULL, 'tamu', '2025-10-27 19:08:17', NULL),
('3201010101010013', 'User Dummy 13', 'dummy13@example.com', '$2y$10$HB/LH32dtnegesaV9MP5zOZibZLF9sY0Ie4R7vkeZ4vDtdSed9gWq', 'Alamat Dummy 13', '1990-01-01', '0812000013', 'L', 'Lainnya', NULL, NULL, NULL, NULL, 'tamu', '2025-10-27 19:08:17', NULL),
('3201010101010014', 'User Dummy 14', 'dummy14@example.com', '$2y$10$Kb0Eubbzf4p.njqVxn0XZujpxMntBoe8UIGcx3qc1j8jHTFuOcaLm', 'Alamat Dummy 14', '1990-01-01', '0812000014', 'P', 'Lainnya', NULL, NULL, NULL, NULL, 'tamu', '2025-10-27 19:08:17', NULL),
('3201010101010015', 'User Dummy 15', 'dummy15@example.com', '$2y$10$g6bOwM2zXAo15U54JRAsDOgvwhpIx0Hn0BCkmUXF549JKK00BJ.ki', 'Alamat Dummy 15', '1990-01-01', '0812000015', 'L', 'Lainnya', NULL, NULL, NULL, NULL, 'tamu', '2025-10-27 19:08:17', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint UNSIGNED NOT NULL,
  `version` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `class` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `group` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `namespace` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `time` int NOT NULL,
  `batch` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2025-10-27-123639', 'App\\Database\\Migrations\\CreateMasyarakatTable', 'default', 'App', 1761620800, 1),
(2, '2025-10-27-123700', 'App\\Database\\Migrations\\CreateKategoriPengaduanTable', 'default', 'App', 1761620800, 1),
(3, '2025-10-27-123711', 'App\\Database\\Migrations\\CreateInstansiTable', 'default', 'App', 1761620800, 1),
(4, '2025-10-27-123723', 'App\\Database\\Migrations\\CreatePengaduanTable', 'default', 'App', 1761620800, 1),
(5, '2025-10-27-124128', 'App\\Database\\Migrations\\CreateAdminTable', 'default', 'App', 1761620800, 1),
(6, '2025-10-27-124430', 'App\\Database\\Migrations\\CreateDeskripsiKategoriTable', 'default', 'App', 1761620800, 1),
(7, '2025-10-27-124723', 'App\\Database\\Migrations\\CreateHistoriPengaduanTable', 'default', 'App', 1761620800, 1),
(8, '2025-10-27-124833', 'App\\Database\\Migrations\\CreateFeedbackTable', 'default', 'App', 1761620800, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id_pengaduan` int UNSIGNED NOT NULL,
  `id_masyarakat` varchar(17) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_instansi` int DEFAULT NULL,
  `id_kategori` int DEFAULT NULL,
  `judul` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `isi` text COLLATE utf8mb4_general_ci,
  `foto` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` enum('Diajukan','Terverifikasi','Dialokasi','Dalam Proses','Selesai','Ditolak') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `bukti` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tipe_aduan` enum('Umum','Anonim','Rahasia') COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengaduan`
--

INSERT INTO `pengaduan` (`id_pengaduan`, `id_masyarakat`, `id_instansi`, `id_kategori`, `judul`, `isi`, `foto`, `status`, `created_at`, `updated_at`, `bukti`, `tipe_aduan`) VALUES
(1, '3201010101010004', 2, 5, 'Repellendus voluptatem veritatis.', 'Tempore maxime inventore a dignissimos. Et totam soluta fugiat autem voluptatum amet. Quia minus labore sequi omnis quia eos. Molestiae praesentium eos reprehenderit blanditiis dignissimos.', 'blank.jpg', 'Selesai', '2025-10-28 03:29:00', '2025-10-28 04:22:54', '1761625370_21d409d6dc952f88a11e.pdf', 'Umum'),
(2, '3201010101010015', 6, 5, 'Rem in aliquam quaerat rem vitae.', 'Sit deserunt voluptatibus et enim numquam molestias. Dolores asperiores sed officiis illum eius molestias quia sit.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Anonim'),
(3, '3201010101010009', 5, 2, 'Et nisi aut ad dolores.', 'Est occaecati est corporis illum numquam. Voluptas dicta cumque est quam consequatur. Ex molestiae eius qui dignissimos molestiae dolore. Sed sed molestias dolores nobis odio et quod optio.', 'blank.jpg', 'Selesai', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Rahasia'),
(4, '3201010101010010', 5, 1, 'Itaque ipsa ad alias.', 'Culpa nam iste saepe. At necessitatibus delectus vitae sit aperiam. Maiores qui corrupti nostrum occaecati adipisci quasi ut odit. Quas reiciendis reprehenderit culpa et aspernatur maxime.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Rahasia'),
(5, '3201010101010002', 5, 2, 'Adipisci magnam culpa ex vitae.', 'Similique sint ut alias provident dignissimos omnis. Voluptates delectus asperiores sed rem veritatis quia. Quas omnis rerum et accusantium pariatur tempora.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Umum'),
(6, '3201010101010014', 5, 6, 'Accusantium nostrum necessitatibus aperiam est temporibus.', 'Non dignissimos ipsa velit officia. Aut est voluptatem accusamus voluptate.', 'blank.jpg', 'Terverifikasi', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Umum'),
(7, '3201010101010003', 2, 6, 'Consequatur consequatur velit dolor.', 'Ut eum tempore incidunt sapiente qui et. Beatae quo veniam est perspiciatis. Cumque et deserunt rerum corrupti inventore enim tempore.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Rahasia'),
(8, '3201010101010015', 3, 3, 'Voluptatem sapiente id praesentium reiciendis et.', 'Exercitationem quibusdam itaque qui veniam sit temporibus. Consequatur eaque autem sequi sit eum accusantium. Cumque iusto similique numquam amet quo.', 'blank.jpg', 'Selesai', '2025-10-28 03:29:00', '2025-10-28 04:24:45', '1761625481_53e9385cd7373f975e0a.pdf', 'Anonim'),
(9, '3201010101010008', 5, 3, 'Vitae vero totam voluptatibus totam delectus.', 'Numquam quis voluptatum rem neque aspernatur. Cupiditate in vel laboriosam nihil optio sed. Ut dolorum temporibus sint.', 'blank.jpg', 'Selesai', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Umum'),
(10, '3201010101010009', 2, 5, 'Sequi ea ipsum.', 'At ut quos recusandae error ipsa consequatur. Atque veritatis saepe ea voluptatem vel totam. Perferendis qui aut consequuntur ipsum. Quibusdam et voluptas non explicabo eos.', 'blank.jpg', 'Terverifikasi', '2025-10-28 03:29:00', '2025-10-28 04:23:48', NULL, 'Anonim'),
(11, '3201010101010006', 4, 3, 'Officiis enim architecto.', 'Tenetur quod est aut illum vitae consectetur qui. Sunt vitae laboriosam qui tempore incidunt aut. Error ut rerum fugiat eos. Natus cupiditate odio dignissimos vel et minus architecto sit.', 'blank.jpg', 'Ditolak', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Anonim'),
(12, '3201010101010007', 6, 1, 'Rem dolorem in.', 'Aut consequatur sint est aut eveniet. Praesentium possimus est qui ut autem ut. Voluptas sequi quidem nulla quia repudiandae.', 'blank.jpg', 'Ditolak', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Rahasia'),
(13, '3201010101010015', 6, 1, 'Aliquid ex aperiam nobis.', 'Ullam itaque ipsam qui reiciendis tempora aut illo. Qui praesentium soluta repudiandae quia nesciunt doloremque dicta pariatur. Tempora quia qui unde minima omnis.', 'blank.jpg', 'Terverifikasi', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Rahasia'),
(14, '3201010101010008', 6, 4, 'Qui neque dolorem voluptas.', 'Quae voluptate magnam debitis autem asperiores sed. Eos ex sint nemo saepe sint reiciendis qui dolor. Inventore accusantium accusantium quisquam. Voluptas veniam reiciendis ut eius vero dolores voluptatem.', 'blank.jpg', 'Selesai', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Anonim'),
(15, '3201010101010013', 4, 3, 'Aut cumque nihil molestiae animi.', 'Quis minima qui a suscipit. Animi quis itaque provident ex. Quo molestiae voluptate corrupti officia cum. Similique repudiandae harum excepturi dolorem quis.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Umum'),
(16, '3201010101010009', 5, 4, 'Nisi et voluptatem voluptatibus.', 'Eius id sed inventore fugiat non non sed. Aliquam perspiciatis nisi facilis nihil. Veritatis perferendis nesciunt corporis incidunt molestiae natus iure. A non voluptatem ut minima nisi dolorum.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Rahasia'),
(17, '3201010101010002', 2, 4, 'Neque distinctio aut velit laborum.', 'Sed eum sed quas illo. Quam a quibusdam minima officia velit unde quia. Qui neque laborum accusantium. Quis omnis impedit ut qui. Dicta eum nam ut molestiae eos perspiciatis.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Umum'),
(18, '3201010101010015', 5, 3, 'Iusto quia quisquam excepturi.', 'Explicabo quia aut voluptas sint. Rerum aut perspiciatis quas voluptas minus est occaecati tenetur. Consequatur quod animi consequatur eveniet sint. Placeat id illum occaecati omnis nemo consequatur dicta aut.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Rahasia'),
(19, '3201010101010001', 6, 3, 'Dignissimos sed doloremque harum ex.', 'Odit occaecati eos cumque enim qui fugiat. Sed consequatur sed nemo consequatur repellendus tenetur aliquam qui. Explicabo at et provident quis odio et accusamus.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Umum'),
(20, '3201010101010015', 6, 3, 'Non rem minima est aspernatur.', 'Veritatis dolorem nihil quibusdam molestiae ipsum. Sed et quia illum voluptates non. Qui assumenda ipsam voluptatem a et.', 'blank.jpg', 'Ditolak', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Anonim'),
(21, '3201010101010002', 1, 4, 'Maxime reiciendis autem rerum.', 'Rerum mollitia in ullam unde vel quisquam. Dolorum nam sunt sint id. Debitis quibusdam sed laudantium amet vel.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Umum'),
(22, '3201010101010009', 1, 1, 'Beatae voluptatum totam dicta.', 'Eligendi officiis optio velit asperiores reiciendis. Assumenda veniam voluptatem omnis. Et amet cupiditate cumque autem. Nemo perferendis itaque impedit nesciunt quia.', 'blank.jpg', 'Ditolak', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Rahasia'),
(23, '3201010101010002', 6, 6, 'Et et voluptas eveniet neque voluptas.', 'Quia qui voluptatem distinctio. Recusandae nesciunt error inventore sed nostrum quo qui. Omnis et minus minima recusandae quibusdam et. Quo voluptatem voluptates est in mollitia.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Anonim'),
(24, '3201010101010007', 3, 2, 'Sunt quia cupiditate eaque sint voluptatem.', 'Perferendis ipsam velit eveniet et asperiores voluptatem illo rerum. Veritatis quisquam architecto ut cupiditate.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Rahasia'),
(25, '3201010101010010', 3, 3, 'Nihil vel ex.', 'Magni ut labore soluta dolorem sequi. Ut impedit ea et accusantium et. Itaque quaerat dolorem qui.', 'blank.jpg', 'Selesai', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Anonim'),
(26, '3201010101010001', 3, 1, 'Animi et possimus perspiciatis.', 'Et qui sit praesentium sint. Placeat officia non vero quia velit earum.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Rahasia'),
(27, '3201010101010008', 5, 1, 'Qui voluptas veniam explicabo nemo sed.', 'Ut quis velit architecto similique et porro. Quisquam doloremque aut laborum maiores ipsum. Optio sequi beatae quasi aut tempore molestias.', 'blank.jpg', 'Selesai', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Rahasia'),
(28, '3201010101010008', 5, 1, 'Rem esse praesentium est odit.', 'Id cumque aut consequatur ut aliquid. Ipsum consequuntur non labore maxime est odio. Ipsam tempora iusto aspernatur odio odio quis vel. Qui quo doloribus in dolor. Sit omnis dolor laboriosam sint nostrum sint voluptas.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Umum'),
(29, '3201010101010007', 4, 1, 'Accusantium aut omnis earum.', 'Perferendis pariatur magni voluptatem praesentium. Animi odit quam dolore dignissimos. Minus temporibus consequatur maxime deleniti.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Anonim'),
(30, '3201010101010015', 3, 6, 'Cupiditate officiis et.', 'Nesciunt et quaerat quas. Excepturi itaque qui qui praesentium nam voluptatem et. Quis natus ducimus rerum veniam. Quia magnam tempora temporibus doloribus numquam nulla. Quo non nostrum cumque laudantium.', 'blank.jpg', 'Ditolak', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Anonim'),
(31, '3201010101010003', 4, 1, 'Est veniam qui minima accusamus.', 'Ratione corporis neque sapiente deleniti rerum. Eos et voluptatem est. Quis nulla laborum in excepturi quae.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Rahasia'),
(32, '3201010101010008', 4, 4, 'Facere laborum cumque quo est fuga.', 'Praesentium quis et eveniet. Accusamus eum quas omnis dicta similique veritatis fuga. Vitae eum incidunt ducimus recusandae repellat non et.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Rahasia'),
(33, '3201010101010001', 1, 1, 'Voluptas et qui minima nesciunt delectus.', 'Ipsa dolore omnis dolor. Suscipit non iste ducimus libero hic consequatur ex.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Rahasia'),
(34, '3201010101010002', 3, 5, 'Consequuntur et earum accusantium dicta.', 'Dignissimos qui ducimus aut natus vel. Iste vel unde ducimus qui. Ducimus vero aut quasi iusto. Vel autem dolorem quo voluptatem sapiente exercitationem.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Umum'),
(35, '3201010101010015', 2, 2, 'Sit quidem voluptatem et laudantium aut.', 'Facilis libero dolore quos ipsum earum. Aut dolor et et et eligendi dolor. Incidunt ipsa aut eos doloremque aut.', 'blank.jpg', 'Terverifikasi', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Rahasia'),
(36, '3201010101010014', 3, 6, 'Quam commodi eveniet vel autem quaerat.', 'Totam excepturi culpa fugiat molestiae. Officia quo et et. Placeat velit sit ea sequi.', 'blank.jpg', 'Selesai', '2025-10-28 03:29:00', '2025-10-28 03:29:00', NULL, 'Anonim'),
(37, '3201010101010013', 1, 1, 'Temporibus minus ut quia nihil.', 'Facere in qui nobis similique. Delectus molestiae voluptatem autem cupiditate fugiat similique. Sunt adipisci qui beatae voluptatem et. Cupiditate nulla soluta magni et.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(38, '3201010101010013', 6, 3, 'Reprehenderit molestiae tenetur quae.', 'Provident et qui necessitatibus eveniet. A est saepe reprehenderit possimus est expedita voluptatem non. Officiis est eos mollitia unde quisquam est. Labore laborum in aliquid sequi sed est.', 'blank.jpg', 'Selesai', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(39, '3201010101010006', 3, 3, 'Debitis nesciunt illum eveniet.', 'Vel quisquam harum maiores omnis consequatur expedita est vitae. Exercitationem aut ad omnis quas. Nemo qui qui accusantium reiciendis repellendus architecto nemo. Est illo nam et.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(40, '3201010101010003', 4, 5, 'Dignissimos enim voluptas ex eos explicabo.', 'Debitis qui at itaque excepturi necessitatibus omnis. Alias libero molestiae maxime dicta architecto est perferendis. Laboriosam consectetur assumenda occaecati mollitia maxime laborum explicabo. Sit et ea esse et.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(41, '3201010101010001', 5, 5, 'Aut et sit ratione ab rerum.', 'Distinctio tempora nostrum odit et. Aut iusto sapiente iure cumque et impedit pariatur dolorem.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(42, '3201010101010009', 1, 3, 'Alias deleniti praesentium.', 'Sed rerum corrupti et magnam qui consequatur quaerat nobis. Deserunt quos sit ipsam consequatur sapiente facilis odit. Vero in quia magni rerum quis nihil.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(43, '3201010101010009', 1, 4, 'Libero quis perferendis est.', 'Aut aut eius reiciendis modi provident modi dolorum. Quae ipsam harum et aut ut autem. Corrupti occaecati officiis architecto voluptatum consectetur voluptas.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(44, '3201010101010008', 1, 4, 'Commodi nam ea qui sit.', 'Eveniet voluptatum minus molestiae quo. Velit iure dolores et excepturi ducimus officiis perspiciatis. Eaque impedit voluptas ut provident consequuntur quam architecto.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(45, '3201010101010007', 4, 2, 'Rerum earum similique et est.', 'Laudantium architecto ullam quae dolor veniam nihil. Ut beatae tempore libero expedita.', 'blank.jpg', 'Ditolak', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(46, '3201010101010002', 5, 6, 'Nostrum veritatis rem.', 'Maxime dolorem atque eum ratione consequatur. Nemo est ipsa dolorem. Inventore ut dolor cumque quae voluptate est est. Consequatur cumque debitis omnis cumque nobis consequuntur. Est in pariatur iusto et autem omnis.', 'blank.jpg', 'Terverifikasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(47, '3201010101010009', 2, 3, 'Ea ea et at mollitia.', 'Dolores rem omnis inventore aut nihil. Ut qui est qui ea ad. Voluptate deserunt est sit ipsa. Qui fuga dolor sit fugiat rerum dolorem adipisci.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(48, '3201010101010006', 5, 3, 'Et qui consequatur voluptas soluta.', 'Iste iste exercitationem pariatur accusamus architecto. Facere iure vel est atque quis aliquam voluptatem. Non aperiam veritatis est ex aut delectus. Dolorem necessitatibus laudantium officiis magni sint dolores.', 'blank.jpg', 'Terverifikasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(49, '3201010101010013', 4, 4, 'Eligendi unde ut voluptate sint dolorum.', 'Ea sint quidem dolorem in repellat enim modi. Laboriosam voluptas magni aperiam est. Et nostrum autem quia et voluptatem quo suscipit. Quaerat et nobis quis id.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(50, '3201010101010014', 5, 3, 'Laboriosam cupiditate sit.', 'Suscipit assumenda quibusdam aliquid asperiores ab. Impedit eius est vero tempore rerum eaque. Eum voluptatem maiores voluptates quasi corporis. Architecto magni illo eaque beatae eos culpa.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(51, '3201010101010014', 2, 6, 'Hic ad nihil molestiae.', 'Quisquam quis voluptatum totam harum quia rem molestias. Non voluptatum rem inventore qui ut reprehenderit. Veniam et laudantium distinctio saepe. Placeat deserunt hic eos qui et natus.', 'blank.jpg', 'Ditolak', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(52, '3201010101010011', 1, 4, 'Sapiente ipsa aliquid asperiores.', 'Ducimus hic perferendis tempora in et. Omnis sed corporis est enim unde. Et velit eum non. Atque nihil qui error totam fugit.', 'blank.jpg', 'Terverifikasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(53, '3201010101010013', 2, 1, 'Sapiente animi aut.', 'Qui debitis sint saepe. Voluptatibus eius quia consequatur placeat itaque. Consequatur alias dolor officiis. Rem minima ab enim veniam quia temporibus quam.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(54, '3201010101010005', 2, 4, 'Voluptatem necessitatibus consequatur totam.', 'Quis eaque delectus quia. Numquam id mollitia tenetur voluptatem consectetur et aliquam.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(55, '3201010101010002', 2, 4, 'Qui repellendus delectus sit corporis quia.', 'Praesentium explicabo amet nobis molestiae repellendus. Atque quia esse eos quo. Occaecati assumenda molestiae illum commodi.', 'blank.jpg', 'Terverifikasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(56, '3201010101010002', 6, 3, 'Cum aut doloribus autem.', 'Et porro a quas velit. Cupiditate laboriosam eveniet ullam ut. Voluptatibus recusandae est voluptate et voluptatibus et quasi.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(57, '3201010101010014', 1, 1, 'Fuga voluptatem temporibus aliquid harum.', 'Cum optio ea in quia culpa. Qui quia cumque nostrum eum iure illo illum et.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(58, '3201010101010013', 6, 2, 'Autem nemo suscipit iure et.', 'Et aspernatur dolor amet veniam optio nesciunt. Praesentium incidunt suscipit vel iusto consequatur. Eum et nisi nihil est.', 'blank.jpg', 'Terverifikasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(59, '3201010101010012', 2, 1, 'Illum neque velit expedita explicabo.', 'Soluta accusantium ut laborum consequatur qui autem tempore. Rem soluta excepturi sed amet quo et recusandae eveniet.', 'blank.jpg', 'Selesai', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(60, '3201010101010006', 5, 4, 'Voluptas ipsam omnis dolor velit.', 'Doloribus sed et et nemo officiis repellendus et. Nihil consequatur nihil aut necessitatibus. Dicta debitis perferendis maiores et maiores. Qui modi natus ipsa quae vitae quos excepturi. Qui et inventore omnis fugit.', 'blank.jpg', 'Terverifikasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(61, '3201010101010005', 1, 6, 'Eveniet consequatur nulla distinctio est et.', 'Perferendis odio quam et ex accusantium eaque dicta vitae. Quidem quis qui incidunt velit voluptas suscipit. Ea minima dicta quas sed recusandae voluptatem.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(62, '3201010101010002', 2, 5, 'Et facilis est repellat.', 'Ut numquam saepe quibusdam earum. Voluptatem magni eum fugiat omnis. Sit et distinctio est dolorem unde inventore. Laboriosam nulla ullam praesentium qui expedita.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(63, '3201010101010006', 3, 3, 'Ipsam minus velit quos autem.', 'Aperiam quos consequuntur est quia impedit. Dicta est distinctio molestiae sint incidunt officia voluptatem reiciendis. Voluptatem vel vitae enim aut error enim.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(64, '3201010101010011', 1, 5, 'Mollitia quod maiores ipsa.', 'Sint natus et fuga nisi possimus. Enim assumenda praesentium dolor quam iste pariatur. Reprehenderit maiores rerum unde et.', 'blank.jpg', 'Selesai', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(65, '3201010101010007', 1, 5, 'Consequatur et omnis.', 'Eius doloribus consequatur autem perspiciatis odit ut. Eveniet culpa alias autem dolores et. Facere accusantium corporis omnis aut. Ut ducimus veritatis quis praesentium eaque molestiae animi.', 'blank.jpg', 'Ditolak', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(66, '3201010101010008', 1, 5, 'Laborum laudantium necessitatibus vitae.', 'Et culpa ex dicta vel. Libero suscipit rerum voluptatum. Recusandae rerum sint est omnis ipsam.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(67, '3201010101010005', 6, 2, 'Ratione sint quidem.', 'Dicta ad provident non earum est. Repellendus sunt id rerum soluta doloribus omnis. Voluptatem et molestias consectetur in aut dolorem aut.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(68, '3201010101010014', 3, 3, 'Odio officia non.', 'Dolor fuga saepe itaque ea et optio dolor mollitia. Neque porro velit itaque ut reprehenderit est doloribus. Maxime nobis dicta ut similique quia iusto dolorem qui. Amet aut est omnis aut aut.', 'blank.jpg', 'Selesai', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(69, '3201010101010012', 5, 4, 'Veniam voluptatem aliquid quia expedita.', 'Optio est illum et deserunt. Accusantium corrupti corporis voluptas. Qui laudantium iste facere facilis. Et rerum doloribus nam animi sit. Ab minus ut id porro veniam incidunt eius.', 'blank.jpg', 'Ditolak', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(70, '3201010101010011', 2, 2, 'Rerum ducimus voluptatem magni tenetur.', 'Commodi consequatur assumenda enim tenetur nulla quidem quia facere. Et dolorem fuga sit eius quo qui.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(71, '3201010101010015', 4, 1, 'Fugit vel soluta.', 'Iste labore aut sit dolor ab cupiditate. Numquam laborum consequuntur dolor amet sequi repudiandae numquam. Nam saepe sit minus autem ipsa ut rerum. Delectus et doloribus aut amet labore est.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(72, '3201010101010001', 2, 3, 'Architecto voluptatum corrupti voluptas.', 'Laboriosam enim ea quia impedit quis consequatur dolore. Officia deleniti repellendus quaerat tempora quia consequatur dolorum. Nisi quasi vero quia ut. Eum illo quae et perferendis ipsa laudantium enim impedit.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(73, '3201010101010005', 5, 2, 'Itaque facere eos maxime.', 'Neque esse et nam. Possimus minus repellat nam aut. Natus quo corrupti facilis error. Maxime vel rerum quod sunt.', 'blank.jpg', 'Ditolak', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(74, '3201010101010001', 2, 1, 'Nihil possimus perferendis ut.', 'Earum et quos et assumenda non sunt ratione. Velit et sapiente doloribus enim doloremque dolor perferendis. Officia nihil dicta aut nostrum quis molestias est est.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(75, '3201010101010002', 4, 4, 'Maxime sed et.', 'Quibusdam aliquam tenetur nihil rem ab sequi. Et quas nobis itaque dolore. Voluptatem pariatur corrupti aliquid quae fugiat aliquid. Et placeat laboriosam cupiditate.', 'blank.jpg', 'Selesai', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(76, '3201010101010013', 3, 4, 'Quisquam maiores illum provident repudiandae sed.', 'Alias nam ipsum molestiae voluptatem. Animi voluptas quam temporibus perferendis est repellendus. Totam ut iure veniam voluptatem quasi maiores.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(77, '3201010101010008', 4, 1, 'Tempore hic et minus et.', 'Id quis alias hic ut beatae. Repellendus inventore corrupti blanditiis non tenetur voluptatum asperiores quis. Numquam suscipit eum omnis soluta ut possimus. Dolores ea voluptatum veritatis accusantium. Molestias voluptatibus voluptate itaque laboriosam quo ducimus.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(78, '3201010101010002', 4, 5, 'Repellat asperiores itaque dolorum.', 'Dolorum rerum qui excepturi saepe neque. Expedita quis ullam minima voluptas asperiores. Animi eos odio qui ut deserunt corrupti suscipit.', 'blank.jpg', 'Terverifikasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(79, '3201010101010007', 3, 4, 'Ut ullam voluptatem rerum aut consequuntur.', 'Sit ea culpa qui dolores. Nostrum minus officiis unde magnam voluptatum vel sit.', 'blank.jpg', 'Ditolak', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(80, '3201010101010001', 3, 5, 'Odio maxime quam vitae.', 'Quas vitae officiis quibusdam aut. Aperiam inventore natus rerum aspernatur consequuntur et. Beatae voluptatum id maiores quod quia deleniti.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(81, '3201010101010008', 6, 2, 'Saepe et voluptatibus et.', 'Officia placeat aut dolores ab recusandae dolores cum. Suscipit veritatis sed reprehenderit molestiae qui qui itaque. Neque repudiandae consequatur nam inventore quis vel. Iure itaque minus et occaecati magni. Quis repellat in omnis et qui ut dolores vel.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(82, '3201010101010001', 6, 4, 'Cum voluptatem ducimus ut accusamus eum.', 'Voluptates quos est esse consequatur et recusandae deleniti. Quaerat repellendus vel dolores aspernatur numquam. Hic repellat animi eos et qui. Similique enim magnam nam.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(83, '3201010101010014', 1, 1, 'Eum amet voluptas assumenda ut.', 'Tempora ipsa vel accusantium totam vel fuga. Dolore ut dignissimos ex officiis. Sint suscipit nihil est tempora veniam eligendi veritatis.', 'blank.jpg', 'Terverifikasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(84, '3201010101010002', 3, 6, 'Delectus molestiae ut.', 'Quas aliquid quia voluptatem fugit adipisci aut. Quibusdam quo nihil occaecati consequatur cum veritatis enim. Non exercitationem quae et voluptas quisquam omnis iusto. Minima fugit et vel.', 'blank.jpg', 'Ditolak', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(85, '3201010101010014', 2, 3, 'Pariatur fugiat explicabo enim.', 'Neque quae molestiae ab accusamus fuga et atque. Sed sit consequatur ullam est veniam natus facilis. Cum velit rerum sint et accusantium voluptas.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(86, '3201010101010005', 3, 1, 'Omnis sit nam.', 'Voluptas qui nostrum est qui quibusdam sint. Est minus possimus voluptatem alias soluta necessitatibus aut ducimus. Et tenetur optio sapiente fugiat placeat quibusdam maiores.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(87, '3201010101010010', 1, 5, 'Cupiditate provident ipsa.', 'Nihil architecto qui eum aut. Non tempore repellendus et. Amet necessitatibus velit hic eligendi.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(88, '3201010101010006', 6, 2, 'Ut non non fuga.', 'Aliquam rerum qui illum et incidunt sapiente. Laboriosam sed deleniti suscipit est. Assumenda cum repellat ea cum excepturi deleniti dolores.', 'blank.jpg', 'Selesai', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(89, '3201010101010001', 5, 5, 'Voluptas pariatur odit harum.', 'Praesentium accusantium neque culpa perferendis consectetur. Asperiores aut amet omnis alias quaerat quo autem. Similique omnis nihil inventore.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(90, '3201010101010013', 1, 5, 'Natus ex quisquam et maxime.', 'Ex doloribus rem architecto minima. Saepe aut omnis aut earum voluptatem iure ea. Optio quis eum eveniet libero. Tenetur animi totam dolores qui quos aperiam.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(91, '3201010101010012', 5, 6, 'Quia est nam.', 'Beatae at assumenda aut harum. Iure deleniti explicabo ab autem laborum quae. Labore rerum repellat nihil ea consectetur sint temporibus quaerat.', 'blank.jpg', 'Terverifikasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(92, '3201010101010007', 2, 5, 'Officiis accusamus maxime quaerat ullam.', 'Et dolorem enim repellat quos. Harum magnam aut ullam blanditiis optio qui. Perspiciatis qui repellendus omnis unde quidem. Iusto ab eum maiores a qui eum. Temporibus quia fuga consectetur provident sit pariatur dolores.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(93, '3201010101010013', 4, 5, 'Qui recusandae autem autem voluptatem fugiat.', 'Dolore sit nemo est occaecati doloribus. Hic temporibus possimus eius debitis error voluptas. Dignissimos sapiente nulla eaque voluptate autem autem incidunt.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(94, '3201010101010005', 4, 4, 'Minus sunt minima.', 'Et repudiandae cupiditate aut voluptates eum commodi voluptatem. Quasi facilis sapiente facere delectus molestiae id. Id rerum ut quia ex nostrum.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(95, '3201010101010002', 4, 4, 'Fugit velit deserunt amet enim eum.', 'Quasi unde est nesciunt voluptas et corporis consequatur. Quidem voluptate adipisci aliquam unde qui corrupti. Voluptatum laborum tempore iste accusamus. Aut molestiae labore atque dolore.', 'blank.jpg', 'Ditolak', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(96, '3201010101010007', 3, 3, 'Est ipsa est aut.', 'Qui quasi magnam velit sequi sit. Sed assumenda occaecati voluptatem at. Blanditiis itaque beatae ipsum laboriosam et et quam. Aut quis molestias ut ipsum.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(97, '3201010101010011', 5, 2, 'Corporis provident eos ut maxime.', 'Voluptate molestiae laboriosam et consequatur. Exercitationem et cumque saepe dolores rerum aliquam voluptatum. Eum nobis vero explicabo maiores voluptatibus dolorem eum. Illo voluptates eligendi quibusdam eius et aut.', 'blank.jpg', 'Selesai', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(98, '3201010101010010', 1, 1, 'Ut sit enim accusamus.', 'Velit deleniti consequatur eos ut. Vel debitis facilis et atque corrupti dolorum. Tenetur neque ullam quia consectetur sit.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(99, '3201010101010010', 6, 4, 'Ut incidunt aut exercitationem voluptatem.', 'Et eaque molestiae distinctio voluptas molestiae. Et et necessitatibus cupiditate nam quos omnis.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(100, '3201010101010002', 3, 1, 'Ratione et cupiditate quis molestiae deleniti.', 'Eum nam ea ullam ea. Incidunt qui harum corrupti nulla aut dignissimos. Eos temporibus optio fugit quae.', 'blank.jpg', 'Terverifikasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(101, '3201010101010007', 6, 6, 'Hic iste qui est ducimus.', 'Dolores aut sed voluptatum quasi dolores perferendis tempora. Aliquid eum est rem nam occaecati fuga animi. Illum exercitationem quo dolor at odio eum.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(102, '3201010101010008', 2, 5, 'Et quod molestiae aut.', 'Aspernatur fugiat in in sed commodi et sed fugit. Aut nihil eum enim neque consequuntur eum voluptate.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(103, '3201010101010001', 2, 5, 'Eum quia amet dolor.', 'Architecto repellendus reprehenderit beatae. Eaque quasi non vel soluta sunt nobis qui. Repellat voluptatem perferendis voluptatem dicta doloremque ex consequatur.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(104, '3201010101010004', 2, 6, 'Vero quia ipsam qui aperiam.', 'Magnam nobis maxime temporibus ratione amet neque. Magni quam et mollitia magni voluptate.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(105, '3201010101010014', 6, 3, 'Perspiciatis qui sed beatae.', 'Vitae consequatur voluptatem aut aut veritatis inventore aut. Debitis et nostrum eum provident et voluptas. Ea iure nesciunt quia et. Sit molestias similique recusandae ratione eos aspernatur quo.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(106, '3201010101010005', 5, 2, 'Explicabo consequuntur eum sit voluptatibus.', 'Commodi laborum alias aut rerum. Molestias quia soluta quibusdam. Sint quo soluta debitis voluptas esse pariatur.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(107, '3201010101010009', 4, 5, 'Laborum voluptate aliquam eum pariatur.', 'Ipsa ex natus sapiente suscipit. Earum illo voluptate placeat fuga consectetur nobis. Magnam occaecati qui aut vel dolor. Corporis natus ut eveniet et eveniet aspernatur.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(108, '3201010101010001', 1, 5, 'Nisi praesentium deleniti sed molestias.', 'Ut vitae asperiores veritatis et dicta qui corrupti ut. Veniam eos eius dignissimos veritatis. Quis quis distinctio nihil aut id id accusantium.', 'blank.jpg', 'Ditolak', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(109, '3201010101010008', 5, 2, 'Ullam impedit voluptates quos sint.', 'Pariatur nihil illum cumque ut rem amet. Voluptatibus facilis atque facere maiores fugit aut nulla. Dicta ea earum illo earum ratione.', 'blank.jpg', 'Selesai', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(110, '3201010101010009', 4, 3, 'Est beatae consequatur distinctio nulla qui.', 'Corporis quae ut voluptas rerum cumque eaque pariatur fuga. Necessitatibus optio nihil qui ipsam nemo sunt non. Totam tenetur quidem suscipit aut perferendis quia.', 'blank.jpg', 'Ditolak', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(111, '3201010101010003', 5, 6, 'Quod recusandae molestias eos.', 'Necessitatibus voluptatem est quos consectetur iusto laudantium aut. Quidem occaecati aut aut eveniet.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(112, '3201010101010014', 5, 5, 'Aperiam voluptas est.', 'Et facilis architecto modi eius nisi architecto voluptatibus. Voluptas sapiente voluptates cupiditate sit dolore ullam. Sed dolor ad cupiditate ullam in cum.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(113, '3201010101010010', 6, 1, 'Facilis quasi qui.', 'Corrupti quas modi ex. Dolorem ut ut voluptatum nulla veritatis molestiae nisi eaque. Nihil deserunt deserunt enim minus.', 'blank.jpg', 'Selesai', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(114, '3201010101010005', 2, 3, 'Id et laborum necessitatibus molestiae.', 'Asperiores adipisci dolores odio quia quo et enim maxime. Non amet accusantium enim non officia ullam nam. Voluptatum qui alias enim nostrum.', 'blank.jpg', 'Terverifikasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(115, '3201010101010015', 4, 3, 'Necessitatibus eligendi sunt sed.', 'Quia repudiandae illo possimus tempore. Culpa quidem eum ipsa aut aut. Blanditiis quasi ratione illum nihil. Accusamus id nihil dolores et vero nobis nihil.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(116, '3201010101010007', 5, 4, 'Sit enim ipsam vero.', 'Quasi voluptatum in incidunt est consequatur. Vel delectus minima rerum architecto. Vel ut eius sunt accusantium quia. Porro sunt autem et aut eos.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(117, '3201010101010002', 2, 4, 'Voluptatem illum omnis et ea voluptate.', 'Et quaerat dignissimos autem recusandae vero minima ea libero. Esse quam iusto numquam sit quos ex veniam. Consequatur aut omnis non voluptatem.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(118, '3201010101010004', 6, 5, 'Et eaque recusandae ducimus et et.', 'Quidem animi eum ea quia soluta accusantium nemo vero. Explicabo cumque a quaerat rerum. Perferendis et cupiditate porro et porro. Officiis dolore molestias eligendi et aliquid.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(119, '3201010101010002', 6, 4, 'Distinctio inventore sint est.', 'Odio nemo molestiae culpa quo nisi eum. Est perferendis quis saepe maxime repellat et. Tenetur in dicta reiciendis ut in sit.', 'blank.jpg', 'Ditolak', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(120, '3201010101010013', 1, 3, 'Deserunt et placeat similique doloremque.', 'Quae iste unde qui earum. Hic ullam omnis unde. Unde sapiente porro culpa molestiae. Qui voluptas ex in accusantium.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(121, '3201010101010001', 5, 5, 'Et nobis omnis molestiae ut mollitia.', 'Assumenda voluptas est cumque dignissimos mollitia. Cum exercitationem doloribus quo aspernatur.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(122, '3201010101010008', 3, 3, 'Perferendis et et omnis modi voluptate.', 'Animi error sapiente qui dignissimos adipisci id. Molestiae porro sint id debitis.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(123, '3201010101010007', 5, 4, 'Expedita qui nesciunt aut.', 'Eaque velit nihil facere inventore. Asperiores eius fugiat recusandae. Dolore placeat sit aut laborum accusantium tempore. Aliquid praesentium vel reprehenderit architecto excepturi qui.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(124, '3201010101010014', 1, 3, 'Rem et quos.', 'Cupiditate incidunt ipsam modi rerum rerum. Et quo consectetur voluptatem tempore at repellendus. Alias sequi quasi est. Molestiae et quis eaque vel perferendis.', 'blank.jpg', 'Terverifikasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(125, '3201010101010009', 4, 2, 'Voluptatem consequatur culpa.', 'Expedita neque libero in enim rerum architecto nemo reprehenderit. Sunt nihil odit accusamus dolorem cupiditate. Ipsa qui in autem ratione esse. Autem architecto veniam et officiis repellendus et unde.', 'blank.jpg', 'Selesai', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(126, '3201010101010001', 4, 6, 'Enim aliquam eum modi.', 'Atque distinctio voluptate delectus dolores ut sapiente. Et inventore ipsa aut ut quos nulla.', 'blank.jpg', 'Terverifikasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(127, '3201010101010004', 3, 3, 'Beatae fuga ea nostrum voluptas.', 'Aperiam voluptatem accusamus qui omnis. Harum molestiae et debitis consectetur numquam cupiditate cum. Eaque nesciunt dolor dolorem vel enim ad.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(128, '3201010101010012', 6, 2, 'Omnis non corporis laboriosam facere.', 'Suscipit at asperiores qui excepturi adipisci maiores eligendi. Sit aut quidem numquam quaerat commodi exercitationem. Corrupti impedit natus voluptates et ratione. Doloribus sequi voluptatibus ea eum sed optio.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(129, '3201010101010010', 4, 1, 'Minima itaque unde.', 'Sequi ut unde odit recusandae. Voluptatem quos rerum aspernatur quod reprehenderit est. Esse et ratione vitae similique officia facere quo.', 'blank.jpg', 'Selesai', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(130, '3201010101010015', 5, 2, 'Voluptate aperiam id possimus consequuntur et.', 'Porro consequatur reiciendis quia. Placeat quasi et sit aliquid vel tempora rerum error. Repellendus possimus voluptatem molestiae quis incidunt debitis necessitatibus.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(131, '3201010101010004', 4, 3, 'Assumenda enim consequuntur eos.', 'Velit atque quia nobis unde. Iste officiis ut omnis dicta voluptas et. Vero voluptatem est minus cumque et. Et eaque quaerat vel est eos eaque. At nesciunt iure a voluptas.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(132, '3201010101010002', 3, 2, 'Aut libero error.', 'Laboriosam voluptatibus reprehenderit expedita molestias. Cumque sint modi quibusdam natus eius. Doloremque cupiditate non sed quia magnam dolores.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(133, '3201010101010009', 1, 5, 'Error et itaque nesciunt in.', 'Tempora quae reiciendis excepturi id quos. Odio unde qui enim rerum rerum eos voluptas hic. Culpa voluptatum error velit repudiandae voluptates. Quidem repudiandae in dolore.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(134, '3201010101010012', 1, 6, 'Temporibus eos est voluptate.', 'Dolor voluptas debitis ab consequatur eligendi. Sed eligendi est dolorem. Rerum aut sed animi ut neque.', 'blank.jpg', 'Terverifikasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(135, '3201010101010015', 1, 4, 'Sapiente totam natus quos.', 'Vel in illo vitae consequuntur. Ipsa sunt porro dolore. Quas quisquam tempore quia nihil quo nesciunt. Molestiae sint sed mollitia voluptas explicabo provident iusto.', 'blank.jpg', 'Terverifikasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(136, '3201010101010006', 1, 1, 'In quasi culpa ut.', 'Aliquid eum facilis vitae assumenda facilis. Quae sit itaque ipsam ullam repudiandae necessitatibus ipsam. Aut qui deserunt vel ut neque aut animi. Numquam ut ut quia.', 'blank.jpg', 'Selesai', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(137, '3201010101010014', 3, 6, 'Consequatur qui ut inventore.', 'Dolor hic est libero praesentium. Qui accusantium tempore recusandae suscipit. Et dolorum neque quia porro culpa quisquam expedita.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(138, '3201010101010014', 4, 1, 'Eveniet provident iusto aliquid.', 'Quidem ut aut ut perferendis error et. Dolorem ab pariatur non cum.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(139, '3201010101010009', 5, 6, 'Harum et accusantium accusamus et.', 'Necessitatibus delectus laborum iusto quos impedit delectus. Eaque maxime quia et aspernatur et ducimus. Impedit rerum reprehenderit saepe eaque autem rerum dolor.', 'blank.jpg', 'Ditolak', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(140, '3201010101010013', 5, 3, 'Temporibus laborum dolores aut vitae.', 'Temporibus voluptatem sequi cumque illo mollitia. Veritatis aut vel perspiciatis harum pariatur accusantium. Porro eius porro ab iste corporis soluta. Numquam ullam necessitatibus aspernatur temporibus beatae non.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(141, '3201010101010008', 1, 3, 'Excepturi adipisci quo eos molestias nostrum.', 'Soluta eligendi enim eligendi dolores ut et. Ea sed molestiae sed suscipit quia aut temporibus corrupti. Consectetur sit hic illum illum illum earum. Quia suscipit inventore tempora corrupti suscipit ducimus. Pariatur laborum facilis consequatur.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(142, '3201010101010002', 2, 6, 'Similique reiciendis et excepturi aliquam autem.', 'Laudantium nesciunt aspernatur nostrum facere qui et laudantium. Ipsum fugiat molestias impedit fuga. Quam unde eveniet est incidunt et at dicta quia. Omnis amet voluptatem voluptates tempore vitae eveniet. Omnis natus magnam voluptatem commodi consequatur quae.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(143, '3201010101010008', 2, 5, 'Natus aspernatur rem sapiente.', 'Odio fugit voluptatem sit non consequuntur ex. Aut tempore maiores corrupti maiores adipisci nobis. Quidem blanditiis ex provident.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(144, '3201010101010011', 6, 3, 'Aliquam nulla temporibus.', 'Soluta eius quibusdam qui sed voluptatem iste non. Quaerat magni doloribus modi ab commodi. Maxime quibusdam qui eos ipsam rerum. Rerum illo inventore illum dolorum optio.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(145, '3201010101010002', 5, 2, 'Non nostrum magnam perspiciatis est.', 'Porro accusamus sequi cumque et illum autem fugiat. Error velit placeat dolorem sint magnam placeat perspiciatis dolores. Aut inventore dolores suscipit non assumenda dolore. Nulla nesciunt ut iste.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(146, '3201010101010010', 1, 2, 'Qui cupiditate voluptate enim.', 'Quis ab accusamus aspernatur nesciunt veniam. Omnis expedita veritatis dolores officiis eligendi saepe nisi. A aut nihil officiis quaerat. Numquam soluta eos animi nihil ut et. Beatae et dolorum molestiae mollitia.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(147, '3201010101010013', 4, 5, 'Et at ipsum dignissimos.', 'Commodi rerum atque in. Dignissimos et sit suscipit doloribus est voluptas excepturi.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(148, '3201010101010014', 5, 2, 'Ipsam aut aut.', 'Aut ea at rerum iure at. Corrupti inventore et ex aut sit maxime. Sed porro aliquid nobis consectetur alias. Et quas sed impedit eum.', 'blank.jpg', 'Ditolak', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(149, '3201010101010005', 6, 3, 'Veritatis totam nemo.', 'Repellendus facere quos aliquid odit et. Sit perferendis distinctio natus tenetur sed eos corrupti.', 'blank.jpg', 'Selesai', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(150, '3201010101010008', 3, 3, 'Sunt qui ea delectus est.', 'Sed velit accusamus occaecati molestiae magni assumenda repudiandae. Maxime iste eos nobis illo doloremque. Veritatis sint adipisci odit accusamus eos sequi. Aut itaque saepe nulla laudantium provident accusantium. Officia placeat aut sint enim ipsa dicta beatae.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(151, '3201010101010008', 1, 3, 'Officia est error vel.', 'Et perferendis iure quas nesciunt sint nemo. Eum quae aut quisquam incidunt molestiae labore voluptas. Quia ut voluptas impedit et ex ducimus odio.', 'blank.jpg', 'Terverifikasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(152, '3201010101010015', 2, 3, 'Possimus est facilis id aperiam ut.', 'Illo et similique error suscipit autem omnis. Amet et esse asperiores magnam nulla dolorem optio. Omnis dolor atque eos ullam.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(153, '3201010101010011', 5, 2, 'Consequuntur qui est autem provident.', 'At est sunt optio ex ipsum illum. Dolores et voluptatem cum quia tempora deleniti et at. Ut maxime eaque qui magnam ipsa officiis deleniti tempore.', 'blank.jpg', 'Selesai', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(154, '3201010101010006', 1, 4, 'Dignissimos necessitatibus sed.', 'Qui quis suscipit tempore adipisci. Unde perferendis et qui delectus aliquid voluptate non. Ut reiciendis laborum sed error. Et sunt iusto laborum cum.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(155, '3201010101010003', 6, 4, 'Non sed amet ad est.', 'Aperiam iure quis et eaque quod et et. Expedita enim dolore cumque libero architecto voluptas. Voluptatem at cum et tempora aliquid. Ab aut voluptas quam minima neque quaerat.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(156, '3201010101010001', 5, 4, 'Inventore aut maxime tempora eius consequatur.', 'Et deserunt voluptatem quidem dolores ea enim corporis. Et et dolore hic nisi vitae dolores quidem. Suscipit in unde sunt in nulla et. Nihil iure aspernatur fugit eum quam tenetur.', 'blank.jpg', 'Terverifikasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(157, '3201010101010003', 3, 3, 'Dolor rerum blanditiis libero deleniti ullam.', 'Esse qui iusto ratione optio ut odio ut. Esse voluptas ducimus voluptatem quis est sapiente quis. Ex rerum temporibus in sed ab sunt voluptas. Tempora ratione eveniet deleniti nemo.', 'blank.jpg', 'Terverifikasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Anonim'),
(158, '3201010101010006', 4, 3, 'Asperiores enim qui necessitatibus sunt.', 'Sequi recusandae dolores sed nulla. Atque temporibus quidem dolore ab eligendi iure. Ipsam aliquam eligendi praesentium minima expedita ut. Consequatur dolorem blanditiis quaerat vel.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(159, '3201010101010010', 2, 6, 'Ab nihil et in.', 'Similique voluptatem dolor aut qui asperiores. Sit soluta corporis sed iure. Atque nobis ullam autem.', 'blank.jpg', 'Ditolak', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Umum'),
(160, '3201010101010001', 1, 3, 'Debitis exercitationem autem.', 'Aut quam vel qui omnis. Hic ut illo dolor quidem. Soluta voluptatibus et aut reiciendis esse.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:01', '2025-10-28 03:29:01', NULL, 'Rahasia'),
(161, '3201010101010007', 6, 4, 'Recusandae reiciendis nulla temporibus.', 'Qui odio dolorum non autem. Sunt consequatur in numquam veritatis ut laudantium. Qui tempora et nostrum est.', 'blank.jpg', 'Ditolak', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Umum');
INSERT INTO `pengaduan` (`id_pengaduan`, `id_masyarakat`, `id_instansi`, `id_kategori`, `judul`, `isi`, `foto`, `status`, `created_at`, `updated_at`, `bukti`, `tipe_aduan`) VALUES
(162, '3201010101010004', 1, 3, 'Accusamus voluptatem reprehenderit et.', 'Et consequatur rerum dolores et molestias eos hic. Nihil dolor soluta ducimus ducimus. Nostrum est occaecati quasi minima pariatur. Dolores sit et molestiae dolorum dolor dignissimos.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Anonim'),
(163, '3201010101010005', 6, 5, 'Illo libero quas ut et.', 'Vel maxime necessitatibus tenetur et. Enim vero assumenda illo voluptas ipsam. Perspiciatis repudiandae voluptatem possimus eaque sit eos autem. Fuga ut dicta maxime eum sit.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Anonim'),
(164, '3201010101010013', 3, 1, 'Ab magnam qui et velit.', 'Amet quo suscipit omnis. Consequatur qui officia sint veritatis illo ratione placeat ut. Odio neque molestiae est quaerat.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Umum'),
(165, '3201010101010002', 3, 1, 'Cum ducimus temporibus praesentium.', 'Sed molestiae asperiores praesentium autem nesciunt itaque. Accusantium sint repellat sed. Inventore cum dolore qui rem.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Anonim'),
(166, '3201010101010010', 6, 5, 'Libero ad qui qui.', 'Voluptatibus voluptates rem ratione temporibus voluptatem. Vel est placeat eligendi dolorem. Et est quam est quis reiciendis facilis. Omnis nesciunt sed labore et debitis impedit.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Rahasia'),
(167, '3201010101010009', 2, 5, 'Debitis quia omnis autem assumenda.', 'Laudantium ut qui et delectus et officiis. Sunt cum modi est molestias. Quidem molestiae aut iusto assumenda autem.', 'blank.jpg', 'Ditolak', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Anonim'),
(168, '3201010101010014', 4, 1, 'Porro deleniti explicabo inventore rerum sunt.', 'Dolor odit tempora quis nam. Provident at rerum temporibus fuga. Eligendi eum quasi iusto repudiandae cum.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Rahasia'),
(169, '3201010101010001', 2, 1, 'Voluptatem non eum minima ducimus.', 'Voluptatibus ullam aut veniam magnam eveniet velit veniam esse. Voluptate dolore quas iure voluptatem quo iure labore. Ratione sed ea iste aut ea. Voluptatum ad est ea molestias esse.', 'blank.jpg', 'Terverifikasi', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Umum'),
(170, '3201010101010004', 3, 3, 'Rerum eaque voluptate nisi.', 'Voluptatem inventore tempore sed amet optio quidem. Quo blanditiis molestiae atque tempora cumque. Soluta sit aperiam odio ratione nihil sunt. Non ea qui quam dolores suscipit.', 'blank.jpg', 'Terverifikasi', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Umum'),
(171, '3201010101010010', 6, 2, 'Ab quos et ex.', 'Necessitatibus aut perferendis deserunt quibusdam porro. Eum ex voluptatem excepturi quisquam. Veritatis ut consequatur corrupti aut.', 'blank.jpg', 'Selesai', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Umum'),
(172, '3201010101010006', 5, 6, 'Dolores ducimus totam nam ut.', 'Qui mollitia tenetur illo nobis rem. Sunt fugit eum deserunt iure consequatur modi dolore. Tempora soluta ea eaque alias vitae nihil. Rerum distinctio cupiditate rerum est quia quia aspernatur.', 'blank.jpg', 'Terverifikasi', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Rahasia'),
(173, '3201010101010011', 2, 2, 'Amet voluptas accusantium molestiae.', 'Quo sunt modi et et voluptate quisquam amet id. Libero suscipit laboriosam at autem est. At reiciendis doloribus facere ut autem autem provident. Qui iure non explicabo molestiae. Aliquid iste velit tenetur eaque.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Rahasia'),
(174, '3201010101010003', 3, 3, 'Consequatur inventore quia est.', 'Qui nisi error id. Quo debitis et voluptate qui. Nam voluptatibus et aspernatur quos provident minima quos. Voluptas est soluta molestiae distinctio.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Anonim'),
(175, '3201010101010010', 5, 1, 'Esse aut officia.', 'Tempore veritatis quod dolores aliquam aut qui rerum. Consectetur quia est ea aut consequatur facilis dolor veniam. Non error incidunt delectus voluptatem optio expedita sed sit. Odit aut deserunt corporis commodi recusandae possimus cumque.', 'blank.jpg', 'Ditolak', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Umum'),
(176, '3201010101010006', 6, 1, 'Aliquam dicta eligendi.', 'Dolores aut saepe laudantium cum enim numquam ut. Explicabo cum vero sunt qui harum. Ab ea qui adipisci ex ex minus ullam ut.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Umum'),
(177, '3201010101010008', 1, 6, 'Voluptatibus sit tempora sunt nihil.', 'Eum veniam quo autem fuga nihil. Ad sapiente unde ea vero. Qui ad omnis aut consequuntur tempore. Quo qui quisquam temporibus veritatis unde aspernatur natus.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Anonim'),
(178, '3201010101010015', 1, 2, 'Voluptatibus placeat dolorem ut non.', 'Sint necessitatibus deserunt odio est et dolor temporibus doloribus. Expedita ducimus nostrum accusamus. Non sequi dolorem doloremque aut quia. Libero inventore laboriosam tempore qui sint dolor quibusdam sit. Nulla a qui ut nostrum hic rerum delectus.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Anonim'),
(179, '3201010101010008', 2, 1, 'Qui cupiditate aut mollitia.', 'Enim minima ut et cupiditate at. Non cumque consequatur corrupti debitis. Et libero magnam occaecati.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Rahasia'),
(180, '3201010101010006', 6, 3, 'Sint sed natus quo consequuntur amet.', 'Optio molestiae dolor et minus quisquam illo aut. Voluptatem consequatur ducimus ut sit explicabo enim deleniti suscipit. Dolorem exercitationem ut sint natus rerum.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Rahasia'),
(181, '3201010101010011', 1, 3, 'Quo nulla placeat nulla amet natus.', 'Inventore aut dolor odio est quos. Sed ea rerum molestias et ipsam eos. Tempore qui sint ipsam itaque incidunt consequatur delectus. Odit eum molestiae et quis.', 'blank.jpg', 'Selesai', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Anonim'),
(182, '3201010101010012', 3, 2, 'Voluptas natus corporis eum explicabo et.', 'Ut iste provident ea sed eaque non. Fugit doloribus excepturi fugiat earum dolorem. Et autem ab quia numquam in voluptatem.', 'blank.jpg', 'Ditolak', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Umum'),
(183, '3201010101010013', 5, 5, 'Et alias minus autem placeat.', 'Iure quae enim quo magni saepe. Accusantium illo placeat alias aut sunt iusto aut corporis. Quam et tenetur perferendis accusantium ea.', 'blank.jpg', 'Selesai', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Rahasia'),
(184, '3201010101010008', 5, 6, 'Eligendi labore natus odit qui.', 'Facilis numquam doloremque incidunt accusamus. Autem quo possimus libero maxime ea corrupti architecto. Rem et illum iusto mollitia nulla.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Anonim'),
(185, '3201010101010010', 2, 1, 'Aut quaerat alias.', 'Quidem cum magnam facere ut inventore cumque. At accusamus explicabo fuga voluptatibus. Deleniti at aut et amet quidem. Voluptatem accusamus sit quibusdam a ipsam commodi.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Umum'),
(186, '3201010101010011', 3, 4, 'Aspernatur consectetur dolorum.', 'Sed ut veniam ad animi ea esse quos. Natus necessitatibus quidem incidunt perferendis doloribus laudantium iste. Sed ipsum doloribus expedita numquam atque autem aspernatur et.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Anonim'),
(187, '3201010101010006', 6, 2, 'Aut qui et.', 'Dignissimos dolores aut aut. Cupiditate soluta necessitatibus autem voluptates. Consequuntur veniam consequatur quaerat debitis facilis. Commodi voluptatem ut minus. Voluptatum consequatur sed quod omnis voluptatem rem magnam.', 'blank.jpg', 'Selesai', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Rahasia'),
(188, '3201010101010001', 1, 5, 'Omnis illum et et placeat dicta.', 'Numquam modi porro quae. Magni qui porro modi nesciunt at. Modi itaque cupiditate incidunt repellat nostrum odio. Beatae veniam possimus et esse. Voluptatem voluptatibus repellendus debitis labore ex.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Anonim'),
(189, '3201010101010007', 1, 6, 'Est aut eveniet praesentium dolorem.', 'Id non consequatur iure non quos. Rerum dolor tempora dolores recusandae necessitatibus asperiores quae.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Umum'),
(190, '3201010101010014', 3, 3, 'Ea ipsa laudantium qui iusto.', 'Perferendis et quia ad. Rerum nisi voluptatem cupiditate eaque. Ut vel at illo alias. Odit et esse non et ut pariatur rerum ut.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Anonim'),
(191, '3201010101010007', 6, 5, 'Corrupti dolore qui corporis dolores sapiente.', 'Quidem est eius aspernatur eos libero. Fuga voluptatem quo consequatur ut ea. Ab saepe libero aliquid et et. Quos impedit minima dignissimos esse.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Umum'),
(192, '3201010101010005', 6, 5, 'Voluptatem cupiditate ut corporis.', 'Esse cumque repudiandae aut id sapiente non eius. Quia deserunt sunt sequi nemo. Harum nostrum et accusantium itaque nihil. Odit ad sunt ea consequuntur.', 'blank.jpg', 'Dialokasi', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Umum'),
(193, '3201010101010015', 5, 5, 'Est delectus illo.', 'Nihil harum tenetur eos veniam. Et odio hic quisquam sint. Aut voluptas consequatur aut possimus. Asperiores aperiam ipsa quos.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Rahasia'),
(194, '3201010101010014', 1, 6, 'Eos eius dolorum nobis odio.', 'Consequuntur et voluptas aut quia et mollitia provident qui. Est debitis id et sint quis deleniti. Voluptate sunt suscipit vel ullam a nam.', 'blank.jpg', 'Ditolak', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Anonim'),
(195, '3201010101010007', 1, 4, 'Facere quis necessitatibus aliquam inventore.', 'Necessitatibus maiores eos eos blanditiis dolores corrupti labore quod. Non maiores voluptatem veniam in aut. Aut porro veritatis non voluptas sed exercitationem. Itaque accusamus inventore qui nihil repellendus molestiae deleniti.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Anonim'),
(196, '3201010101010012', 5, 1, 'Reprehenderit sit et assumenda dolores.', 'Consequuntur eos similique odio nihil. In cum harum doloribus et.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Anonim'),
(197, '3201010101010004', 4, 3, 'Qui harum est ex.', 'Repellat voluptates similique laborum velit quis delectus. Est enim ea eos totam et harum. Et delectus deserunt molestiae qui quia beatae esse.', 'blank.jpg', 'Diajukan', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Rahasia'),
(198, '3201010101010009', 5, 3, 'Eos et error quod repudiandae.', 'Suscipit nesciunt id beatae molestiae reprehenderit repudiandae. Quas fugit rem autem rerum omnis et repudiandae. Fugiat et necessitatibus quaerat occaecati ipsam maxime consectetur. Itaque quia veritatis et libero quasi consequatur neque.', 'blank.jpg', 'Terverifikasi', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Anonim'),
(199, '3201010101010006', 2, 4, 'Magnam vel consectetur ex autem.', 'Aliquam qui officiis eligendi molestiae. Natus rerum dolores aspernatur laboriosam veniam voluptatibus molestiae. Quia eveniet modi necessitatibus vel ut corporis officia. Nostrum excepturi at accusantium voluptatibus eveniet. Necessitatibus neque omnis ab.', 'blank.jpg', 'Dalam Proses', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Umum'),
(200, '3201010101010009', 3, 4, 'Voluptatum incidunt deleniti eaque perferendis aliquid.', 'Ratione explicabo voluptas voluptas dicta assumenda. Voluptas sit quia maxime commodi aperiam commodi. Dolorem veritatis voluptatum at laudantium tenetur hic.', 'blank.jpg', 'Ditolak', '2025-10-28 03:29:02', '2025-10-28 03:29:02', NULL, 'Umum'),
(201, '1212332332323232', 5, 6, 'Sapi Hilang', 'Saya punya peternakan sapi, sapi saya ada 16 ekor, dan setelah saya pergi meninggalkan sapi saya untuk pergi mengambil makanan ternak. sapinya hilang satu.. mohon bantuanya bapak.. ibuuu', '1761631864_1df6d7b798c6b9fcff54.jpg', 'Selesai', '2025-10-28 06:11:04', '2025-10-28 07:04:25', '1761635061_1184f1ccaa3e9620e07f.pdf', 'Umum'),
(202, '1212332332323232', 2, 6, 'Banya Pancuri', 'Akhir-akhir ini saya sering kehilangan barang pak, kemarin kehilangan sepatu, sekarang tv saya juga hilang, terus bagaiamana tindakan bapak selaku pemerintahan di desa ini. mohon tanggapannya bapak😭😭', '1761707256_13f6e9bc92137fb6dd6c.jpg', 'Selesai', '2025-10-29 03:07:36', '2025-10-29 03:36:01', '1761708957_159fde1aa5eeb78d421f.pdf', 'Umum'),
(203, '1212332332323232', 6, 3, 'Jalan Rusak', 'Kea skali jalan disini pak, beken cilaka orang.', 'blank.jpg', 'Selesai', '2025-10-29 04:17:50', '2025-10-29 04:43:21', '1761712996_a44fd7a756723914d6ca.pdf', 'Umum');

--
-- Indeks untuk tabel yang dibuang
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `deskripsi_kategori`
--
ALTER TABLE `deskripsi_kategori`
  ADD PRIMARY KEY (`id_deskripsi`);

--
-- Indeks untuk tabel `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id_feedback`);

--
-- Indeks untuk tabel `histori_pengaduan`
--
ALTER TABLE `histori_pengaduan`
  ADD PRIMARY KEY (`id_histori`);

--
-- Indeks untuk tabel `instansi`
--
ALTER TABLE `instansi`
  ADD PRIMARY KEY (`id_instansi`);

--
-- Indeks untuk tabel `kategori_pengaduan`
--
ALTER TABLE `kategori_pengaduan`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `masyarakat`
--
ALTER TABLE `masyarakat`
  ADD PRIMARY KEY (`nik`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id_pengaduan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `deskripsi_kategori`
--
ALTER TABLE `deskripsi_kategori`
  MODIFY `id_deskripsi` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id_feedback` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `histori_pengaduan`
--
ALTER TABLE `histori_pengaduan`
  MODIFY `id_histori` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=529;

--
-- AUTO_INCREMENT untuk tabel `instansi`
--
ALTER TABLE `instansi`
  MODIFY `id_instansi` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `kategori_pengaduan`
--
ALTER TABLE `kategori_pengaduan`
  MODIFY `id_kategori` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id_pengaduan` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
