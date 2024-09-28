# Submission 2: Telco Customer Churn With TFX Pipeline
Nama: Frederic Davidsen

Username dicoding: fdavidsen

| | Deskripsi |
| ----------- | ----------- |
| Dataset | [Telco Customer Churn](https://www.kaggle.com/datasets/blastchar/telco-customer-churn/data) |
| Masalah | Pelanggan yang berhenti menggunakan suatu produk atau jasa dapat mempengaruhi pendapatan suatu bisnis. |
| Solusi machine learning | Sistem yang dapat melakukan klasifikasi apakah suatu pelanggan berpotensi berhenti menggunakan suatu produk atau jasa melalui perilaku atau informasi pelanggan tersebut. Solusi yang ditawarkan menerapkan pipeline TFX untuk membangun model klasifikasi potensi pelanggan melakukan penghentian penggunaan suatu produk atau jasa |
| Metode pengolahan | Menggunakan TFX untuk mempreparasi data dan membangun model. Proses preprocessing melibatkan transformasi fitur dan pemetaan label |
| Arsitektur model | Model mengimplementasi lapisan embedding untuk tekstual data dan lapisan Dense dengan aktivasi sigmoid untuk memprediksi apakah pelanggan akan berhenti (class 1) atau tidak (class 0) |
| Metrik evaluasi | Metrik yang digunakan untuk mengevaluasi model adalah Loss (training: 0.2848; testing: 0.9832) dan Binary Accuracy (training: 0.8620; testing: 0.7454) |
| Performa model | Hasil evaluasi seperti Loss dan Binary Accuracy yang dicapai pada dataset evaluasi |
| Opsi deployment | Model dapat dideploy menggunakan TFX Pusher ke direktori yang ditentukan, yang menyederhanakan proses deployment. Proses ini mendukung keberlanjutan dan kemudahan dalam pembaruan model |
| Web app | Tidak dapat melakukan deployment karena Railway tidak mengizinkan code deployment (detail ada pada notebook.ipynb) |
| Monitoring | Tidak dapat melakukan monitoring pada model serving |