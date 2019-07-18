NOTE : area yang valid untuk ID ktp hanya untuk daerah DKI Jakarta

Step For Running
- Dikarenakan belum support docker, untuk menjalankan aplikasi harus jalankan initialsql.sql pada folder mysql di server MySql
- Ganti USE tag initialsql.sql sesuai dengan db yang dituju
- Ganti connection string di main.go dengan connection string yang baru
- build aplikasi menggunakan command go build di directory dimana file ini disimpan
- jalankan aplikasi dan dapat di test menggunakan postman
