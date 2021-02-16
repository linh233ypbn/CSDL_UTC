CREATE DATABASE THUVIEN
GO
USE THUVIEN
GO
CREATE TABLE KHOA
(
	MAKHOA NVARCHAR (10) NOT NULL,
	TENKHOA NVARCHAR (50) NOT NULL,
	CONSTRAINT PK_KHOA PRIMARY KEY (MAKHOA)
);
CREATE TABLE LOP
(
	MALOP NVARCHAR (10) NOT NULL,
	TENLOP NVARCHAR (50) NOT NULL,
	MAKHOA NVARCHAR (10) NOT NULL,
	CONSTRAINT PK_LOP PRIMARY KEY (MALOP),
	CONSTRAINT FK_LOP_KHOA FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);
CREATE TABLE KESACH
(
	MAKE NVARCHAR (10) PRIMARY KEY NOT NULL,
	TENKE NVARCHAR (30) NOT NULL,
);
CREATE TABLE TACGIA
(
	MATG NVARCHAR (10) PRIMARY KEY NOT NULL,
	TENTG NVARCHAR (50) NOT NULL,
);
CREATE TABLE HINHPHAT
(
	MAPHAT NVARCHAR(10) PRIMARY KEY NOT NULL,
	HESOPHAT FLOAT NOT NULL,
	TENHINHPHAT NVARCHAR(50) NOT NULL,
);


CREATE TABLE SINHVIEN
(
	MASV NVARCHAR(10) NOT NULL,
	HODEM NVARCHAR(30) NOT NULL,
	TEN NVARCHAR(20) NOT NULL,
	SDT NVARCHAR(15),
	GIOITINH NVARCHAR(5) NOT NULL,
	NGAYSINH DATE,
	QUEQUAN NVARCHAR(50) NOT NULL,
	MALOP NVARCHAR(10) NOT NULL,
	CONSTRAINT PK_SINHVIEN PRIMARY KEY (MASV),
	CONSTRAINT FK_SINHVIEN_LOP FOREIGN KEY (MALOP) REFERENCES LOP(MALOP)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);

CREATE TABLE SACH
(
	MASACH NVARCHAR(10) NOT NULL,
	TENSACH NVARCHAR(100) NOT NULL,
	SOLUONG INT NOT NULL,
	GIATIEN INT,
	THELOAI NVARCHAR(50),
	LANTAIBAN INT,
	MAKE NVARCHAR(10) NOT NULL,
	CONSTRAINT PK_SACH PRIMARY KEY (MASACH),
	CONSTRAINT FK_SACH_KESACH FOREIGN KEY (MAKE) REFERENCES KESACH(MAKE)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);
CREATE TABLE VIET
(
	MASACH NVARCHAR (10) NOT NULL,
	MATG NVARCHAR (10) NOT NULL,
	CONSTRAINT FK_VIET_SACH FOREIGN KEY (MASACH) REFERENCES SACH(MASACH)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	CONSTRAINT FK_VIET_TACGIA FOREIGN KEY (MATG) REFERENCES TACGIA(MATG)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
);
CREATE TABLE MUON_TRA
(
	MASACH NVARCHAR (10) NOT NULL,
	MASV NVARCHAR (10) NOT NULL,
	MAPHAT NVARCHAR (10),
	NGAYMUON DATE NOT NULL,
	NGAYTRA DATE,
	HANTRA DATE NOT NULL,
	GHICHU NVARCHAR (50),
	CONSTRAINT PK_MUON_TRA PRIMARY KEY (MASACH,MASV,MAPHAT,NGAYMUON),
	CONSTRAINT FK_MT_SACH FOREIGN KEY (MASACH) REFERENCES SACH(MASACH)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	CONSTRAINT FK_MT_SV FOREIGN KEY (MASV) REFERENCES SINHVIEN(MASV)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	CONSTRAINT FK_MT_HINHPHAT FOREIGN KEY (MAPHAT) REFERENCES HINHPHAT(MAPHAT)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
);

INSERT INTO KHOA VALUES ('CK',N'Kỹ thuật cơ khí');
INSERT INTO KHOA VALUES ('DTTT',N'Kỹ thuật điện tử, truyền thông');
INSERT INTO KHOA VALUES ('DDT',N'Kỹ thuật điện, điện tử');
INSERT INTO KHOA VALUES ('TDH',N'Kỹ thuật điều khiển và tự động hóa');
INSERT INTO KHOA VALUES ('CNTT',N'Công nghệ thông tin');
INSERT INTO KHOA VALUES ('KTXD',N'Kinh tế xây dựng');
INSERT INTO KHOA VALUES ('KTVT',N'Kinh tế vận tải');


INSERT INTO LOP VALUES ('CK1',N'Kỹ thuật cơ khí 1','CK');
INSERT INTO LOP VALUES ('CK2',N'Kỹ thuật cơ khí 2','CK');
INSERT INTO LOP VALUES ('CK3',N'Kỹ thuật cơ khí 3','CK');
INSERT INTO LOP VALUES ('DTTT1',N'Kỹ thuật điện tử, truyền thông 1','DTTT');
INSERT INTO LOP VALUES ('DTTT2',N'Kỹ thuật điện tử, truyền thông 2','DTTT');
INSERT INTO LOP VALUES ('DDT1',N'Kỹ thuật điện, điện tử 1','DDT');
INSERT INTO LOP VALUES ('TDH1',N'Kỹ thuật điều khiển và tự động hóa 1','TDH');
INSERT INTO LOP VALUES ('TDH2',N'Kỹ thuật điều khiển và tự động hóa 2','TDH');
INSERT INTO LOP VALUES ('CNTT1',N'Công nghệ thông tin 1','CNTT');
INSERT INTO LOP VALUES ('CNTT2',N'Công nghệ thông tin 2','CNTT');
INSERT INTO LOP VALUES ('CNTT3',N'Công nghệ thông tin 3','CNTT');
INSERT INTO LOP VALUES ('KTXD1',N'Kinh tế xây dựng 1','KTXD');
INSERT INTO LOP VALUES ('KTVT1',N'Kinh tế vận tải 1','KTVT');

INSERT INTO KESACH VALUES ('KH1',N'Khoa học 1');
INSERT INTO KESACH VALUES ('KH2',N'Khoa học 2');
INSERT INTO KESACH VALUES ('VA1',N'Văn học 1');
INSERT INTO KESACH VALUES ('VA2',N'Văn học 2');
INSERT INTO KESACH VALUES ('TI1',N'Tin học 1');
INSERT INTO KESACH VALUES ('TI2',N'Tin học 2');
INSERT INTO KESACH VALUES ('KT1',N'Kinh tế 1');
INSERT INTO KESACH VALUES ('LD1',N'Lịch sử - Địa lý 1');
INSERT INTO KESACH VALUES ('VH1',N'Văn hóa 1');
INSERT INTO KESACH VALUES ('VH2',N'Văn hóa 2');
INSERT INTO KESACH VALUES ('TN1',N'Thiếu nhi 1');
INSERT INTO KESACH VALUES ('GT1',N'Giáo trình 1');

INSERT INTO TACGIA VALUES ('TG0',N'Nhóm tác giả chưa biết tên');
INSERT INTO TACGIA VALUES ('TG1',N'Phạm Văn Ất');
INSERT INTO TACGIA VALUES ('TG2',N'Nguyễn Hiếu Cường');
insert into tacgia values ('TG3',N'Trần Thu Hà');
insert into tacgia values ('TG4',N'Lê Ngọc Bích');
insert into tacgia values ('TG5',N'Trần Tường Thụy');
insert into tacgia values ('TG6',N'Phạm Quang Hiển');
insert into tacgia values ('TG7',N'Lê Thuận');
insert into tacgia values ('TG8',N'Thanh Tâm');
insert into tacgia values ('TG9',N'Phạm Phương Hoa');
insert into tacgia values ('TG10',N'Simon Singh');
insert into tacgia values ('TG11',N'Lê Công Sĩ');
insert into tacgia values ('TG12',N'Nguyễn Kim Lân');
insert into tacgia values ('TG13',N'James Canton');
insert into tacgia values ('TG14',N'Nick Arnold');
insert into tacgia values ('TG15',N'Phạm Quang Huy');
insert into tacgia values ('TG16',N'Trịnh Vũ Khuyên');
insert into tacgia values ('TG17',N'Võ Văn Ba');
insert into tacgia values ('TG18',N'Đỗ Nhật Nam');
insert into tacgia values ('TG19',N'Amanda Huỳnh');
insert into tacgia values ('TG20',N'Nhất Linh');
insert into tacgia values ('TG21',N'Đoàn Minh Phượng');
insert into tacgia values ('TG22',N'Trần Việt Anh');
insert into tacgia values ('TG23',N'Victor Slipentruc');
insert into tacgia values ('TG24',N'Paulo Coelho');
insert into tacgia values ('TG25',N'Dave Trott');
insert into tacgia values ('TG26',N'Brian Tracy');
insert into tacgia values ('TG27',N'Simon Veksner');
insert into tacgia values ('TG28',N'Steven Gary Blank');
insert into tacgia values ('TG29',N'Phạm Công Luận');
insert into tacgia values ('TG30',N'Gosho aoyama');
insert into tacgia values ('TG31',N'Masashi Kishimoto');

insert into sach values ('TI0001',N'Giáo trình kỹ thuật lập trình C căn bản và nâng cao',15,72000,N'Lập trình',3,'TI1');
insert into sach values ('TI0002',N'Giao diện người và máy với S7 & Intouch',12,74000,N'Lập trình',2,'TI1');
insert into sach values ('TI0003',N'C++ & Lập trình hướng đối tượng',5,60000,N'Lập trình',5,'TI1');
insert into sach values ('TI0004',N'Lập trình Windows',10,70000,N'Lập trình',1,'TI1');
insert into sach values ('TI0005',N'Kiểm thử phần mềm',7,59000,N'Lập trình',4,'TI1');
insert into sach values ('TI0006',N'Joomla cho người  tự học',5,60000,N'Lập trình',2,'TI1');
insert into sach values ('TI0007',N'Microsoft VISO dành cho người tự học',6,32000,N'Văn Phòng',3,'TI2');
insert into sach values ('TI0008',N'Tin Học Văn Phòng Microsoft Office Dành Cho Người Tự Học',4,64000,N'Văn Phòng',5,'TI2');
insert into sach values ('TI0009',N'Tự Học Mathematica Bằng Hình Ảnh',20,24000,N'Văn Phòng',2,'TI2');
insert into sach values ('KH0001',N'Khoa Học Khám Phá - Mật Mã - Từ Cổ Điển Đến Lượng Tử',10,137000,N'Khám phá',2,'KH1');
insert into sach values ('KH0002',N'Kỹ Thuật Trồng Hoa Và Cây Cảnh Bằng Phương Pháp Thủy Sinh',3,20000,N'Kỹ thuật',2,'KH1');
insert into sach values ('KH0003',N'Em Khám Phá Khoa Học - Máy ATM Nhận Biết Thẻ Rút Tiền Như Thế Nào?',5,22000,N'Khám phá',3,'KH1');
insert into sach values ('KH0004',N'Tương lai Khác Thường - Những Xu Hướng Hàng Đầu Sẽ Định Hình Lại Thế Giới Trong 20 Năm Tới',10,88000,N'Khám phá',10,'KH1');
insert into sach values ('KH0005',N'Horrible Knowledge: Khảo Cổ Dễ Sợ',10,22000,N'Khám phá',9,'KH2');
insert into sach values ('KH0006',N'Vẽ, Lắp Ráp Tạo Chuyển Động Và Gia Công Khuôn Với Creo',15,68000,N'Kỹ thuật',7,'KH2');
insert into sach values ('KH0007',N'Quyết Địa Tinh Thư Điểm Huyệt Bộ - Tổng Hợp Tinh Hoa Địa Lý Phong Thủy Trân Tàng Bí Ẩn',10,184000,N'Phong Thủy',2,'KH2');
insert into sach values ('VA0001',N'Hẹn hò nước Mỹ',5,62000,N'Văn học Việt Nam',2,'VH1');
insert into sach values ('VA0002',N'Lam',10,60000,N'Văn học Việt Nam',3,'VH1');
insert into sach values ('VA0003',N'Việt Nam Danh Tác - Đoạn Tuyệt',15,46000,N'Văn học Việt Nam',3,'VH1');
insert into sach values ('VA0004',N'Và Khi Tro Bụi',5,52000,N'Văn học Việt Nam',5,'VH1');
insert into sach values ('VA0005',N'Có Điều Gì, Sao Không Nói Cùng Anh?',15,65000,N'Văn học Việt Nam',5,'VH1');
insert into sach values ('VA0006',N'Cứu Tinh Vũ Trụ',6,120000,N'Văn học nước ngoài',4,'VH2');
insert into sach values ('VA0007',N'Nhà Giả Kim',6,47000,N'Văn học nước ngoài',3,'VH2');
insert into sach values ('VA0008',N'The Alchemist',5,103000,N'Văn học nước ngoài',6,'VH2');
insert into sach values ('VA0009',N'Ngoại tình',8,132000,N'Văn học nước ngoài',4,'VH2');
insert into sach values ('KT0001',N'Ngấu Nghiến, Nghiền Ngẫm',10,95000,N'Marketing',4,'KT1');
insert into sach values ('KT0002',N'Thuật Quản Lý Bán Hàng',6,47000,N'Marketing',2,'KT1');
insert into sach values ('KT0003',N'Để Quảng Cáo Không Phải Là Quảng Cáo',7,88000,N'Marketing',3,'KT1');
insert into sach values ('KT0004',N'4 Bước Chinh Phục Đỉnh Cao',9,132000,N'Khởi nghiệp',5,'KT1');
insert into sach values ('LD0001',N'Chiến Thắng Điện Biên Phủ - Những Dấu Ấn Lịch Sử',8,280000,N'Lịch sử',5,'LD1');
insert into sach values ('VH0001',N'Sài Gòn Chuyện Đời Của Phố (Tập 3)',3,276000,N'Văn hóa',2,'VH1');
insert into sach values ('VH0002',N'Sài Gòn Chuyện Đời Của Phố (Tập 2)',6,276000,N'Văn hóa',3,'VH1');
insert into sach values ('VH0003',N'Sài Gòn Chuyện Đời Của Phố (Tập 1)',9,276000,N'Văn hóa',5,'VH1');
insert into sach values ('TN0001',N'Tiền đạo thứ 11',9,50000,N'Trinh thám',2,'TN1');
insert into sach values ('TN0002',N'15 phút yên lặng',6,50000,N'Trinh thám',2,'TN1');
insert into sach values ('TN0003',N'Con tàu mắc nạn trên không',10,50000,N'Trinh thám',5,'TN1');
insert into sach values ('TN0004',N'Cuộc chiến ở Tuyết Quốc',10,50000,N'Shōnen',5,'TN1');
insert into sach values ('TN0005',N'Cái chết tiên đoán',10,50000,N'Shōnen',1,'TN1');
insert into sach values ('TN0006',N'Boruto',10,50000,N'Shōnen',0,'TN1');



insert into viet values ('TI0001','TG1');
insert into viet values ('TI0001','TG2');
insert into viet values ('TI0002','TG3');
insert into viet values ('TI0002','TG4');
insert into viet values ('TI0003','TG1');
insert into viet values ('TI0004','TG1');
insert into viet values ('TI0005','TG5');
insert into viet values ('TI0005','TG6');
insert into viet values ('TI0006','TG5');
insert into viet values ('TI0006','TG6');
insert into viet values ('TI0007','TG7');
insert into viet values ('TI0007','TG8');
insert into viet values ('TI0008','TG6');
insert into viet values ('TI0008','TG9');
insert into viet values ('TI0009','TG4');
insert into viet values ('KH0001','TG10');
insert into viet values ('KH0002','TG11');
insert into viet values ('KH0003','TG12');
insert into viet values ('KH0004','TG13');
insert into viet values ('KH0005','TG14');
insert into viet values ('KH0006','TG15');
insert into viet values ('KH0007','TG16');
insert into viet values ('KH0007','TG17');
insert into viet values ('VA0001','TG18');
insert into viet values ('VA0002','TG19');
insert into viet values ('VA0003','TG20');
insert into viet values ('VA0004','TG21');
insert into viet values ('VA0005','TG22');
insert into viet values ('VA0006','TG23');
insert into viet values ('VA0007','TG24');
insert into viet values ('VA0008','TG24');
insert into viet values ('KT0001','TG25');
insert into viet values ('KT0002','TG26');
insert into viet values ('KT0003','TG27');
insert into viet values ('KT0004','TG28');
insert into viet values ('LD0001','TG0');
insert into viet values ('VH0001','TG29');
insert into viet values ('VH0002','TG29');
insert into viet values ('VH0003','TG29');
insert into viet values ('TN0001','TG30');
insert into viet values ('TN0002','TG30');
insert into viet values ('TN0003','TG30');
insert into viet values ('TN0004','TG31');
insert into viet values ('TN0005','TG31');
insert into viet values ('TN0006','TG31');

insert into sinhvien values ('K560001',N'Nguyễn Văn','Linh','01682035588','Nam','19970323',N'Yên Phong - Bắc Ninh','CK1');
insert into sinhvien values ('K560002',N'Phạm Đức',N'Khải','0981091797','Nam','19970920',N'Nam Sách – Hải Dương','CK1');
insert into sinhvien values ('K560003',N'Lê Văn','Nam','01654783928','Nam','19960302',N'Tân Lộc – Phú Thọ','CK1');
insert into sinhvien values ('K560004',N'Bùi Thành',N'Thất','0981234323','Nam','19970909',N'Yên Hòa – Hà Nội','CK1');
insert into sinhvien values ('K560005',N'Nguyễn Thị Mĩ','Linh','01233211234',N'Nữ','19970101',N'Yên Phong – Bắc Ninh','CK1');
insert into sinhvien values ('K560006',N'Lê Đức',N'Tuyên','03209873871','Nam','19961211',N'An Dương – Hải Phòng','CK1');
insert into sinhvien values ('K560007',N'Lê Thị','Dung','0981435672',N'Nữ','19970401',N'An Phú – An Giang','CK1');
insert into sinhvien values ('K560008',N'Nguyễn Thị','Hoa','0982746352',N'Nữ','19970908',N'Bắc Giang – Bắc Giang','CK1');
insert into sinhvien values ('K560009',N'Chu Hữu',N'Đạt','0984827364','Nam','19971222',N'Bát Xá – Lào Cai','CK1');
insert into sinhvien values ('K560010',N'Lưu Đức',N'Dũng','0981987086','Nam','19970422',N'Bảo Thắng – Lào Cai','CK1');
insert into sinhvien values ('K560011',N'Bùi Thị','Khanh','0981938275',N'Nữ','19971129',N'Ba Vì - Hà Nội','CK1');
insert into sinhvien values ('K560012',N'Lê Đức',N'Thọ','0981234328','Nam','19971111',N'Cẩm Xuyên – Hà Tĩnh','CK2');
insert into sinhvien values ('K560013',N'Phạm Văn',N'Đồng','01238473628','Nam','19971002',N'Cửa Lò – Nghệ An','CK2');
insert into sinhvien values ('K560014',N'Nguyễn Bình','An','01658375649',N'Nữ','19950109',N'Sơn Tây – Hà Nội','CK2');
insert into sinhvien values ('K560015',N'Nông Văn',N'Dền','01658364730','Nam','19970216',N'Yên Hòa – Hà Nội','CK2');
insert into sinhvien values ('K560016',N'Trần Thị',N'Huyền','0981837462',N'Nữ','19971022',N'Đa Phượng – Hà Nội','CK2');
insert into sinhvien values ('K560017',N'Lê Mên',N'Hô','0981736482','Nam','19970923',N'Đầm Hà – Quảng Ninh','CK2');
insert into sinhvien values ('K560018',N'Trần Văn',N'Lân','01238374625','Nam','19970123',N'Đình Lập – Lạng Sơn','CK2');
insert into sinhvien values ('K560019',N'Nguyễn Đức','Long','0981746372','Nam','19970309',N'Đoan Hùng – Phú Thọ','CK2');
insert into sinhvien values ('K560020',N'Nguyễn Thị',N'Lơ','01238467328',N'Nữ','19970909',N'Đống Đa – Hà Nội','CK2');
insert into sinhvien values('K560021',N'Chu Hữu',N'Đạt','0166844340',N'Nam','19970101',N'Đống Đa-Hà Nội','CK3');
insert into sinhvien values('K560022',N'Nguyễn Viết',N'Cường','0912372811',N'Nam','19970418',N'Yên Phong-Bắc Ninh','CK3');
insert into sinhvien values('K560023',N'Hà Công',N'Huy','0937382918',N'Nam','19970901',N'Yên Hòa-Hà Nội','CK3');
insert into sinhvien values('K560024',N'Vũ Tuấn',N'Lâm','01938272713',N'Nam','19970103',N'Nam Sách-Nam Dương','CK3');
insert into sinhvien values('K560025',N'Nguyễn Khắc',N'Toản','0938271821',N'Nam','19970102',N'Yên Phong-Bắc Ninh','CK3');
insert into sinhvien values('K560026',N'Tự Ngọc',N'Viên','01931274621',N'Nam','19970401',N'An Dương-Hải Phòng','CK3');
insert into sinhvien values('K560027',N'Chu Viết',N'Hiền','01683728321',N'Nam','19970806',N'Tân Lộc-Phú Thọ','CK3');
insert into sinhvien values('K560028',N'Nguyễn Văn',N'Huỳnh','01672837281',N'Nam','19971111',N'Đống Đa-Hà Nội','CK3');
insert into sinhvien values('K560029',N'Nguyễn Khắc',N'Giang','01684738291',N'Nam','19971212',N'An Phú-An Giang','DTTT1');
insert into sinhvien values('K560030',N'Nguyễn Văn',N'Trung','09284718382',N'Nam','19970221',N'Bát Xá-Lào Cai','DTTT1')
insert into sinhvien values('K560031',N'Đái Thị',N'Huệ','019472827312',N'Nữ','19970128',N'Ba Vì-Hà Nội','DTTT1');
insert into sinhvien values('K560032',N'Nguyễn Mai',N'Thanh','01938283912',N' Nữ','19971225',N'Bắc Từ Liêm-Hà Nội','DTTT1');
insert into sinhvien values('K560033',N'Nguyễn Ngọc',N'Chi','0987878212',N' Nữ','19970212',N'Nam Từ Liêm-Hà Nội','DTTT1');
insert into sinhvien values('K560034',N'Lê Hồng',N'Hạnh','0987931627',N' Nữ','19970506',N'Đầm Hà-Quảng Ninh','DTTT1');
insert into sinhvien values('K560035',N'Phan Ngọc',N'Hân','01983819281',N' Nữ','19970220',N'Đoan Hùng-Phú Thọ','DTTT1');
insert into sinhvien values('K560036',N'Phan Ngọc',N'Ánh','01987890981',N' Nữ','19971215',N'Đình Lập-Lạng Sơn','DTTT1');
insert into sinhvien values('K560037',N'Nguyễn Vân',N'Anh','0989090916',N' Nữ','19971115',N'Đan Phượng-Hà Nội','DTTT1');
insert into sinhvien values('K560038',N'Nguyễn Thị',N'Hằng','01927263721',N' Nữ','19970303',N'Yên Phong-Bắc Ninh','DTTT2');
insert into sinhvien values('K560039',N'Chu Thị',N'Trang','01928766271',N' Nữ','19971205',N'Nam Sách-Hải Dương','DTTT2');
insert into sinhvien values('K560040',N'Hà Bích',N'Thúy','01938182912',N'Nữ','19970316',N'Đầm Hà-Quảng Ninh','DTTT2');
insert into sinhvien values ('K560041',N'Bùi Thành',N'Trung','0986906458',N'Nam','19970802',N'Đống Đa – Hà Nội','DTTT2');
insert into sinhvien values ('K560042',N'Nguyễn Thị',N'Trang','01235859802',N'Nữ','19970902',N'Ba Đình – Hà Nội','DTTT2');
insert into sinhvien values ('K560043',N'Hồ Hồng',N'Hoa','01238463457',N'Nữ','19971002',N'Cầu Giấy – Hà Nội','DTTT2');
insert into sinhvien values ('K560044',N'Nguyễn Van',N'Be','01666762901',N'Nam','19970910',N'Đống Đa – Hà Nội','DDT1');
insert into sinhvien values ('K560045',N'Nguyễn Thị',N'Mơ','01664352307',N'Nữ','19970701',N'Thanh Xuân – Hà Nội','DDT1');
insert into sinhvien values ('K560046',N'Nguyễn Đức',N'Bình','0958679032',N'Nam','19971003',N'Đống Đa – Hà Nội','DDT1');
insert into sinhvien values ('K560047',N'Nguyễn Đức',N'Anh','01235467689',N'Nam','19970210',N'Sơn Tây – Hà Nội','DDT1');
insert into sinhvien values ('K560048',N'Nguyễn Chí',N'Danh','01667891234',N'Nam','19971007',N'Tây Hồ - Hà Nội','DDT1');
insert into sinhvien values ('K560049',N'Trần Thị',N'Hằng','0934567124',N'Nữ','19971001',N'Thanh Xuân – Hà Nội','TDH1');
insert into sinhvien values ('K560050',N'Nguyễn Thị',N'Hà','0965123235',N'Nữ','19971102',N'Văn Giang – Hưng Yên','TDH1');
insert into sinhvien values ('K560051',N'Nguyễn Đức',N'An','01231234523',N'Nam','19971203',N'Ba Vì – Hà Nội','TDH1');
insert into sinhvien values ('K560052',N'Nguyễn Thị',N'Bé','01234351245',N'Nữ','19970602',N'Văn Lâm – Hưng Yên','TDH1');
insert into sinhvien values ('K560053',N'Nguyễn Xuân',N'Vui','0965234561',N'Nữ','19970109',N'Đông Hưng – Thái Bình','TDH1');
insert into sinhvien values ('K560054',N'Nguyễn Văn',N'Đức','01231232346',N'Nam','19970909',N'Kiến Xương – Thái Bình','TDH1');
insert into sinhvien values ('K560055',N'Nguyễn Thị',N'Nhung','01232221234',N'Nữ','19970201',N'Quảng Xương – Thanh Hóa','TDH1');
insert into sinhvien values ('K560056',N'Phạm Đức',N'Anh','0965607678',N'Nam','19970305',N'Hương Sơn – Hà Tĩnh','TDH2');
insert into sinhvien values ('K560057',N'Hoàng Văn',N'Lâm','01234655554',N'Nam','19971202',N'Kỳ Anh – Hà Tĩnh','TDH2');
insert into sinhvien values ('K560058',N'Hoàng Đức',N'Phong','0965234564',N'Nam','19971104',N'Sơn Tây – Hà Nội','TDH2');
insert into sinhvien values ('K560059',N'Đỗ Văn',N'Hiếu','01234442345',N'Nam','19971206',N'Đông Anh – Hà Nội','TDH2');
insert into sinhvien values ('K560060',N'Lưu Thị',N'Hoa','01663564501',N'Nữ','19970104',N'Đông Sơn – Thanh Hóa','TDH2');
insert into sinhvien values ('K560061',N'Lưu Thị',N'Loan','01663564201',N'Nữ','19970314',N'Đông Sơn – Thanh Hóa','CNTT1');
insert into sinhvien values ('K560062',N'Đỗ Thị',N'Hoa','01663564504',N'Nữ','19970204',N'Quế Võ - Bắc Ninh','CNTT1');
insert into sinhvien values ('K560063',N'Nguyễn Thị',N'Thơm','01661264501',N'Nữ','19970124',N'Gia Lâm - Hà Nội','CNTT1');
insert into sinhvien values ('K560064',N'Lưu Ngọc',N'Ánh','01612564501',N'Nữ','19970504',N'Hiệp Hòa - Bắc Giang','CNTT1');
insert into sinhvien values ('K560065',N'Lưu Văn',N'Long','016654564501',N'Nam','19960104',N'Việt Yên - Bắc Giang','CNTT1');
insert into sinhvien values ('K560066',N'Đoàn Chí',N'Hưng','01623564501',N'Nam','19930104',N'Văn Giang - Hưng Yên','CNTT1');
insert into sinhvien values ('K560067',N'Trương Vô',N'Kỵ','01654564501',N'Nam','19920104',N'Quỳnh Lưu - Nghệ An','CNTT2');
insert into sinhvien values ('K560068',N'Hồng Thất',N'Công','01663523501',N'Nam','19970304',N'Từ Sơn - Bắc Ninh','CNTT2');
insert into sinhvien values ('K560069',N'Hoàng Thị',N'Dung','01613564501',N'Nữ','19970114',N'Từ Sơn - Bắc Ninh','CNTT2');
insert into sinhvien values ('K560070',N'Nhạc Linh',N'San','0963564501',N'Nữ','19971204',N'Thắng - Bắc Giang','CNTT2');
insert into sinhvien values ('K560071',N'Lệnh Hồ',N'Xung','01663564591',N'Nam','19940104',N'Đông Sơn – Thanh Hóa','CNTT2');
insert into sinhvien values ('K560072',N'Bạch Doanh',N'Doanh','01669964501',N'Nữ','19971212',N'Đông Sơn – Thanh Hóa','CNTT2');
insert into sinhvien values ('K560073',N'Dương Quốc',N'Tuân','01699564501',N'Nam','19971214',N'Đông Sơn – Thanh Hóa','CNTT3');
insert into sinhvien values ('K560074',N'Vương Anh',N'Tú','01663888501',N'Nam','19970512',N'Long Biên - Hà Nội','CNTT3');
insert into sinhvien values ('K560075',N'Hồ Quang',N'Hiếu','01699964501',N'Nam','19970104',N'Quảng Xương – Thanh Hóa','CNTT3');
insert into sinhvien values ('K560086',N'Nguyễn Ngọc',N'Trinh','01669999501',N'Nữ','19970104',N'Hoằng Hóa – Thanh Hóa','CNTT3');
insert into sinhvien values ('K560077',N'Tạ Xuân',N'Thăng','01663224501',N'Nam','19970104',N'Yên Phong - Bắc Ninh','CNTT3');
insert into sinhvien values ('K560078',N'Phan Mạnh',N'Quỳnh','0963564591',N'Nam','19970201',N'Cầu Giấy - Hà Nội','KTXD1');
insert into sinhvien values ('K560079',N'Hoàng Thị',N'Loan','01612314501',N'Nữ','19970104',N'Đông Sơn – Thanh Hóa','KTXD1');
insert into sinhvien values ('K560080',N'Lưu Thị',N'Hồng','01663123501',N'Nữ','19970104',N'Ba Đình - Hà Nội','KTVT1');
insert into sinhvien values ('K560081',N'Lưu Thị',N'Nhung','01663564502',N'Nữ','19970305',N'Lý Sơn - Quảng Ngãi','KTVT1');
insert into sinhvien values ('K560082',N'Lưu Thị',N'Liên','01663564503',N'Nữ','19970204',N'Lý Sơn - Quảng Ngãi','KTVT1');

insert into HINHPHAT values('HP000',0.0,'Trả đúng hạn, không bị phạt');
insert into HINHPHAT values('HP001',0.05,'Rách, nát sách, viết vào sách.');
insert into HINHPHAT values('HP002',0.1,'Trả muộn từ 1-3 ngày');
insert into HINHPHAT values('HP003',0.2,'Trả muộn từ 4-7 ngày.');
insert into HINHPHAT values('HP004',0.5,'Trả muộn từ 8-15 ngày.');
insert into HINHPHAT values('HP005',1.0,'Trả muộn từ 16-30 ngày.');
insert into HINHPHAT values('HP006',2.0,'Mất, trả muộn từ 31 ngày coi như mất.');

insert into MUON_TRA values ('KT0001','K560001','HP000','20160101',null,'20160301','');
insert into MUON_TRA values ('KT0001','K560005','HP000','20160101',null,'20160301','');
insert into MUON_TRA values ('KT0001','K560006','HP000','20160101',null,'20160301','');
insert into MUON_TRA values ('KT0002','K560001','HP000','20160101','20160212','20160301','');
insert into MUON_TRA values ('KT0001','K560002','HP000','20160103','20160203','20160303','');
insert into MUON_TRA values ('KT0004','K560012','HP002','20160104','20160306','20160304',N'Trả muộn 2 ngày');
insert into MUON_TRA values ('KT0003','K560012','HP000','20160106','20160306','20160306','');
insert into MUON_TRA values ('KT0001','K560001','HP000','20160501',null,'20160601','');
insert into MUON_TRA values ('KT0001','K560023','HP000','20160101',null,'20160201',''); 
insert into MUON_TRA values ('TI0001','K560003','HP006','20160908','20170102','20161212',N'Mất sách');
insert into MUON_TRA values ('TI0002','K560023','HP006','20160104','20160712','20160304',N'Quá muộn');
insert into MUON_TRA values ('TI0003','K560022','HP001','20160505','20160509','20160909',N'Rách sách');
insert into MUON_TRA values ('TI0006','K560055','HP003','20160101','20160912','20160906',N'Muộn');
insert into MUON_TRA values ('TI0009','K560065','HP005','20161010','20170423','20160401',N'Muộn');
insert into MUON_TRA values ('KT0001','K560049','HP005','20160910','20170120','20160101',N'Muộn');
insert into MUON_TRA values ('TI0009','K560065','HP005','20160522','20170429','20160409',N'Muộn');
insert into MUON_TRA values ('LD0001','K560003','HP006','20160202','20160303','20161010',N'Mất sách');
insert into MUON_TRA values ('TN0001','K560003','HP006','20160122','20160920','20160609',N'Mất sách');
insert into MUON_TRA values ('TN0002','K560003','HP006','20161001','20170112','20161210',N'Mất sách');

insert into MUON_TRA values ('VA0003','K560080','HP000','20160404','20160505','20160606','');
insert into MUON_TRA values ('KT0001','K560077','HP000','20161001','20161112','20161223','');
insert into MUON_TRA values ('VH0001','K560056','HP000','20160420','20160611','20160901','');
insert into MUON_TRA values ('VH0002','K560032','HP000','20160111','20160709','20160921','');
insert into MUON_TRA values ('TN0006','K560011','HP000','20160201',null,'20160605','');
insert into MUON_TRA values ('TN0003','K560009','HP000','20160213','20160612','20160915','');
insert into MUON_TRA values ('TN0005','K560022','HP000','20160712','20160812','20160912','');
insert into MUON_TRA values ('TI0009','K560043','HP000','20160901',null,'20161103','');

insert into MUON_TRA values ('TI0001','K560070','HP001','20160103','20160206','20160210',N'Rách sách');
insert into MUON_TRA values ('TI0002','K560071','HP001','20160103','20160206','20160210',N'Viết vào sách');
insert into MUON_TRA values ('TI0003','K560072','HP001','20160107','20160309','20160315',N'Rách sách');
insert into MUON_TRA values ('TI0004','K560073','HP003','20160105','20160310','20160306',N'Trả muộn 4 ngày');
insert into MUON_TRA values ('TI0005','K560074','HP003','20160505','20160310','20160305',N'Trả muộn 5 ngày');
insert into MUON_TRA values ('TI0006','K560075','HP003','20160104','20160410','20160404',N'Trả muộn 6 ngày');
insert into MUON_TRA values ('TI0008','K560077','HP004','20160110','20160320','20160312',N'Trả muộn 8 ngày');
insert into MUON_TRA values ('TI0009','K560078','HP004','20160125','20160310','20160301',N'Trả muộn 9 ngày');
insert into MUON_TRA values ('TI0001','K560079','HP004','20160105','20160320','20160310',N'Trả muộn 10 ngày');
insert into MUON_TRA values ('TI0001','K560080','HP004','20160215','20160525','20160515',N'Trả muộn 10 ngày');
insert into MUON_TRA values ('TI0001','K560081','HP004','20160220','20160521','20160510',N'Trả muộn 11 ngày');
insert into MUON_TRA values ('TI0001','K560082','HP001','20160320','20160406','20160410',N'Viết vào sách');
insert into MUON_TRA values ('TI0001','K560060','HP001','20160110','20160310','20160325',N'Viết vào sách');
insert into MUON_TRA values ('TI0001','K560063','HP006','20160113','20160320','20160525',N'Mất sách');
insert into MUON_TRA values ('VA0001','K560064','HP006','20160110','20160310','20160610',N'Mất sách');
insert into MUON_TRA values ('VA0002','K560065','HP005','20160215','20160330','20160310',N'Trả muộn 20 ngày');
insert into MUON_TRA values ('VA0003','K560066','HP005','20160115','20160521','20160501',N'Trả muộn 20 ngày');
insert into MUON_TRA values ('VA0004','K560067','HP002','20160120','20160310','20160307',N'Trả muộn 3 ngày');
insert into MUON_TRA values ('VA0005','K560068','HP002','20160104','20160307','20160306',N'Trả muộn 1 ngày');
insert into MUON_TRA values ('VA0006','K560069','HP002','20160113','20160524','20160522',N'Trả muộn 2 ngày');
insert into MUON_TRA values ('VA0007','K560050','HP002','20160320','20160406','20160403',N'Trả muộn 3 ngày');
insert into MUON_TRA values ('VA0008','K560051','HP002','20160131','20160310','20160308',N'Trả muộn 2 ngày');


/*1. in ra những sinh viên nam K56*/
SELECT * from sinhvien
where masv like 'K56%' and GIOITINH = 'Nam';

/*2. in ra những sinh viên	có năm sinh từ 1990-1996*/
select * from sinhvien
where year(ngaysinh) between 1990 and 1996;	

/*3. liệt kê danh sách sinh viên theo thứ tự tăng dần của tên*/
select * from sinhvien
order by ten;

/*4. cho biết số sinh viên nữ của mỗi khoa*/
select khoa.MAKHOA,khoa.TENKHOA, count(masv) as slsvnu
from((sinhvien join lop on lop.malop = sinhvien.malop) join khoa on lop.makhoa = khoa.makhoa)
where gioitinh = N'Nữ'
group by khoa.makhoa, khoa.tenkhoa;

/*5. cho biết khoa nào có nhiều sinh viên nhất*/
select khoa.makhoa,khoa.tenkhoa,count(masv) as slsv
from((sinhvien join lop on lop.malop = sinhvien.malop) join khoa on lop.makhoa = khoa.makhoa)
group by khoa.makhoa, khoa.tenkhoa
having count(masv) >= ALL(select count(masv) from((sinhvien join lop on lop.malop = sinhvien.malop) join khoa on lop.makhoa = khoa.makhoa)
group by khoa.makhoa, khoa.tenkhoa);

/*6. danh sách xử phạt sinhvien*/



/*7. danh sách sinh viên không mượn sách*/
select * from SINHVIEN
where MASV not in (
	select masv from MUON_TRA
)order by ten;

/*8. Cho biết số lượng sách mượn của mỗi sinh vien*/
select sinhvien.MASV,hodem,ten,malop, count(*) as slsach from sinhvien
join MUON_TRA on sinhvien.MASV = MUON_TRA.MASV
where sinhvien.MASV = MUON_TRA.MASV
group by sinhvien.MASV, hodem, ten, malop
order by slsach;

/*9. đưa ra thông tin cho biết sách chưa từng được mượn*/
Select MASACH, TENSACH, GIATIEN, LANTAIBAN
From sach
Where masach Not in( Select masach from MUON_TRA)

/*10. Đưa ra thông tin sách có lần tái bản >3*/
Select MASACH, TENSACH, GIATIEN, LANTAIBAN
From sach
Where (lantaiban>3)

/*11. đưa ra thông tin sách mượn trong ngày 20160505 */
Select   sach.MASACH,TENSACH, GIATIEN, LANTAIBAN
From SACH, MUON_TRA
Where (  ngaymuon = '20160505' and (SACH.masach=MUON_TRA.masach))

/*12. Thông tin sách đang cho mượn*/
select sinhvien.MASV, sinhvien.HODEM, sinhvien.TEN, sach.TENSACH, MUON_TRA.NGAYMUON, MUON_TRA.HANTRA
from sinhvien join MUON_TRA on sinhvien.MASV = MUON_TRA.MASV
join sach on MUON_TRA.MASACH = sach.MASACH
where NGAYTRA is null;

/*13. Số lượng sách còn trong thư viện*/
select sach.MASACH, sach.TENSACH, sach.SOLUONG-count(MUON_TRA.MASACH) as sls
from sinhvien join MUON_TRA on sinhvien.MASV = MUON_TRA.MASV
join sach on MUON_TRA.MASACH = sach.MASACH
where MUON_TRA.NGAYTRA is null
group by sach.MASACH, sach.TENSACH, sach.SOLUONG;

/*14. In ra sách của tác giả Phạm Văn Ất.*/
select sach.MASACH, sach.TENSACH, sach.GIATIEN
from sach join viet on sach.MASACH = viet.MASACH
join tacgia on tacgia.MATG = viet.matg
where TENTG = N'Phạm Văn Ất';

/*15. Đưa ra thông tin tác giả của sách abc*/
select tacgia.TENTG
from sach join viet on sach.MASACH = viet.MASACH
join tacgia on tacgia.MATG = viet.matg
where TENSACH = N'C++ & Lập trình hướng đối tượng';

/*Câu 1*/

select sinhvien.masv,  sinhvien.HODEM,sinhvien.TEN, count(muon_tra.MASV) as sls
from sinhvien join MUON_TRA on sinhvien.MASV = MUON_TRA.masv
group by sinhvien.masv, sinhvien.HODEM, sinhvien.TEN
having count(MUON_TRA.MASV) >=All (select count(*) from sinhvien
join MUON_TRA on sinhvien.MASV = MUON_TRA.MASV
where sinhvien.MASV = MUON_TRA.MASV
group by sinhvien.MASV, hodem, ten, malop
)

/*Câu 2*/

SELECT YEAR(NGAYMUON) AS N'Năm',MONTH(NgayMuon) AS N'Tháng',s.TenSach
FROM MUON_TRA JOIN SACH as s
ON MUON_TRA.MASACH = S.MASACH
GROUP BY YEAR(NGAYMUON),MONTH(NgayMuon),s.MASACH,S.TENSACH
HAVING COUNT(MUON_TRA.MaSach)>=ALL(
SELECT COUNT(MUON_TRA.MASACH)
FROM MUON_TRA JOIN SACH
ON MUON_TRA.MASACH = Sach.MASACH
where Sach.MASACH = s.MASACH
GROUP BY YEAR(NGAYMUON),MONTH(NgayMuon),sach.MASACH
)