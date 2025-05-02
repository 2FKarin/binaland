-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: May 02, 2025 at 11:18 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `binaland1`
--

-- --------------------------------------------------------

--
-- Table structure for table `artikel`
--

CREATE TABLE `artikel` (
  `id_artikel` int(11) NOT NULL,
  `company` enum('Binaland','Superland') NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `isi` text NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `tanggal` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `artikel`
--

INSERT INTO `artikel` (`id_artikel`, `company`, `kategori`, `judul`, `isi`, `gambar`, `tanggal`) VALUES
(1, 'Binaland', 'Perumahan Elit', 'Perumahan Esklusif Pasuruan', 'perumahan elit yang ada di pasuruan dengan akses yang mudah ke berbagai layanan kesehatan, pusat perbelanjaan dan pendidikan', 'artikel/test.jpg', '2025-04-29 00:00:00'),
(2, 'Superland', '2', '2', '2', NULL, '2025-04-24 16:01:35'),
(3, 'Binaland', '3', '3', '3', NULL, '2025-04-24 16:01:35'),
(4, 'Superland', '7', '7', '7', NULL, '2025-04-24 16:02:44'),
(5, 'Superland', 'umroh', 'umroh murah', 'perumahan elit yang ada di pasuruan dengan akses yang mudah ke berbagai layanan kesehatan, pusat perbelanjaan dan pendidikan', 'artikel/j8F77AxhkA4K1v7tJc0wuIXDIgTvpmsNWBmoy4QR.jpg', '2025-04-29 00:00:00'),
(6, 'Binaland', 'Project perumahan', 'Perumahan Esklusif Pasuruan dengan view menarik dan memanjakan mata bagi yang melihatnya', 'isi masih kosong', 'artikel/Lh8v1Ovidg87Osv8rxd4QbIoOalEh09Jf94aUqiF.jpg', '2025-04-29 00:00:00'),
(7, 'Binaland', 'elit', 'Belum ada', 'apa yang kamu pikirkan', 'artikel/P6GstxJMsKgZmZjox8KVV48qKqMJj8urDfQHqzFo.jpg', '2025-04-22 00:00:00'),
(8, 'Binaland', 'Belum ada', 'Tidak diketahui', 'dengan siapa?', 'artikel/tfWi2EipTLnTD2DbHTT2QzfdNRBRvpcbnU3HUGux.jpg', '2025-04-02 00:00:00'),
(9, 'Binaland', 'naruto', 'perang', 'regenerasi', 'artikel/JJUkExjEAhCWARLVXgSLmBc3bDnL0vTs83ZfDExn.jpg', '2025-04-16 00:00:00'),
(10, 'Binaland', 'anime', 'naruto', 'apa ada?', 'artikel/NpctvocjHjY32GHDA8uECvUUL8KObTMao53gxbgo.jpg', '2025-04-30 00:00:00'),
(11, 'Superland', 'Sasuke', 'anime', 'naruto', 'artikel/jUotQLsEfBcpsWaO0qptndb4iasOFVCJQlEHjXeH.jpg', '2025-04-30 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas`
--

CREATE TABLE `fasilitas` (
  `id_fasilitas` int(11) NOT NULL,
  `fk_id_lokasi` int(11) DEFAULT NULL,
  `nama_fasilitas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fasilitas`
--

INSERT INTO `fasilitas` (`id_fasilitas`, `fk_id_lokasi`, `nama_fasilitas`) VALUES
(7, 15, 'kolam renang'),
(8, 1, '46');

-- --------------------------------------------------------

--
-- Table structure for table `gambar_fasilitas`
--

CREATE TABLE `gambar_fasilitas` (
  `id_gambar_fasilitas` int(11) NOT NULL,
  `fk_id_fasilitas` int(11) DEFAULT NULL,
  `gambar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gambar_fasilitas`
--

INSERT INTO `gambar_fasilitas` (`id_gambar_fasilitas`, `fk_id_fasilitas`, `gambar`) VALUES
(10, 7, 'fasilitas/qSzwbWfVbIbAK9E0FBKzYwbxNZZ5M9GaREWIf2d5.jpg'),
(11, 7, 'fasilitas/y6dDVStA7F9WSLZHGfWEkaauX2roOL6rhRjGNKV7.jpg'),
(12, 7, 'fasilitas/fHnf8lOAgSmafEFSeCSer8xaHaKGykCf4CUkVDn6.jpg'),
(13, 8, 'fasilitas/ePqq5ztiG2bRPxZwIb6X0cNokItD1i2cL1PNj3zB.jpg'),
(14, 8, 'fasilitas/ak2DE74OMRdDAfwVWaZ4SToB1O33iAK1n8p4L3m9.jpg'),
(15, 8, 'fasilitas/P7CHd9VDgEtxuYIVYje6NrXbudxPm3ODKXoLWZ1Q.jpg'),
(16, 8, 'fasilitas/NkVlM4Tp0m9ePaHc4CKA30Ba3N5udF6K2o9kBhuL.jpg'),
(17, 8, 'fasilitas/WEXyQ6mMeSZRVEYz0ryo51M0AlEgXdTAYCz66lb8.jpg'),
(18, 8, 'fasilitas/IIIzB8HNLEdqVvIbEiqAVJ3Hz9Bd27U0tmXj2F8y.jpg'),
(19, 8, 'fasilitas/PlsVwjnFuk58TdwyJ5ACkI6N4lNO3d8pwSz3V8Oi.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `gambar_lokasi`
--

CREATE TABLE `gambar_lokasi` (
  `id_gambar_lokasi` int(11) NOT NULL,
  `fk_id_lokasi` int(11) DEFAULT NULL,
  `gambar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gambar_lokasi`
--

INSERT INTO `gambar_lokasi` (`id_gambar_lokasi`, `fk_id_lokasi`, `gambar`) VALUES
(1, 1, 'lokasi/test.jpg'),
(2, 1, 'lokasi/test1.jpg'),
(3, 1, 'lokasi/test2.jpg'),
(4, 1, 'lokasi/test3.jpg'),
(5, 1, 'lokasi/test4.jpg'),
(6, 1, 'lokasi/test5.jpg'),
(23, 15, 'lokasi/GyMBCXhYFxprtvZPHqrXOo0LiwrYPk4D0PJjmfjY.jpg'),
(24, 15, 'lokasi/kGprm9cSyutbaIAIXAvghd3x06MtIP1TMkpijeEN.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `gambar_rumah`
--

CREATE TABLE `gambar_rumah` (
  `id_gambar` int(11) NOT NULL,
  `fk_id_tipe_rumah` int(11) DEFAULT NULL,
  `gambar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gambar_rumah`
--

INSERT INTO `gambar_rumah` (`id_gambar`, `fk_id_tipe_rumah`, `gambar`) VALUES
(1, 2, 'gambar_rumah/t9yXVNmtDUuvlC0NssFWGgJTDnM7P5ZthxPl8zTV.jpg'),
(2, 3, 'gambar_rumah/ouC6bCxo3YnaEPIN0QFYX6aMoeAKKJzc98gnXYAI.jpg'),
(3, 3, 'gambar_rumah/M4kpZRaGdBILKjAsD82r6sWGQdLXQKTS672ncAud.jpg'),
(4, 3, 'gambar_rumah/rSg8YHOWDboqnKemSC331MAxiQCqEK5s4EDYw3ju.jpg'),
(5, 3, 'gambar_rumah/3mwVeimTzz5U5FTNIw89YD3fr2hzXkLmQB19oSEM.jpg'),
(6, 3, 'gambar_rumah/NS7n7mqZxAMQQUhAh5kw5ptPkbBGRpr54xvxJa0t.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `lokasi`
--

CREATE TABLE `lokasi` (
  `id_lokasi` int(11) NOT NULL,
  `nama_lokasi` varchar(100) NOT NULL,
  `company` enum('Binaland','Superland') NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `provinsi` varchar(100) DEFAULT NULL,
  `kota` varchar(100) DEFAULT NULL,
  `kecamatan` varchar(100) DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lokasi`
--

INSERT INTO `lokasi` (`id_lokasi`, `nama_lokasi`, `company`, `deskripsi`, `provinsi`, `kota`, `kecamatan`, `alamat`) VALUES
(1, 'rumah tipr 46', 'Binaland', 'rumah cocok untuk keluarga sederhana', 'Jawa Timur', 'Kabupaten Pasuruan', 'Wonorejo', 'Jl. Pemuda Tamansari Selatan No.066 RT 02/01, Desa. Tamansari, Kec.Wonorejo, Kab.Pasuruan'),
(12, 'wrevfrtgvwetbwrv', 'Binaland', 'rgtbvewtrb v', '13', '1301', '1301011', 'rvtrewt wtr5v'),
(15, 'baru tambah', 'Superland', 'rfbvetgwtr', '14', '1402', '1402020', 'tbrye tyjbvert');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservasi_lokasi`
--

CREATE TABLE `reservasi_lokasi` (
  `id_reservasi_lokasi` int(11) NOT NULL,
  `fk_id_reservasi` int(11) DEFAULT NULL,
  `fk_id_lokasi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservasi_lokasi`
--

INSERT INTO `reservasi_lokasi` (`id_reservasi_lokasi`, `fk_id_reservasi`, `fk_id_lokasi`) VALUES
(3, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `reservasi_survey`
--

CREATE TABLE `reservasi_survey` (
  `id_reservasi` int(11) NOT NULL,
  `nama_pemesan` varchar(100) NOT NULL,
  `nomor_telepon` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `tanggal_survey` date NOT NULL,
  `jam_survey` time NOT NULL,
  `catatan` text DEFAULT NULL,
  `status` enum('Pending','Dikonfirmasi','Dibatalkan') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservasi_survey`
--

INSERT INTO `reservasi_survey` (`id_reservasi`, `nama_pemesan`, `nomor_telepon`, `email`, `tanggal_survey`, `jam_survey`, `catatan`, `status`) VALUES
(2, 'fajrul', '3216541654949', 'fajrulfalah.peta@gmail.com', '2025-05-30', '15:55:00', 'gtrbetrygv', 'Pending'),
(3, 'fajrul', '3216541654949', 'fajrulfalah.peta@gmail.com', '2025-05-16', '15:53:00', 'wdcre4fc', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `tipe_rumah`
--

CREATE TABLE `tipe_rumah` (
  `id_tipe_rumah` int(11) NOT NULL,
  `fk_id_lokasi` int(11) DEFAULT NULL,
  `nama_tipe` varchar(100) NOT NULL,
  `luas_bangunan` int(11) NOT NULL,
  `luas_tanah` int(11) NOT NULL,
  `harga` decimal(15,2) NOT NULL,
  `jumlah_kamar` int(5) NOT NULL,
  `jumlah_kamar_mandi` int(5) NOT NULL,
  `fasilitas_unggulan` varchar(100) NOT NULL,
  `is_promo` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tipe_rumah`
--

INSERT INTO `tipe_rumah` (`id_tipe_rumah`, `fk_id_lokasi`, `nama_tipe`, `luas_bangunan`, `luas_tanah`, `harga`, `jumlah_kamar`, `jumlah_kamar_mandi`, `fasilitas_unggulan`, `is_promo`) VALUES
(2, 15, 'erfvtrv', 342532, 4536, 453647.00, 4, 4, '- gayung\r\n- air pam\r\n -bak mandi', '0'),
(3, 1, 'erfvtrv', 342532, 4536, 453647.00, 4, 4, 'ergvtrbtyb', '0');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `postal` varchar(255) DEFAULT NULL,
  `about` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstname`, `lastname`, `email`, `email_verified_at`, `password`, `address`, `city`, `country`, `postal`, `about`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'Admin', 'admin@argon.com', NULL, '$2y$10$z6ZjwJ2aYHj7WiJGNd6L9.bNbwI1EqsJcOtbxlZnWm/YrPTOR0OsS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id_artikel`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`id_fasilitas`),
  ADD KEY `fk_id_lokasi` (`fk_id_lokasi`);

--
-- Indexes for table `gambar_fasilitas`
--
ALTER TABLE `gambar_fasilitas`
  ADD PRIMARY KEY (`id_gambar_fasilitas`),
  ADD KEY `fk_id_fasilitas` (`fk_id_fasilitas`);

--
-- Indexes for table `gambar_lokasi`
--
ALTER TABLE `gambar_lokasi`
  ADD PRIMARY KEY (`id_gambar_lokasi`),
  ADD KEY `fk_id_lokasi` (`fk_id_lokasi`);

--
-- Indexes for table `gambar_rumah`
--
ALTER TABLE `gambar_rumah`
  ADD PRIMARY KEY (`id_gambar`),
  ADD KEY `fk_id_tipe_rumah` (`fk_id_tipe_rumah`);

--
-- Indexes for table `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`id_lokasi`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `reservasi_lokasi`
--
ALTER TABLE `reservasi_lokasi`
  ADD PRIMARY KEY (`id_reservasi_lokasi`),
  ADD KEY `fk_id_reservasi` (`fk_id_reservasi`),
  ADD KEY `fk_id_lokasi` (`fk_id_lokasi`);

--
-- Indexes for table `reservasi_survey`
--
ALTER TABLE `reservasi_survey`
  ADD PRIMARY KEY (`id_reservasi`);

--
-- Indexes for table `tipe_rumah`
--
ALTER TABLE `tipe_rumah`
  ADD PRIMARY KEY (`id_tipe_rumah`),
  ADD KEY `fk_id_lokasi` (`fk_id_lokasi`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artikel`
--
ALTER TABLE `artikel`
  MODIFY `id_artikel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fasilitas`
--
ALTER TABLE `fasilitas`
  MODIFY `id_fasilitas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `gambar_fasilitas`
--
ALTER TABLE `gambar_fasilitas`
  MODIFY `id_gambar_fasilitas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `gambar_lokasi`
--
ALTER TABLE `gambar_lokasi`
  MODIFY `id_gambar_lokasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `gambar_rumah`
--
ALTER TABLE `gambar_rumah`
  MODIFY `id_gambar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lokasi`
--
ALTER TABLE `lokasi`
  MODIFY `id_lokasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservasi_lokasi`
--
ALTER TABLE `reservasi_lokasi`
  MODIFY `id_reservasi_lokasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reservasi_survey`
--
ALTER TABLE `reservasi_survey`
  MODIFY `id_reservasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tipe_rumah`
--
ALTER TABLE `tipe_rumah`
  MODIFY `id_tipe_rumah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD CONSTRAINT `fasilitas_ibfk_1` FOREIGN KEY (`fk_id_lokasi`) REFERENCES `lokasi` (`id_lokasi`) ON DELETE CASCADE;

--
-- Constraints for table `gambar_fasilitas`
--
ALTER TABLE `gambar_fasilitas`
  ADD CONSTRAINT `gambar_fasilitas_ibfk_1` FOREIGN KEY (`fk_id_fasilitas`) REFERENCES `fasilitas` (`id_fasilitas`) ON DELETE CASCADE;

--
-- Constraints for table `gambar_lokasi`
--
ALTER TABLE `gambar_lokasi`
  ADD CONSTRAINT `gambar_lokasi_ibfk_1` FOREIGN KEY (`fk_id_lokasi`) REFERENCES `lokasi` (`id_lokasi`) ON DELETE CASCADE;

--
-- Constraints for table `gambar_rumah`
--
ALTER TABLE `gambar_rumah`
  ADD CONSTRAINT `gambar_rumah_ibfk_1` FOREIGN KEY (`fk_id_tipe_rumah`) REFERENCES `tipe_rumah` (`id_tipe_rumah`) ON DELETE CASCADE;

--
-- Constraints for table `reservasi_lokasi`
--
ALTER TABLE `reservasi_lokasi`
  ADD CONSTRAINT `reservasi_lokasi_ibfk_1` FOREIGN KEY (`fk_id_reservasi`) REFERENCES `reservasi_survey` (`id_reservasi`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservasi_lokasi_ibfk_2` FOREIGN KEY (`fk_id_lokasi`) REFERENCES `lokasi` (`id_lokasi`) ON DELETE CASCADE;

--
-- Constraints for table `tipe_rumah`
--
ALTER TABLE `tipe_rumah`
  ADD CONSTRAINT `tipe_rumah_ibfk_1` FOREIGN KEY (`fk_id_lokasi`) REFERENCES `lokasi` (`id_lokasi`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
