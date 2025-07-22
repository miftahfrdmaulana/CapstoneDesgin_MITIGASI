# Capstone Design | MITIGASI (Mitigasi Akademik Terintegrasi) | Universitas Telkom

Ini adalah repository untuk menyimpan code dan penjelasannya yang digunakan untuk membangun sistem MITIGASI (Mitigasi Akademik Terintegrasi).

## MITIGASI: Website Mitigasi Mahasiswa Bermasalah Berbasis Machine Learning

Sistem web untuk membantu dosen wali dalam memantau dan mitigasi dini mahasiswa yang berisiko mengalami masalah akademik, psikologis, dan finansial di Universitas Telkom.

🌐 **Live Demo**: [https://capstone-frontend-1059248723043.asia-southeast1.run.app](https://capstone-frontend-1059248723043.asia-southeast1.run.app)

### About

MITIGASI adalah solusi digital untuk mengatasi tingginya angka dropout mahasiswa di Fakultas Teknik Elektro Universitas Telkom. Sistem ini menggunakan teknologi machine learning dengan algoritma Random Forest untuk mengklasifikasikan status mahasiswa menjadi tiga kategori: **Aman**, **Siaga**, dan **Bermasalah**.

#### 🎯 **Problem Statement**
- Program Studi S1 Teknik Komputer menempati peringkat ke-3 dengan total 100 mahasiswa dropout (2021-2023)
- Sistem monitoring existing bersifat kuratif dan manual
- Belum ada platform terintegrasi untuk mitigasi preventif

#### 💡 **Solution**
- **Deteksi Dini**: Prediksi status mahasiswa menggunakan Random Forest
- **Monitoring Holistik**: Aspek akademik, psikologi (DASS-21), dan finansial
- **Dashboard Interaktif**: Visualisasi data dan analytics untuk dosen wali
- **Preventif**: Intervensi sebelum masalah menjadi kritis

## 🚀 Features

### 👨‍🏫 **Dosen Wali**
- **MyStudent**: Monitor dan prediksi status mahasiswa dengan ML
- **MyCourseAdvisor**: Rekomendasi mata kuliah berbasis data akademik
- **MyReport**: Kelola keluhan dan feedback mahasiswa

### 🎓 **Mahasiswa**
- **MyProgress**: Visualisasi trend akademik dan klasifikasi status
- **MyCourse**: Riwayat mata kuliah dan rekomendasi dosen wali
- **MyWellness**: Asesmen psikologi menggunakan instrumen DASS-21
- **MyFinance**: Pengajuan keringanan finansial
- **MyFeedback**: Sistem keluhan akademik dan personal

### 👨‍💻 **Admin**
- **User Management**: Kelola pengguna (admin, dosen wali, mahasiswa)
- **Academic Management**: CRUD data akademik dan kurikulum
- **System Analytics**: Log aktivitas dan monitoring sistem

## 🏗️ Architecture & Tech Stack

### **Frontend**
- **React.js** + **Vite** - Modern web framework
- **Tailwind CSS** - Utility-first styling
- **Chart.js** & **Recharts** - Data visualization
- **React Router** - Client-side routing

### **Backend**
- **Node.js** + **Express.js** - RESTful API server
- **MySQL** - Relational database
- **JWT** - Authentication & authorization
- **Multer** - File upload handling

### **Machine Learning**
- **Python** - ML development environment
- **Scikit-learn** - Random Forest implementation
- **Pandas** & **NumPy** - Data processing
- **DASS-21** - Psychological assessment instrument

### **Cloud Infrastructure**
- **Google Cloud Platform** - Cloud hosting
- **Cloud Run** - Serverless deployment
- **Cloud SQL** - Managed MySQL database
- **Cloud Storage** - File storage
- **Docker** - Containerization

## 🤖 Machine Learning Model

### **Random Forest Classifier**
- **Accuracy**: 95% on test dataset
- **Features**: IPK, Skor Psikologi, Status Finansial
- **Output**: Klasifikasi Aman/Siaga/Bermasalah
- **Feature Importance**: IPK (53.31%), Psikologi (31.56%), Finansial (15.12%)

### **DASS-21 Integration**
- **Depression, Anxiety, Stress Scales** - 21 questions
- **Score Range**: 1-100 (converted from 0-63 raw score)
- **Real-time Analysis**: Instant psychological assessment
- **Evidence-based**: Validated psychometric instrument
- 
## 🌐 Deployment

**Frontend**: Deployed on Google Cloud Run (Serverless)  
**Backend**: Deployed on Google Cloud Run with hybrid Node.js + Python environment  
**Database**: Google Cloud SQL (MySQL)  
**Storage**: Google Cloud Storage for file uploads  

## 📊 Testing Results

- **User Acceptance Testing**: 85%+ satisfaction rate
- **Functional Testing**: 100% test cases passed
- **Security Testing**: OWASP ZAP - No high-risk vulnerabilities
- **Performance**: <2s response time, 99% uptime

## 📖 Documentation

- **Manual Book**: [View Documentation](link-to-manual-book)
- **API Documentation**" Available in `/backend` folder
- **ML Model Details**: Available in `/Machine Learning` folder

## Team Members

- **1103213114** – Andreas Wahyu Prayogo
- **1103213092** – Raditya Ghifari Aljabbar  
- **1103210066** – Miftah Farid Maulana

## Our Supervisors

- **Dr. Purba Daru Kusuma, S.T., M.T.** - Pembimbing 1
- **Roswan Latuconsina, S.T., M.T.** - Pembimbing 2

## 📄 License

This project is developed as part of Capstone Design course at Universitas Telkom.

---

**You can view and read the code's detail in their corresponding folder**

⭐ **Star this repository if you found it helpful!**
