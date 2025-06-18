-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2025 at 07:00 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lung_disease`
--

-- --------------------------------------------------------

--
-- Table structure for table `gejala`
--

CREATE TABLE `gejala` (
  `id_gejala` int(11) NOT NULL,
  `gejala` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gejala`
--

INSERT INTO `gejala` (`id_gejala`, `gejala`) VALUES
(1, 'Batuk'),
(2, 'Sesak napas'),
(3, 'Nyeri dada'),
(4, 'Demam'),
(5, 'Menggigil'),
(6, 'Batuk dengan dahak berdarah'),
(7, 'Kelelahan'),
(8, 'Berat badan turun'),
(9, 'Pernapasan berbunyi'),
(10, 'Pembengkakan kaki atau pergelangan'),
(11, 'Sputum (dahak) yang berlebihan'),
(12, 'Kesulitan tidur'),
(13, 'Penurunan kemampuan fisik');

-- --------------------------------------------------------

--
-- Table structure for table `penyakit`
--

CREATE TABLE `penyakit` (
  `id_penyakit` int(11) NOT NULL,
  `penyakit` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penyakit`
--

INSERT INTO `penyakit` (`id_penyakit`, `penyakit`) VALUES
(1, 'Pneumonia'),
(2, 'Tuberkulosis'),
(3, 'Asma'),
(4, 'Kanker Paru-paru'),
(5, 'Bronkitis'),
(6, 'PPOK'),
(7, 'Emboli Paru'),
(8, 'Tuberkulosis Ekstra Paru'),
(9, 'Asbestosis');

-- --------------------------------------------------------

--
-- Table structure for table `relasi`
--

CREATE TABLE `relasi` (
  `id_relasi` int(11) NOT NULL,
  `id_gejala` int(11) NOT NULL,
  `id_penyakit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `relasi`
--

INSERT INTO `relasi` (`id_relasi`, `id_gejala`, `id_penyakit`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 11, 1),
(11, 12, 1),
(12, 13, 1),
(13, 1, 2),
(14, 2, 2),
(15, 4, 2),
(16, 5, 2),
(17, 6, 2),
(18, 7, 2),
(19, 8, 2),
(20, 11, 2),
(21, 12, 2),
(22, 13, 2),
(23, 1, 3),
(24, 2, 3),
(25, 3, 3),
(26, 9, 3),
(27, 11, 3),
(28, 12, 3),
(29, 1, 4),
(30, 2, 4),
(31, 3, 4),
(32, 6, 4),
(33, 7, 4),
(34, 8, 4),
(35, 12, 4),
(36, 13, 4),
(37, 1, 5),
(38, 2, 5),
(39, 3, 5),
(40, 4, 5),
(41, 5, 5),
(42, 7, 5),
(43, 8, 5),
(44, 9, 5),
(45, 11, 5),
(46, 12, 5),
(47, 13, 5),
(48, 1, 6),
(49, 2, 6),
(50, 3, 6),
(51, 7, 6),
(52, 8, 6),
(53, 9, 6),
(54, 10, 6),
(55, 11, 6),
(56, 12, 6),
(57, 13, 6),
(58, 1, 7),
(59, 2, 7),
(60, 3, 7),
(61, 4, 7),
(62, 1, 8),
(63, 2, 8),
(64, 3, 8),
(65, 4, 8),
(66, 5, 8),
(67, 6, 8),
(68, 7, 8),
(69, 8, 8),
(70, 11, 8),
(71, 12, 8),
(72, 13, 8),
(73, 1, 9),
(74, 2, 9),
(75, 3, 9);

-- --------------------------------------------------------

--
-- Table structure for table `solusi`
--

CREATE TABLE `solusi` (
  `id_solusi` int(11) NOT NULL,
  `id_penyakit` int(11) NOT NULL,
  `solusi` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `solusi`
--

INSERT INTO `solusi` (`id_solusi`, `id_penyakit`, `solusi`, `deskripsi`) VALUES
(1, 1, '- Antibiotik untuk infeksi bakteri<br>- Obat antivirus untuk infeksi virus<br>- Istirahat yang cukup<br>- Minum banyak cairan<br>- Penggunaan obat pereda nyeri', 'Infeksi pada kantung udara di satu atau kedua paru-paru yang dapat disebabkan oleh bakteri, virus, atau jamur. Gejalanya termasuk batuk, demam, menggigil, dan kesulitan bernapas.'),
(2, 2, '- Pengobatan jangka panjang dengan antibiotik (biasanya 6-9 bulan)<br>- Kepatuhan pada regimen pengobatan sangat penting<br>- Isolasi untuk mencegah penyebaran', 'Infeksi bakteri yang terutama menyerang paru-paru, tetapi dapat menyebar ke bagian tubuh lainnya. Gejala termasuk batuk berkepanjangan dengan dahak atau darah, demam, keringat malam, dan penurunan berat badan.'),
(3, 3, '- Inhaler bronkodilator untuk meredakan gejala<br>- Steroid inhaler untuk mengurangi peradangan<br>- Hindari pemicu asma (alergen, polusi, asap)', 'Kondisi kronis yang menyebabkan penyempitan dan pembengkakan saluran napas, sering disertai produksi lendir berlebih. Gejala meliputi sesak napas, batuk, dan mengi.'),
(4, 4, '- Pembedahan untuk mengangkat tumor<br>- Kemoterapi<br>- Radioterapi<br>- Imunoterapi atau terapi target', 'Pertumbuhan sel abnormal di paru-paru yang dapat menyebar ke bagian tubuh lainnya. Gejala termasuk batuk yang tidak hilang, nyeri dada, batuk darah, dan penurunan berat badan.'),
(5, 5, '- Istirahat dan cairan yang cukup<br>- Obat batuk atau bronkodilator<br>- Antibiotik jika infeksi bakteri', 'Peradangan pada lapisan saluran bronkial yang membawa udara ke dan dari paru-paru. Gejalanya termasuk batuk dengan dahak, kelelahan, dan nyeri dada.'),
(6, 6, '- Berhenti merokok<br>- Penggunaan inhaler bronkodilator dan steroid<br>- Rehabilitasi paru<br>- Oksigen terapi', 'Penyakit paru-paru kronis yang menyebabkan penyempitan saluran napas, termasuk emfisema dan bronkitis kronis. Gejala meliputi sesak napas, batuk kronis, dan produksi lendir berlebih.'),
(7, 7, '- Penggunaan obat antikoagulan (pengencer darah)<br>- Pengobatan trombolitik untuk melarutkan bekuan darah<br>- Pembedahan atau prosedur untuk menghilangkan bekuan', 'Penyumbatan arteri di paru-paru biasanya oleh bekuan darah. Gejalanya termasuk sesak napas tiba-tiba, nyeri dada, dan batuk'),
(8, 8, '- Pengobatan jangka panjang dengan antibiotik (biasanya 6-9 bulan)<br>- Kepatuhan pada regimen pengobatan sangat penting<br>- Isolasi untuk mencegah penyebaran', 'Infeksi TB yang menyebar ke luar paru-paru, menyerang organ lain seperti kelenjar getah bening, tulang, atau ginjal. Gejalanya bervariasi tergantung pada organ yang terpengaruh.'),
(9, 9, 'Penyakit paru-paru yang disebabkan oleh paparan serat asbes, yang menyebabkan jaringan parut di paru-paru. Gejalanya termasuk sesak napas, batuk kering, dan nyeri dada.', '- Menghindari paparan lebih lanjut terhadap asbes<br>- Penggunaan inhaler untuk meredakan gejala<br>- Oksigen terapi<br>- Rehabilitasi paru');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `role` bigint(20) DEFAULT NULL,
  `nama` longtext DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `alamat` longtext DEFAULT NULL,
  `tgl_lahir` longtext DEFAULT NULL,
  `password` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `role`, `nama`, `email`, `alamat`, `tgl_lahir`, `password`) VALUES
(1, 1, 'admin', 'admin@email.com', 'Bandung, Jawa Barat', '2024-05-01', '$2y$10$ASS50col3niwOOku4Zkky.HpmF18hiPWL9pi2DnE8CS7jTDSD4ufe'),
(2, 2, 'rafi', 'rafi@email.com', 'Bandung', '2002-01-10', '$2y$10$T64I3uYhJnKMYFpBpen9juLclmHs8JQ.NCggmpc8iJfG63tNvPaLe');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gejala`
--
ALTER TABLE `gejala`
  ADD PRIMARY KEY (`id_gejala`);

--
-- Indexes for table `penyakit`
--
ALTER TABLE `penyakit`
  ADD PRIMARY KEY (`id_penyakit`);

--
-- Indexes for table `relasi`
--
ALTER TABLE `relasi`
  ADD PRIMARY KEY (`id_relasi`),
  ADD KEY `id_gejala` (`id_gejala`),
  ADD KEY `id_penyakit` (`id_penyakit`);

--
-- Indexes for table `solusi`
--
ALTER TABLE `solusi`
  ADD PRIMARY KEY (`id_solusi`),
  ADD KEY `id_penyakit` (`id_penyakit`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `uni_user_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gejala`
--
ALTER TABLE `gejala`
  MODIFY `id_gejala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `penyakit`
--
ALTER TABLE `penyakit`
  MODIFY `id_penyakit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `relasi`
--
ALTER TABLE `relasi`
  MODIFY `id_relasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `solusi`
--
ALTER TABLE `solusi`
  MODIFY `id_solusi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `relasi`
--
ALTER TABLE `relasi`
  ADD CONSTRAINT `relasi_ibfk_1` FOREIGN KEY (`id_gejala`) REFERENCES `gejala` (`id_gejala`) ON DELETE CASCADE,
  ADD CONSTRAINT `relasi_ibfk_2` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id_penyakit`) ON DELETE CASCADE;

--
-- Constraints for table `solusi`
--
ALTER TABLE `solusi`
  ADD CONSTRAINT `solusi_ibfk_1` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id_penyakit`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
