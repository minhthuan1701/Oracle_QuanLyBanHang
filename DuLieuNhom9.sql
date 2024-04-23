CREATE TABLE NhanVien(
	MaNV varchar2(10) NOT NULL,
	HoTen nvarchar2(100) NOT NULL,
	NgaySinh date NOT NULL,
	GioiTinh varchar2(10) NOT NULL,
	SDT varchar2(10) NOT NULL,
	Email varchar2(100) NOT NULL,
	DiaChi nvarchar2(255) NOT NULL,
	Hinh varchar2(50) NOT NULL,
	CONSTRAINT PK_NhanVien PRIMARY KEY (MaNV)
)
CREATE TABLE KhachHang (
	STT int  NOT NULL,
	SDT varchar2(10) NOT NULL,
	TenKH nvarchar2(100) NOT NULL,
	Email varchar2(100) NOT NULL,
	CONSTRAINT PK_KhachHang PRIMARY KEY (SDT)
)
CREATE TABLE Ban (
	MaBan varchar2(2) NOT NULL,
	SDT varchar2(10) NOT NULL,
	MaNV varchar2(10) NOT NULL,
	SoBan varchar2(2) NOT NULL,
	GioDat date NOT NULL,
	SoLuong int NOT NULL,
	NguoiLon int NOT NULL,
	TreEm int NOT NULL,
	CONSTRAINT PK_Ban PRIMARY KEY (MaBan)
)
CREATE TABLE MonThem (
	MaMT varchar2(10) NOT NULL,
	TenMT nvarchar2(100) NOT NULL,
	Gia int NOT NULL,
	CONSTRAINT PK_MonThem PRIMARY KEY (MaMT)
)
CREATE TABLE MonDaThem (
	MaMDT int  NOT NULL,
	MaBan varchar2(2) NOT NULL,
	MaMT varchar2(10) NOT NULL,
	SoLuong int NOT NULL,
	CONSTRAINT PK_MonDaThem PRIMARY KEY (MaMDT)
)
CREATE TABLE HoaDon (
	MaHD int  NOT NULL,
	MaNV varchar2(10) NOT NULL,
	SoBan varchar2(2) NOT NULL,
	GioVao date NOT NULL,
	NgayXuat date NOT NULL,
	NguoiLon int NOT NULL,
	TreEm int NOT NULL,
	TongVe int NOT NULL,
	TongTien float NOT NULL,
	SDT varchar2(10) NOT NULL,
	CONSTRAINT PK_HonDon PRIMARY KEY  (MaHD)
)
CREATE TABLE Ve (
	MaVe varchar2(10) NOT NULL,
	LoaiVe nvarchar2(30) NOT NULL,
	Gia int NOT NULL,
	CONSTRAINT PK_Ve PRIMARY KEY (MaVe)
)
CREATE TABLE NguyenLieu (
	MaNL varchar2(10) NOT NULL,
	TenNL nvarchar2(100) NOT NULL,
	SoLuong int NOT NULL,
	DVT nvarchar2(100) NOT NULL,
	HSD date NOT NULL,
	MaDT varchar2(10) NOT NULL,
	CONSTRAINT PK_Kho PRIMARY KEY (MaNL)
)
CREATE TABLE DoiTac (
	MaDT varchar2(10) NOT NULL,
	TenDT nvarchar2(100) NOT NULL,
	SDT varchar2(11) NOT NULL,
	Email varchar2(100) NOT NULL,
	DiaChi nvarchar2(255) NOT NULL,
	CONSTRAINT PK_DoiTac PRIMARY KEY (MaDT)
)
CREATE TABLE Kho (
	MaXN int  NOT NULL,
	NgayXN date NOT NULL,
	SoLuong int NOT NULL,
	TrangThai nvarchar2(10) NOT NULL,
	TiGia int NOT NULL,
	TongGia int,
	MaNL varchar2(10) NOT NULL,
	MaNV varchar2(10) NOT NULL,
	CONSTRAINT PK_NhapKho PRIMARY KEY (MaXN)
)
CREATE TABLE NguoiDung (
	TaiKhoan varchar2(10) NOT NULL,
	MatKhau varchar2(50) NOT NULL,
	HoTen nvarchar2(100) NOT NULL,
	VaiTro number(3) NOT NULL,
	CONSTRAINT PK_NguoiDung PRIMARY KEY (TaiKhoan)
)

--
alter session set nls_date_format='DD-MM-YYYY HH24:Mi:SS';
--alter session set nls_date_format='HH24:Mi:SS'; chỉ hiện giờ
select*from HoaDon;
-- Thêm Nhân viên
INSERT INTO NhanVien (MaNV,HoTen,NgaySinh,GioiTinh,SDT,Email,DiaChi,Hinh) VALUES ('NHDuy',N'Nguyễn Hoàng Duy',TO_DATE('31/01/1997','DD/MM/YYYY'),'Nam','0919993715','duynh@gmail.com',N'Bình Thuận','NoImage.png');
INSERT INTO NhanVien (MaNV,HoTen,NgaySinh,GioiTinh,SDT,Email,DiaChi,Hinh) VALUES ('DHPhi',N'Dương Huy Phi',To_DATE('01/01/2003','DD/MM/YYYY'),'Nam','0868605927','phidh@gmail.com',N'Đồng Nai','NoImage.png');
INSERT INTO NhanVien (MaNV,HoTen,NgaySinh,GioiTinh,SDT,Email,DiaChi,Hinh) VALUES ('NDDuy',N'Nguyễn Đức Duy',TO_DATE('02/02/2003','DD/MM/YYYY'),'Nam','0368398962','duynd@gmail.com',N'Tây Ninh','NoImage.png');
INSERT INTO NhanVien (MaNV,HoTen,NgaySinh,GioiTinh,SDT,Email,DiaChi,Hinh) VALUES ('NDDLoi',N'Nguyễn Đào Danh Lợi',TO_Date('03/03/2003','DD/MM/YYYY'),'Nam','0799868232','loindd@gmail.com',N'Tây Ninh','NoImage.png');
INSERT INTO NhanVien (MaNV,HoTen,NgaySinh,GioiTinh,SDT,Email,DiaChi,Hinh) VALUES ('NHLinh',N'Ngô Hồng Linh',To_DATE('04/04/2003','DD/MM/YYYY'),'Nam','0911640321','linhnh@gmail.com',N'Lâm �?ồng','NoImage.png');
INSERT INTO NhanVien (MaNV,HoTen,NgaySinh,GioiTinh,SDT,Email,DiaChi,Hinh) VALUES ('LTNhi',N'Lê Thị Nhi',To_DATE('05/05/2002','DD/MM/YYYY'),N'Nữ','0361237894','nhilta@gmail.com',N'Hồ Chí Minh','NoImage.png');
INSERT INTO NhanVien (MaNV,HoTen,NgaySinh,GioiTinh,SDT,Email,DiaChi,Hinh) VALUES ('MTTran',N'Mai Tố Trân',To_DATE('06/06/2001','DD/MM/YYYY'),N'Nữ','0921472583','tranmt@gmail.com',N'Quảng Ngãi','NoImage.png');
INSERT INTO NhanVien (MaNV,HoTen,NgaySinh,GioiTinh,SDT,Email,DiaChi,Hinh) VALUES ('TBNgoc',N'Trần Bảo Ngọc',To_Date('07/07/2004','DD/MM/YYYY'),N'Nữ','0772583697','ngoctb@gmail.com',N'Vũng Tàu','NoImage.png');
INSERT INTO NhanVien (MaNV,HoTen,NgaySinh,GioiTinh,SDT,Email,DiaChi,Hinh) VALUES ('NQTuan',N'Nguyễn Quốc Tuấn',To_Date('07/07/2000','DD/MM/YYYY'),N'Nữ','0563571595','tuannq@gmail.com',N'Hồ Chí Minh','NoImage.png');
INSERT INTO NhanVien (MaNV,HoTen,NgaySinh,GioiTinh,SDT,Email,DiaChi,Hinh) VALUES ('NMQuang',N'Nguyễn Minh Quang',To_Date('08/07/2001','DD/MM/YYYY'),N'Nam','0563612594','quang@gmail.com',N'Hồ Chí Minh','NoImage.png');
--delete from NhanVien
-- Thêm Khách hàng
INSERT INTO KhachHang(STT,SDT,TenKH,Email) VALUES (1,'0451345488',N'Trần Tiến Đạt','dat@gmail.com');
INSERT INTO KhachHang(STT,SDT,TenKH,Email) VALUES (2,'0924561347',N'Nguyễn Ngọc Bình','binh@gmail.com');
INSERT INTO KhachHang(STT,SDT,TenKH,Email) VALUES (3,'0984564823',N'Đỗ Thị Lan Hương','huong@gmail.com');
INSERT INTO KhachHang(STT,SDT,TenKH,Email) VALUES (4,'0341258564',N'Lê Thị Chi','chi@gmail.com');
INSERT INTO KhachHang(STT,SDT,TenKH,Email) VALUES (5,'0523456851',N'Thạch Nhật Tiến','tien@gmail.com');
INSERT INTO KhachHang(STT,SDT,TenKH,Email) VALUES (6,'0615267854',N'Trần Ngọc Toàn','toan@gmail.com');
INSERT INTO KhachHang(STT,SDT,TenKH,Email) VALUES (7,'0363456789',N'Lê Tấn Hoàng','hoang@gmail.com');
INSERT INTO KhachHang(STT,SDT,TenKH,Email) VALUES (8,'0913456799',N'Đặng Lê Anh','anh@gmail.com');
INSERT INTO KhachHang(STT,SDT,TenKH,Email) VALUES (9,'0333456779',N'Bùi Quốc Huy','huy@gmail.com');
INSERT INTO KhachHang(STT,SDT,TenKH,Email) VALUES (10,'0923456778',N'Trần Thị Thu','thu@gmail.com');
-- Thêm Vé
INSERT INTO Ve (MaVe,LoaiVe,Gia) VALUES ('1',N'Người lớn',300000);
INSERT INTO Ve (MaVe,LoaiVe,Gia) VALUES ('2',N'Trẻ em',150000);

--delete from Ve
-- Thêm Bàn
--INSERT INTO Ban(MaBan,SDT,SoBan,GioDat,SoLuong,NguoiLon,TreEm,MaNV) VALUES ('01','0363456789','01',To_DATE('12:30','hh:mi:ss'),8,5,3,'NHDuy');
INSERT INTO Ban(MaBan,SDT,SoBan,GioDat,SoLuong,NguoiLon,TreEm,MaNV) 
VALUES ('01','0363456789','01',TO_DATE('2022/05/15 8:30:25', 'YYYY/MM/DD HH:MI:SS'),8,5,3,'NHDuy');
INSERT INTO Ban(MaBan,SDT,SoBan,GioDat,SoLuong,NguoiLon,TreEm,MaNV) 
VALUES ('02','0913456799','02',TO_DATE('2022/10/15 10:30:25', 'YYYY/MM/DD HH:MI:SS'),4,3,1,'DHPhi');
INSERT INTO Ban(MaBan,SDT,SoBan,GioDat,SoLuong,NguoiLon,TreEm,MaNV) 
VALUES ('03','0333456779','03',TO_DATE('2022/05/15 7:10:00', 'YYYY/MM/DD HH:MI:SS'),2,2,0,'NDDLoi');
INSERT INTO Ban(MaBan,SDT,SoBan,GioDat,SoLuong,NguoiLon,TreEm,MaNV) 
VALUES ('04','0923456778','04',TO_DATE('2022/05/15 11:40:45', 'YYYY/MM/DD HH:MI:SS'),5,2,3,'NHLinh');

INSERT INTO Ban(MaBan,SDT,SoBan,GioDat,SoLuong,NguoiLon,TreEm,MaNV) 
VALUES ('05','0523456851','05',TO_DATE('2022/05/20 8:30:25', 'YYYY/MM/DD HH:MI:SS'),5,5,0,'NHLinh');
INSERT INTO Ban(MaBan,SDT,SoBan,GioDat,SoLuong,NguoiLon,TreEm,MaNV) 
VALUES ('06','0615267854','06',TO_DATE('2022/10/13 10:30:25', 'YYYY/MM/DD HH:MI:SS'),4,4,0,'LTNhi');
INSERT INTO Ban(MaBan,SDT,SoBan,GioDat,SoLuong,NguoiLon,TreEm,MaNV) 
VALUES ('07','0363456789','07',TO_DATE('2022/06/15 7:10:00', 'YYYY/MM/DD HH:MI:SS'),2,2,0,'MTTran');
INSERT INTO Ban(MaBan,SDT,SoBan,GioDat,SoLuong,NguoiLon,TreEm,MaNV) 
VALUES ('08','0913456799','08',TO_DATE('2022/08/05 11:40:45', 'YYYY/MM/DD HH:MI:SS'),5,2,3,'TBNgoc');
INSERT INTO Ban(MaBan,SDT,SoBan,GioDat,SoLuong,NguoiLon,TreEm,MaNV) 
VALUES ('09','0333456779','09',TO_DATE('2022/09/6 8:30:25', 'YYYY/MM/DD HH:MI:SS'),6,5,1,'NHDuy');
INSERT INTO Ban(MaBan,SDT,SoBan,GioDat,SoLuong,NguoiLon,TreEm,MaNV) 
VALUES ('10','0923456778','10',TO_DATE('2022/10/11 10:30:25', 'YYYY/MM/DD HH:MI:SS'),4,2,2,'DHPhi');

-- Thêm Món thêm
INSERT INTO MonThem(MaMT,TenMT,Gia) VALUES ('M01',N'Bún',5000);
INSERT INTO MonThem(MaMT,TenMT,Gia) VALUES ('M02',N'Nước ngọt',15000);
INSERT INTO MonThem(MaMT,TenMT,Gia) VALUES ('M03',N'Bia',15000);
INSERT INTO MonThem(MaMT,TenMT,Gia) VALUES ('M04',N'Khăn ướt',3000);
INSERT INTO MonThem(MaMT,TenMT,Gia) VALUES ('M05',N'Thịt',30000);
INSERT INTO MonThem(MaMT,TenMT,Gia) VALUES ('M06',N'Tôm',40000);
INSERT INTO MonThem(MaMT,TenMT,Gia) VALUES ('M07',N'Cá',30000);
INSERT INTO MonThem(MaMT,TenMT,Gia) VALUES ('M08',N'Nước lẫu',10000);
INSERT INTO MonThem(MaMT,TenMT,Gia) VALUES ('M09',N'Mực',35000);
INSERT INTO MonThem(MaMT,TenMT,Gia) VALUES ('M10',N'Mì',5000);
--delete from MonThem
-- Thêm Món đã thêm
--SET IDENTITY_INSERT MonDaThem ON
INSERT INTO MonDaThem(MaMDT,MaBan,MaMT,SoLuong) VALUES (1,'01','M01',2);
INSERT INTO MonDaThem(MaMDT,MaBan,MaMT,SoLuong) VALUES (2,'01','M02',5);
INSERT INTO MonDaThem(MaMDT,MaBan,MaMT,SoLuong) VALUES (3,'02','M02',3);
INSERT INTO MonDaThem(MaMDT,MaBan,MaMT,SoLuong) VALUES (4,'02','M03',4);
INSERT INTO MonDaThem(MaMDT,MaBan,MaMT,SoLuong) VALUES (5,'02','M04',2);

INSERT INTO MonDaThem(MaMDT,MaBan,MaMT,SoLuong) VALUES (6,'05','M10',4);
INSERT INTO MonDaThem(MaMDT,MaBan,MaMT,SoLuong) VALUES (7,'06','M09',2);
INSERT INTO MonDaThem(MaMDT,MaBan,MaMT,SoLuong) VALUES (8,'06','M06',3);
INSERT INTO MonDaThem(MaMDT,MaBan,MaMT,SoLuong) VALUES (9,'08','M03',4);
INSERT INTO MonDaThem(MaMDT,MaBan,MaMT,SoLuong) VALUES (10,'08','M04',2);
--delete from MonDaThem
--SET IDENTITY_INSERT MonDaThem OFF

-- Thêm Hoá đơn
--SET IDENTITY_INSERT HoaDon ON
INSERT INTO HoaDon (MaHD,MaNV,SoBan,GioVao,NgayXuat,NguoiLon,TreEm,TongVe,TongTien,SDT) 
VALUES (1,'NHLinh','01',TO_DATE('2022/05/15 8:30:25', 'YYYY/MM/DD HH:MI:SS'),TO_DATE('2022/05/15 10:30:25', 'YYYY/MM/DD HH:MI:SS'),5,3,8,2035000,N'0451345488');
INSERT INTO HoaDon (MaHD,MaNV,SoBan,GioVao,NgayXuat,NguoiLon,TreEm,TongVe,TongTien,SDT) 
VALUES (2,'NHDuy','04',TO_DATE('2022/05/15 11:40:45', 'YYYY/MM/DD HH:MI:SS'),TO_DATE('2022/05/15 13:40:45', 'YYYY/MM/DD HH:MI:SS'),2,3,5,1050000,N'0363456789');
INSERT INTO HoaDon (MaHD,MaNV,SoBan,GioVao,NgayXuat,NguoiLon,TreEm,TongVe,TongTien,SDT) 
VALUES (3,'NDDLoi','03',TO_DATE('2022/05/15 7:10:00', 'YYYY/MM/DD HH:MI:SS'),TO_DATE('2022/05/15 9:10:00', 'YYYY/MM/DD HH:MI:SS'),2,0,2,600000,N'0913456799');
INSERT INTO HoaDon (MaHD,MaNV,SoBan,GioVao,NgayXuat,NguoiLon,TreEm,TongVe,TongTien,SDT) 
VALUES (4,'NHLinh','05',TO_DATE('2022/05/20 8:30:25', 'YYYY/MM/DD HH:MI:SS'),TO_DATE('2022/05/20 10:30:25', 'YYYY/MM/DD HH:MI:SS'),5,0,5,1520000,N'0333456779');
INSERT INTO HoaDon (MaHD,MaNV,SoBan,GioVao,NgayXuat,NguoiLon,TreEm,TongVe,TongTien,SDT) 
VALUES (5,'NDDuy','06',TO_DATE('2022/10/13 10:30:25', 'YYYY/MM/DD HH:MI:SS'),TO_DATE('2022/10/13 12:30:25', 'YYYY/MM/DD HH:MI:SS'),4,0,4,1390000,N'0923456778');
INSERT INTO HoaDon (MaHD,MaNV,SoBan,GioVao,NgayXuat,NguoiLon,TreEm,TongVe,TongTien,SDT) 
VALUES (6,'DHPhi','07',TO_DATE('2022/06/15 7:10:00', 'YYYY/MM/DD HH:MI:SS'),TO_DATE('2022/06/15 9:10:00', 'YYYY/MM/DD HH:MI:SS'),2,0,2,600000,N'0924561347');
INSERT INTO HoaDon (MaHD,MaNV,SoBan,GioVao,NgayXuat,NguoiLon,TreEm,TongVe,TongTien,SDT) 
VALUES (7,'NDDLoi','09',TO_DATE('2022/09/6 8:30:25', 'YYYY/MM/DD HH:MI:SS'),TO_DATE('2022/09/6 10:30:25', 'YYYY/MM/DD HH:MI:SS'),5,1,6,1650000,N'0984564823');
INSERT INTO HoaDon (MaHD,MaNV,SoBan,GioVao,NgayXuat,NguoiLon,TreEm,TongVe,TongTien,SDT) 
VALUES (8,'DHPhi','08',TO_DATE('2022/08/05 11:40:45', 'YYYY/MM/DD HH:MI:SS'),TO_DATE('2022/08/05 13:40:45', 'YYYY/MM/DD HH24:MI:SS'),2,3,5,1116000,N'0341258564');
INSERT INTO HoaDon (MaHD,MaNV,SoBan,GioVao,NgayXuat,NguoiLon,TreEm,TongVe,TongTien,SDT) 
VALUES (9,'NDDuy','02',TO_DATE('2022/10/15 10:30:25', 'YYYY/MM/DD HH:MI:SS'),TO_DATE('2022/10/15 12:30:25', 'YYYY/MM/DD HH:MI:SS'),3,1,4,1161000,N'0523456851');
INSERT INTO HoaDon (MaHD,MaNV,SoBan,GioVao,NgayXuat,NguoiLon,TreEm,TongVe,TongTien,SDT) 
VALUES (10,'NDDuy','03',TO_DATE('2022/10/11 10:30:25', 'YYYY/MM/DD HH:MI:SS'),TO_DATE('2022/10/11 11:30:25', 'YYYY/MM/DD HH:MI:SS'),2,2,4,900000,N'0615267854');

INSERT INTO HoaDon (MaHD,MaNV,SoBan,GioVao,NgayXuat,NguoiLon,TreEm,TongVe,TongTien,SDT) 
VALUES (11,'NDDuy','03',TO_DATE('2022/10/13 10:30:25', 'YYYY/MM/DD HH:MI:SS'),TO_DATE('2022/10/13 12:30:25', 'YYYY/MM/DD HH:MI:SS'),2,2,4,900000,N'0615267854');
--SET IDENTITY_INSERT HoaDon OFF
--delete from HoaDon
alter session set nls_date_format='DD-MM-YYYY HH24:Mi:SS';

-- Thêm �?ối tác
INSERT INTO DoiTac (MaDT,TenDT,SDT,Email,DiaChi) VALUES ('DT01',N'Cty VISSAN','0123456789','vissanco@vissan.com.vn',N'Hồ Chí Minh');
INSERT INTO DoiTac (MaDT,TenDT,SDT,Email,DiaChi) VALUES ('DT02',N'Cty Tân Hiệp Phát','0234567891','info@thp.com.vn',N'Bình Dương');
INSERT INTO DoiTac (MaDT,TenDT,SDT,Email,DiaChi) VALUES ('DT03',N'Cty Đảo Hải Sản','0987654321','contact@daohaisan.vn',N'Tân Bình,HCM');
INSERT INTO DoiTac (MaDT,TenDT,SDT,Email,DiaChi) VALUES ('DT04',N'Cty Đà Lạt GAP','0456789123','cs@dalatgapstore.com',N'Đà Lạt');
INSERT INTO DoiTac (MaDT,TenDT,SDT,Email,DiaChi) VALUES ('DT05',N'Cty ANAN FOOD','0147258369','kinhbactofu@gmail.com',N'Thủ Đức,HCM');
INSERT INTO DoiTac (MaDT,TenDT,SDT,Email,DiaChi) VALUES ('DT06',N'Cty Ong Mật','02623817990','info@dakhoney.com',N'Daklak');
INSERT INTO DoiTac (MaDT,TenDT,SDT,Email,DiaChi) VALUES ('DT07',N'Cty PTFISACO','02523812807','concavang.ptfisaco@gmail.com',N'Phan Thiết');
INSERT INTO DoiTac (MaDT,TenDT,SDT,Email,DiaChi) VALUES ('DT08',N'Cty An Hưng Phước','02963935367','ahpfishoil@gmail.com',N'Đồng Tháp');
-- Thêm Nguyên liệu
INSERT INTO NguyenLieu (MaNL,TenNL,HSD,SoLuong,DVT,MaDT) VALUES ('NL1',N'Rau tươi',TO_DATE('2022-10-18','YYYY/MM/DD'),150,N'Kg','DT04');
INSERT INTO NguyenLieu (MaNL,TenNL,HSD,SoLuong,DVT,MaDT) VALUES ('NL2',N'Thịt bò',TO_DATE('2022-05-20','YYYY/MM/DD'),200,N'Kg','DT01');
INSERT INTO NguyenLieu (MaNL,TenNL,HSD,SoLuong,DVT,MaDT) VALUES ('NL3',N'Nước ngọt',TO_DATE('2024-04-10','YYYY/MM/DD'),100,N'Chai','DT02');
INSERT INTO NguyenLieu (MaNL,TenNL,HSD,SoLuong,DVT,MaDT) VALUES ('NL4',N'Bún tươi',TO_DATE('2022-07-25','YYYY/MM/DD'),100,N'Kg','DT05');
INSERT INTO NguyenLieu (MaNL,TenNL,HSD,SoLuong,DVT,MaDT) VALUES ('NL5',N'Tôm sú',TO_DATE('2022-07-25','YYYY/MM/DD'),100,N'Kg','DT03');
INSERT INTO NguyenLieu (MaNL,TenNL,HSD,SoLuong,DVT,MaDT) VALUES ('NL6',N'Hành tây',TO_DATE('2022-12-22','YYYY/MM/DD'),100,N'Kg','DT04');
INSERT INTO NguyenLieu (MaNL,TenNL,HSD,SoLuong,DVT,MaDT) VALUES ('NL7',N'Muối',TO_DATE('2023-07-14','YYYY/MM/DD'),100,N'Kg','DT05');
INSERT INTO NguyenLieu (MaNL,TenNL,HSD,SoLuong,DVT,MaDT) VALUES ('NL8',N'Tổi',TO_DATE('2022-05-17','YYYY/MM/DD'),10,N'Kg','DT05');
INSERT INTO NguyenLieu (MaNL,TenNL,HSD,SoLuong,DVT,MaDT) VALUES ('NL9',N'Mật ong',TO_DATE('2024-02-05','YYYY/MM/DD'),0,N'Lít','DT06');
INSERT INTO NguyenLieu (MaNL,TenNL,HSD,SoLuong,DVT,MaDT) VALUES ('NL10',N'Sốt BBQ',TO_DATE('2022-10-13','YYYY/MM/DD'),100,N'Gói','DT05');
-- Thêm Kho
--SET IDENTITY_INSERT Kho ON
INSERT INTO Kho (MaXN,NgayXN,SoLuong,TrangThai,TiGia,TongGia,MaNL,MaNV) VALUES (1,TO_DATE('2021-10-05','YYYY/MM/DD'),40,N'Nhập',18000,360000,'NL3','NQTuan');
INSERT INTO Kho (MaXN,NgayXN,SoLuong,TrangThai,TiGia,TongGia,MaNL,MaNV) VALUES (2,TO_DATE('2021-10-12','YYYY/MM/DD'),50,N'Nhập',70000,925000,'NL4','NQTuan');
INSERT INTO Kho (MaXN,NgayXN,SoLuong,TrangThai,TiGia,TongGia,MaNL,MaNV) VALUES (3,TO_DATE('2021-11-15','YYYY/MM/DD'),50,N'Xuất',70000,900000,'NL1','NQTuan');
INSERT INTO Kho (MaXN,NgayXN,SoLuong,TrangThai,TiGia,TongGia,MaNL,MaNV) VALUES (4,TO_DATE('2021-12-03','YYYY/MM/DD'),25,N'Xuất',70000,2250000,'NL2','NQTuan');
INSERT INTO Kho (MaXN,NgayXN,SoLuong,TrangThai,TiGia,TongGia,MaNL,MaNV) VALUES (5,TO_DATE('2021-12-03','YYYY/MM/DD'),15,N'Xuất',70000,330000,'NL5','NQTuan');
INSERT INTO Kho (MaXN,NgayXN,SoLuong,TrangThai,TiGia,TongGia,MaNL,MaNV) VALUES (6,TO_DATE('2021-12-03','YYYY/MM/DD'),20,N'Xuất',70000,1400000,'NL10','NQTuan');
INSERT INTO Kho (MaXN,NgayXN,SoLuong,TrangThai,TiGia,TongGia,MaNL,MaNV) VALUES (7,TO_DATE('2021-12-03','YYYY/MM/DD'),7,N'Xuất',70000,175000,'NL8','NQTuan');
INSERT INTO Kho (MaXN,NgayXN,SoLuong,TrangThai,TiGia,TongGia,MaNL,MaNV) VALUES (8,TO_DATE('2021-12-03','YYYY/MM/DD'),10,N'Xuất',70000,580000,'NL7','NQTuan');
--SET IDENTITY_INSERT Kho OFF
-- Thêm Ngư�?i dùng
INSERT INTO NguoiDung (TaiKhoan,MatKhau,HoTen,VaiTro) VALUES ('admin','123456',N'Nguyễn Văn Tèo',1);
INSERT INTO NguoiDung (TaiKhoan,MatKhau,HoTen,VaiTro) VALUES ('staff','123456',N'Bành Thị Nở',0);


-- Khoá phụ bảng Hoá đơn
ALTER TABLE HoaDon ADD CONSTRAINT FK_HoaDon_KhachHang FOREIGN KEY(SDT)
REFERENCES KhachHang(SDT) 
GO
ALTER TABLE HoaDon ADD CONSTRAINT FK_HoaDon_NhanVien FOREIGN KEY(MaNV)
REFERENCES NhanVien(MaNV) 
GO
-- Khóa phụ bảng bàn
ALTER TABLE Ban  ADD CONSTRAINT FK_Ban_KhachHang FOREIGN KEY(SDT)
REFERENCES KhachHang(SDT) 
GO
--Khoá phụ bảng món đã thêm
ALTER TABLE MonDaThem  ADD CONSTRAINT FK_MonDaThem_Ban FOREIGN KEY(MaBan)
REFERENCES Ban(MaBan) 
GO
ALTER TABLE MonDaThem  ADD CONSTRAINT FK_MonDaThem_MonThem FOREIGN KEY(MaMT)
REFERENCES MonThem(MaMT) 
GO
-- Khoá phụ bảng Nguyên liệu
ALTER TABLE NguyenLieu  ADD CONSTRAINT FK_NguyenLieu_DoiTac FOREIGN KEY(MaDT)
REFERENCES DoiTac(MaDT) 
GO
-- Khoá phụ bảng Kho
ALTER TABLE Kho ADD CONSTRAINT FK_Kho_NguyenLieu FOREIGN KEY(MaNL)
REFERENCES NguyenLieu(MaNL)
GO
ALTER TABLE Kho  ADD CONSTRAINT FK_Kho_NhanVien FOREIGN KEY(MaNV)
REFERENCES NhanVien(MaNV) 
GO
--Test loi ORA-02298
SELECT DISTINCT MaDT
FROM NguyenLieu WHERE MaDT NOT IN (
    SELECT MaDT FROM DoiTac)