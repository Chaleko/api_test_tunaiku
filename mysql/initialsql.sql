Use db_test_tunaiku;

CREATE TABLE `tbl_loan` (
  `LoanID` int(11) NOT NULL AUTO_INCREMENT,
  `Date` datetime DEFAULT NULL,
  `KTP` varchar(45) DEFAULT NULL,
  `BirthDate` datetime DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Ammount` decimal(20,2) DEFAULT NULL,
  `Period` int(11) DEFAULT NULL,
  PRIMARY KEY (`LoanID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_area` (
  `AreaID` int(11) NOT NULL AUTO_INCREMENT,
  `AreaCode` varchar(20) DEFAULT NULL,
  `ProvinceCode` varchar(2) DEFAULT NULL,
  `ProvinceDesc` varchar(50) DEFAULT NULL,
  `DistricCode` varchar(2) DEFAULT NULL,
  `DistricDesc` varchar(50) DEFAULT NULL,
  `SubDistricCode` varchar(2) DEFAULT NULL,
  `SubDistricDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AreaID`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

DELIMITER $$
CREATE PROCEDURE `sp_GetAvgLoan7day`(
	input_date datetime
)
BEGIN
	SELECT 
		Count(*) AS TotalRow,
		SUM(Ammount) AS TotalAmmount,
		AVG(Ammount) AS Average
    FROM tbl_loan 
    WHERE date between date_sub(str_to_date(input_date,'%Y-%m-%d'), interval 7 Day)  and input_date;  
END$$
DELIMITER ;

INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(1,"31","31","DKI JAKARTA","","","","");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(2,"3101","","","01","KAB. ADM. KEP. SERIBU","","");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(3,"310101","","","","","01","Kepulauan Seribu");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(4,"310102","","","","","02","Kepulauan Seribu");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(5,"3171","","","71","KOTA ADM. JAKARTA PUSAT","","");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(6,"317101","","","","","01","Gambir");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(7,"317102","","","","","02","Sawah Besar");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(8,"317103","","","","","03","Kemayoran");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(9,"317104","","","","","04","Senen");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(10,"317105","","","","","05","Cempaka Putih");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(11,"317106","","","","","06","Menteng");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(12,"317107","","","","","07","Tanah Abang");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(13,"317108","","","","","08","Johar Baru");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(14,"3172","","","72","KOTA ADM. JAKARTA UTARA","","");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(15,"317201","","","","","01","Penjaringan");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(16,"317202","","","","","02","Tanjung Priok");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(17,"317203","","","","","03","Koja");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(18,"317204","","","","","04","Cilincing");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(19,"317205","","","","","05","Pademangan");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(20,"317206","","","","","","Kelapa Gading");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(21,"3173","","","73","KOTA ADM. JAKARTA BARAT","","");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(22,"317301","","","","","01","Cengkareng");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(23,"317302","","","","","02","Grogol Petamburan");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(24,"317303","","","","","03","Taman Sari");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(25,"317304","","","","","04","Tambora");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(26,"317305","","","","","05","Kebon Jeruk");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(27,"317306","","","","","06","Kalideres");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(28,"317307","","","","","07","Pal Merah");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(29,"317308","","","","","08","Kembangan");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(30,"3174","","","74","KOTA ADM. JAKARTA SELATAN","","");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(31,"317401","","","","","01","Tebet");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(32,"317402","","","","","02","Setiabudi");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(33,"317403","","","","","03","Mampang Prapatan");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(34,"317404","","","","","04","Pasar Minggu");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(35,"317405","","","","","05","Kebayoran Lama");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(36,"317406","","","","","06","Cilandak");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(37,"317407","","","","","07","Kebayoran Baru");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(38,"317408","","","","","08","Pancoran");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(39,"317409","","","","","09","Jagakarsa");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(40,"317410","","","","","10","Pesanggrahan");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(41,"3175","","","75","KOTA ADM. JAKARTA TIMUR","","");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(42,"317501","","","","","01","Matraman");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(43,"317502","","","","","02","Pulogadung");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(44,"317503","","","","","03","Jatinegara");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(45,"317504","","","","","04","Kramatjati");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(46,"317505","","","","","05","Pasar Rebo");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(47,"317506","","","","","06","Cakung");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(48,"317507","","","","","07","Duren Sawit");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(49,"317508","","","","","08","Makasar");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(50,"317509","","","","","09","Ciracas");
INSERT INTO tbl_area(`AreaID`,`AreaCode`,`ProvinceCode`,`ProvinceDesc`,`DistricCode`,`DistricDesc`,`SubDistricCode`,`SubDistricDesc`) VALUES(51,"317510","","","","","10","Cipayung");