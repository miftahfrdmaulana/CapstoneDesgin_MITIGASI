-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: mysql
-- ------------------------------------------------------
-- Server version	8.0.40-google

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `capstone_app_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `capstone_app_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `capstone_app_db`;

--
-- Table structure for table `admin_logs`
--

DROP TABLE IF EXISTS `admin_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `admin_username` varchar(100) NOT NULL,
  `action` text NOT NULL,
  `endpoint` varchar(255) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `status` enum('success','fail') NOT NULL,
  `target_entity` varchar(255) DEFAULT NULL COMMENT 'Contoh: NIM mahasiswa, NIP dosen, ID kelas',
  `log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_log_time` (`log_time` DESC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `atmin_mitigasi`
--

DROP TABLE IF EXISTS `atmin_mitigasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atmin_mitigasi` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabel untuk menyimpan data admin mitigasi';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dosen_wali`
--

DROP TABLE IF EXISTS `dosen_wali`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dosen_wali` (
  `nip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kode` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'aktif',
  PRIMARY KEY (`nip`),
  UNIQUE KEY `kode` (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hasil_tes_psikologi`
--

DROP TABLE IF EXISTS `hasil_tes_psikologi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hasil_tes_psikologi` (
  `idHasil` int NOT NULL AUTO_INCREMENT,
  `nim` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `skor_depression` int NOT NULL,
  `skor_anxiety` int NOT NULL,
  `skor_stress` int NOT NULL,
  `total_skor` int NOT NULL,
  `kesimpulan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `saran` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `klasifikasi` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tanggalTes` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idHasil`),
  KEY `nim` (`nim`),
  CONSTRAINT `hasil_tes_psikologi_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ipk_mahasiswa`
--

DROP TABLE IF EXISTS `ipk_mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipk_mahasiswa` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `nim` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sks_lulus` int NOT NULL,
  `ipk_lulus` float NOT NULL,
  `tanggal_dibuat` timestamp NOT NULL,
  `tanggal_diubah` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nim_2` (`nim`),
  KEY `nim` (`nim`),
  CONSTRAINT `ipk_mahasiswa_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kelas`
--

DROP TABLE IF EXISTS `kelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kelas` (
  `id_kelas` int NOT NULL AUTO_INCREMENT,
  `tahun_angkatan` int DEFAULT NULL,
  `kode_dosen` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kode_kelas` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_kelas`),
  UNIQUE KEY `kode_kelas_2` (`kode_kelas`),
  KEY `kode_dosen` (`kode_dosen`),
  KEY `kode_kelas` (`kode_kelas`),
  CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`kode_dosen`) REFERENCES `dosen_wali` (`kode`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keluhan_mahasiswa`
--

DROP TABLE IF EXISTS `keluhan_mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keluhan_mahasiswa` (
  `id_keluhan` int NOT NULL AUTO_INCREMENT,
  `nim_keluhan` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal_keluhan` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `title_keluhan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `detail_keluhan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_keluhan`),
  KEY `nim_keluhan` (`nim_keluhan`),
  CONSTRAINT `keluhan_mahasiswa_ibfk_1` FOREIGN KEY (`nim_keluhan`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `klasifikasi_akademik`
--

DROP TABLE IF EXISTS `klasifikasi_akademik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klasifikasi_akademik` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `nim` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hasil_klasifikasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal_dibuat` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `tanggal_diubah` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nim_2` (`nim`),
  KEY `nim` (`nim`),
  CONSTRAINT `klasifikasi_akademik_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `klasifikasi_finansial`
--

DROP TABLE IF EXISTS `klasifikasi_finansial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klasifikasi_finansial` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `nim` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status_finansial` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1',
  `id_response` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nim` (`nim`),
  KEY `id_response` (`id_response`),
  CONSTRAINT `klasifikasi_finansial_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `klasifikasi_finansial_ibfk_2` FOREIGN KEY (`id_response`) REFERENCES `response_finansial` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `klasifikasi_umum`
--

DROP TABLE IF EXISTS `klasifikasi_umum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klasifikasi_umum` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `nim` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hasil_klasifikasi_umum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nim` (`nim`),
  CONSTRAINT `klasifikasi_umum_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lampiranfeedback`
--

DROP TABLE IF EXISTS `lampiranfeedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lampiranfeedback` (
  `id_lampiran` int NOT NULL AUTO_INCREMENT,
  `id_keluhan` int NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int NOT NULL,
  `uploaded_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_lampiran`),
  KEY `id_keluhan` (`id_keluhan`),
  CONSTRAINT `lampiranFeedback_ibfk_1` FOREIGN KEY (`id_keluhan`) REFERENCES `keluhan_mahasiswa` (`id_keluhan`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lampiranfinance`
--

DROP TABLE IF EXISTS `lampiranfinance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lampiranfinance` (
  `id_lampiran` int NOT NULL AUTO_INCREMENT,
  `id_keluhan` int NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int NOT NULL,
  `uploaded_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_lampiran`),
  KEY `id_keluhan` (`id_keluhan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lampiranmyreport`
--

DROP TABLE IF EXISTS `lampiranmyreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lampiranmyreport` (
  `id_lampiran` int NOT NULL AUTO_INCREMENT,
  `id_response` int NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int NOT NULL,
  `uploaded_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_lampiran`),
  KEY `id_response` (`id_response`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mahasiswa`
--

DROP TABLE IF EXISTS `mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mahasiswa` (
  `nim` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kelas` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'aktif',
  `peminatan` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`nim`),
  KEY `kelas` (`kelas`),
  CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`kelas`) REFERENCES `kelas` (`kode_kelas`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mata_kuliah_baru`
--

DROP TABLE IF EXISTS `mata_kuliah_baru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mata_kuliah_baru` (
  `id_mk` int NOT NULL AUTO_INCREMENT,
  `kode_mk` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_mk` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sks_mk` int NOT NULL,
  `jenis_mk` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tingkat` int NOT NULL,
  `jenis_semester` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `semester` int NOT NULL,
  `ekivalensi` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kurikulum` int NOT NULL,
  PRIMARY KEY (`kode_mk`),
  UNIQUE KEY `kode_mk` (`kode_mk`),
  KEY `id_mk` (`id_mk`),
  KEY `ekivalensi` (`ekivalensi`),
  CONSTRAINT `mata_kuliah_baru_ibfk_1` FOREIGN KEY (`ekivalensi`) REFERENCES `mata_kuliah_lama` (`kode_mk_lama`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mata_kuliah_lama`
--

DROP TABLE IF EXISTS `mata_kuliah_lama`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mata_kuliah_lama` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `kode_mk_lama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_mk_lama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sks_mk_lama` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kode_mk_lama` (`kode_mk_lama`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mata_kuliah_rekomendasi`
--

DROP TABLE IF EXISTS `mata_kuliah_rekomendasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mata_kuliah_rekomendasi` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `kode_mk` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kode_dosen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nim_mahasiswa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal_dibuat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `total_sks` int NOT NULL,
  `semester_mahasiswa` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kode_mk` (`kode_mk`),
  KEY `kode_dosen` (`kode_dosen`),
  KEY `nim_mahasiswa` (`nim_mahasiswa`),
  CONSTRAINT `mata_kuliah_rekomendasi_ibfk_1` FOREIGN KEY (`kode_mk`) REFERENCES `mata_kuliah_baru` (`kode_mk`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mata_kuliah_rekomendasi_ibfk_2` FOREIGN KEY (`kode_dosen`) REFERENCES `dosen_wali` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mata_kuliah_rekomendasi_ibfk_3` FOREIGN KEY (`nim_mahasiswa`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nilai`
--

DROP TABLE IF EXISTS `nilai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nilai` (
  `id_nilai` int NOT NULL AUTO_INCREMENT,
  `nim_mahasiswa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kode_mk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `indeks_nilai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `semester` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tahun_ajaran` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_nilai`),
  KEY `nim_mahasiswa` (`nim_mahasiswa`),
  KEY `kode_mk` (`kode_mk`),
  CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`nim_mahasiswa`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`kode_mk`) REFERENCES `mata_kuliah_baru` (`kode_mk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `peminatan_keahlian`
--

DROP TABLE IF EXISTS `peminatan_keahlian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peminatan_keahlian` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `kelompok_keahlian` varchar(255) CHARACTER SET utf8mb3 NOT NULL,
  `kode_matakuliah` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kode_matakuliah` (`kode_matakuliah`),
  CONSTRAINT `peminatan_keahlian_ibfk_1` FOREIGN KEY (`kode_matakuliah`) REFERENCES `mata_kuliah_baru` (`kode_mk`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `persemester`
--

DROP TABLE IF EXISTS `persemester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persemester` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nim_mahasiswa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ip_semester` float NOT NULL,
  `semester` int NOT NULL,
  `tanggal_dibuat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sks_semester` int NOT NULL,
  `tahun_ajaran` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jenis_semester` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nim_mahasiswa` (`nim_mahasiswa`),
  CONSTRAINT `persemester_ibfk_1` FOREIGN KEY (`nim_mahasiswa`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `response_dosen_wali`
--

DROP TABLE IF EXISTS `response_dosen_wali`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `response_dosen_wali` (
  `id_response` int NOT NULL AUTO_INCREMENT,
  `nip_dosen_wali` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_keluhan` int NOT NULL,
  `response_keluhan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal_response` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status_keluhan` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_response`),
  KEY `id_keluhan` (`id_keluhan`),
  KEY `nip_dosen_wali` (`nip_dosen_wali`),
  CONSTRAINT `response_dosen_wali_ibfk_1` FOREIGN KEY (`id_keluhan`) REFERENCES `keluhan_mahasiswa` (`id_keluhan`),
  CONSTRAINT `response_dosen_wali_ibfk_2` FOREIGN KEY (`nip_dosen_wali`) REFERENCES `dosen_wali` (`nip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `response_finansial`
--

DROP TABLE IF EXISTS `response_finansial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `response_finansial` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `nim` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `penghasilan_mahasiswa` int NOT NULL,
  `penghasilan_orangtua` int NOT NULL,
  `tanggungan_orangtua` int NOT NULL,
  `tempat_tinggal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pengeluaran_perbulan` int NOT NULL,
  `jenis_keringanan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alasan_keringan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jumlah_diajukan` int DEFAULT NULL,
  `detail_alasan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal_dibuat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status_pengajuan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Menunggu',
  PRIMARY KEY (`id`),
  KEY `nim` (`nim`),
  CONSTRAINT `response_finansial_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status_response_finansial`
--

DROP TABLE IF EXISTS `status_response_finansial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_response_finansial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_response_finansial` int NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal_dibuat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tanggal_diubah` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_response_finansial` (`id_response_finansial`),
  CONSTRAINT `status_response_finansial_ibfk_1` FOREIGN KEY (`id_response_finansial`) REFERENCES `response_finansial` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tak_mahasiswa`
--

DROP TABLE IF EXISTS `tak_mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tak_mahasiswa` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `nim` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tak` int NOT NULL,
  `tanggal_dibuat` timestamp NOT NULL,
  `tanggal_diubah` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nim_2` (`nim`),
  KEY `nim` (`nim`),
  CONSTRAINT `tak_mahasiswa_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `token_blacklist`
--

DROP TABLE IF EXISTS `token_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_blacklist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `blacklisted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `expires_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-22  8:59:26