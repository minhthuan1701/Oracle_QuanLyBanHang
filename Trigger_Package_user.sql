--CÂU 1
---Thủ tục tên nhanvien_hd nhận 1 tham số vào là mã nhân viên, thủ tục sẽ in danh sách hóa đơn nhân viên phục vụ 
create or replace package nhanvien_info
as
    procedure nhanvien_hd (
        n_manv in NHANVIEN.MANV%type);
    function nhanvien_find (
        n_manv in NHANVIEN.MANV%type)
    return boolean;
end nhanvien_info;

create or replace package body nhanvien_info
as
    procedure nhanvien_hd (
        n_manv NHANVIEN.MANV%type)
    is
        tt HOADON%rowtype;
        cursor c1 is select*from HOADON where MANV = n_manv;
    begin
        open c1;
        loop
            fetch c1 into tt;
            if c1%notfound then exit; end if;
            dbms_output.put_line('Mã hóa đơn: '||tt.MAHD||'; Số bàn: '||tt.SOBAN||'; Ngày xuất: '||
            tt.NGAYXUAT||'; Người lớn: '||tt.NGUOILON||'; Trẻ em: '||tt.TREEM||'; Tổng vé: '||tt.TONGVE||
            '; Tổng tiền: '||tt.TONGTIEN||'; Số điện thoại: '||tt.SDT);
        end loop;
        close c1;
        exception when others then dbms_output.put_line('Không tìm thấy hóa đơn nào');
    end nhanvien_hd;
    function nhanvien_find (
        n_manv NHANVIEN.MANV%type)
    return boolean
    is
        sl_find number;
    begin
        select count(*) into sl_find from NHANVIEN where MANV=n_manv;
        return 1=sl_find;
        exception when others then return false;
    end nhanvien_find;
end nhanvien_info;

set serveroutput on;
declare
    n_manv NHANVIEN.MANV%type;
  -- n_manv varchar2(250);
begin
    n_manv := &MANV;
    if nhanvien_info.nhanvien_find(n_manv) then
        nhanvien_info.nhanvien_hd(n_manv);
    else
        dbms_output.put_line('Không tìm thấy hóa đơn nào');
    end if;
end;
--Câu 2
CREATE OR REPLACE PACKAGE nhanvien2_info
AS
PROCEDURE find_sname(
n_manv IN NHANVIEN.MANV%TYPE,
n_hoten OUT NHANVIEN.HOTEN%TYPE);
FUNCTION id_is_good(n_manv IN NHANVIEN.MANV%TYPE)
RETURN BOOLEAN;
END nhanvien2_info;

CREATE OR REPLACE PACKAGE BODY nhanvien2_info
AS
PROCEDURE find_sname
(n_manv IN NHANVIEN.MANV%TYPE,
n_hoten OUT NHANVIEN.HOTEN%TYPE)
IS
v_manv NHANVIEN.MANV%TYPE;
BEGIN
    SELECT HOTEN INTO n_hoten FROM NHANVIEN WHERE MANV = n_manv;
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error in finding manv: '||v_manv);
END find_sname;
FUNCTION id_is_good(n_manv IN NHANVIEN.MANV%TYPE)RETURN BOOLEAN
IS
    v_id_cnt number;
BEGIN
    SELECT COUNT(*) INTO v_id_cnt FROM NHANVIEN WHERE MANV = n_manv;
    RETURN 1 = v_id_cnt;
    EXCEPTION
    WHEN OTHERS THEN
    RETURN FALSE;
    END id_is_good;
END nhanvien2_info;
-- Kiểm thử
SET SERVEROUTPUT ON
DECLARE
n_manv NHANVIEN.MANV%type;
v_hoten  NHANVIEN.HOTEN%TYPE;
BEGIN
IF nhanvien2_info.id_is_good(&n_manv) THEN
nhanvien2_info.find_sname(&n_manv, v_hoten);
DBMS_OUTPUT.PUT_LINE
('Nhân viên '||n_manv||' : '||v_hoten);
ELSE
DBMS_OUTPUT.PUT_LINE ('Nhân viên: '||n_manv||' không có trong database');
END IF;
END;

--Câu 3 nhập mã bàn cho biết nhân viên đảm nhiệm

create or replace package ban_info
as
     procedure nhanvien_ban (
        b_manv in NHANVIEN.MANV%type);
    function nhanvien_ban_find (
        b_manv in NHANVIEN.MANV%type)
    return boolean;
end ban_info;
create or replace package body ban_info
as
   procedure nhanvien_ban (b_manv NHANVIEN.MANV%type) is
        tt BAN%rowtype;
        cursor c1 is select*from BAN where MANV = b_manv;
    begin
        open c1;
        loop
            fetch c1 into tt;
            if c1%notfound then exit; end if;
            dbms_output.put_line('Mã bàn: '||tt.MABAN||'; Số điện thoại: '||tt.SDT||' ;Mã nhân viên: '||tt.MANV
            ||'; Số bàn: '||tt.SOBAN||'; Giờ đặt: '||
            tt.GIODAT||'; Số lượng: '||tt.SOLUONG||'; Người lớn: '||tt.NGUOILON||'; Trẻ em: '||tt.TREEM);
        end loop;
        close c1;
        exception when others then dbms_output.put_line('Không tìm thấy hóa đơn nào');
    end nhanvien_ban;
    function nhanvien_ban_find (b_manv NHANVIEN.MANV%type)
    return boolean is
        sl_find number;
    begin
        select count(*) into sl_find from NHANVIEN where MANV=b_manv;
        return 1=sl_find;
        exception when others then return false;
    end nhanvien_ban_find;
end ban_info;
--Kiểm thử
set serveroutput on;
declare
    b_manv NHANVIEN.MANV%type;
  -- n_manv varchar2(250);
begin
    b_manv := &MANV;
    if ban_info.nhanvien_ban_find(b_manv) then
        ban_info.nhanvien_ban(b_manv);
    else
        dbms_output.put_line('Không tìm thấy hóa đơn nào');
    end if;
end;

--cau 4
--thủ tục  mon_hoadon , nhận vào mã hóa đơn, thủ tục in danh sách món ăn
--Hàm f_kiemtra_mon nhận vào 1 tham số là mã hóa đơn. Hàm trả về mã hóa đơn tồn tại duy nhất trong bản hóa đơn, ngược lại trả về FALSE
CREATE OR REPLACE PACKAGE p_hoadon_monthem
AS
    PROCEDURE mon_hoadon (h_mahd HOADON.MAHD%TYPE);
    FUNCTION f_kiemtra_mon (h_mahd HOADON.MAHD%TYPE) RETURN BOOLEAN;
END p_hoadon_monthem;

CREATE OR REPLACE PACKAGE BODY p_hoadon_monthem
AS
    PROCEDURE mon_hoadon (h_mahd HOADON.MAHD%TYPE) AS
    CURSOR c4 IS
    SELECT a.mamdt,a.maban, a.mamt, a.soluong
    FROM MONDATHEM A INNER JOIN BAN B ON A.MABAN=B.MABAN 
    INNER JOIN HOADON C ON B.SOBAN=C.SOBAN
    WHERE MAHD=h_mahd;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Danh sach mon da them '||h_mahd);
        FOR ITEM IN c4 LOOP
            DBMS_OUTPUT.PUT_LINE(c4%ROWCOUNT || ', Mã món đã thêm: '|| ITEM.MAMDT 
            ||', Mã bàn" '||ITEM.MABAN||', Mã mặt hàng: '||ITEM.MAMT
            || ', Số lượng: '||ITEM.SOLUONG);
        END LOOP;
    END mon_hoadon;
    
    FUNCTION f_kiemtra_mon (h_mahd HOADON.MAHD%TYPE) RETURN BOOLEAN
    AS
         N NUMBER;
         BEGIN
            SELECT COUNT(*) INTO N FROM HOADON WHERE MAHD =h_mahd;
            RETURN N=1;
        END f_kiemtra_mon;
END p_hoadon_monthem;
--KIỂM THỬ
set serveroutput on;
DECLARE
    v_mahd HOADON.MAHD%TYPE;
BEGIN
    v_mahd :='1';
    IF p_hoadon_monthem.f_kiemtra_mon(v_mahd) THEN
        p_hoadon_monthem.mon_hoadon(v_mahd);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Hóa đơn không tồn tại');
            END IF;
END;

--CÂU 5

CREATE OR REPLACE PACKAGE k_nguyenlieu
AS
    PROCEDURE p_nguyenlieu (k_maxn KHO.MAXN%TYPE);
    FUNCTION f_kiemtra_nl (k_maxn KHO.MAXN%TYPE) RETURN BOOLEAN;
END k_nguyenlieu;

CREATE OR REPLACE PACKAGE BODY k_nguyenlieu
AS
    PROCEDURE p_nguyenlieu (k_maxn KHO.MAXN%TYPE) AS
    CURSOR c5 IS
    SELECT N.MANL, TENNL, N.SOLUONG, DVT, HSD, MADT
    FROM KHO K INNER JOIN NGUYENLIEU N ON K.MANL=N.MANL
    WHERE MAXN=k_maxn;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Danh sach nguyên liệu '||k_maxn);
        FOR ITEM IN c5 LOOP
            DBMS_OUTPUT.PUT_LINE(c5%ROWCOUNT || ', Mã món nguyên liệu: '|| ITEM.MANL 
            ||', Tên nguyên liệu" '||ITEM.TENNL||', Số lượng: '||ITEM.SOLUONG
            || ', Đơn vị tính: '||ITEM.DVT||', Hạn sử dụng: '||ITEM.HSD
            || ', Mã đối tác: '||ITEM.MADT);
        END LOOP;
    END p_nguyenlieu;
    
    FUNCTION f_kiemtra_nl (k_maxn KHO.MAXN%TYPE) RETURN BOOLEAN
    AS
         N NUMBER;
         BEGIN
            SELECT COUNT(*) INTO N FROM KHO WHERE MAXN=k_maxn;
            RETURN N=1;
        END f_kiemtra_nl;
END k_nguyenlieu;
--KIỂM THỬ
set serveroutput on;
DECLARE
    v_maxn KHO.MAXN%TYPE;
BEGIN
    v_maxn :='1';
    IF k_nguyenlieu.f_kiemtra_nl(v_maxn) THEN
       k_nguyenlieu.p_nguyenlieu(v_maxn);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Mã xuất nhập không hợp lệ');
            END IF;
END;


----TRIGGER
--câu 1
Create or replace trigger kho_info
before insert on KHO for each row
begin
    if :new.TIGIA <0 or :new.SOLUONG <0 then
        RAISE_APPLICATION_ERROR (-20002, 'TRI GIA, SỐ LƯỢNG NHẬP KHÔNG ĐƯỢC LÀ SỐ ÂM');
    else
        insert into KHO values (:new.MAXN, :new.NGAYXN, :new.SOLUONG, :new.TRANGTHAI,
        :new.TIGIA, :new.TONGGIA, :new.MANL, :new.MANV);
    end if;
end;

Create or replace trigger kho_info
before insert on KHO for each row
begin
    if :new.TIGIA <0 or :new.SOLUONG <0 then
        RAISE_APPLICATION_ERROR (-20002, 'TRI GIA, SỐ LƯỢNG NHẬP KHÔNG ĐƯỢC LÀ SỐ ÂM');
    end if;
end;
--Kiểm thử
--không hợp lệ
INSERT INTO Kho (MaXN,NgayXN,SoLuong,TrangThai,TiGia,TongGia,MaNL,MaNV) 
VALUES (9,TO_DATE('2022-01-05','YYYY/MM/DD'),-40,N'Nhập',-18000,360000,'NL3','NQTuan');
--hợp lệ
INSERT INTO Kho (MaXN,NgayXN,SoLuong,TrangThai,TiGia,TongGia,MaNL,MaNV) 
VALUES (9,TO_DATE('2022-01-05','YYYY/MM/DD'),2,N'Nhập',18000,360000,'NL3','NQTuan');



--câu 2
Create or replace trigger tr_ngayxuathd
before insert or update on HOADON for each row
begin
    if :new.NGAYXUAT >sysdate then
        RAISE_APPLICATION_ERROR (-20002, 'Ngày xuất phải nhỏ hơn hoặc bằng ngày hệ thống');
    end if;
end;

--kiểm thử
--Không hợp lệ
INSERT INTO HoaDon (MaHD,MaNV,SoBan,GioVao,NgayXuat,NguoiLon,TreEm,TongVe,TongTien,SDT) 
VALUES (13,'NHLinh','01',TO_DATE('2022/05/15 8:30:25', 'YYYY/MM/DD HH:MI:SS'),
TO_DATE('2022/12/1 8:30:25', 'YYYY/MM/DD HH:MI:SS'),5,3,8,2035000,N'0451345488');
--Hợp lệ
INSERT INTO HoaDon (MaHD,MaNV,SoBan,GioVao,NgayXuat,NguoiLon,TreEm,TongVe,TongTien,SDT) 
VALUES (13,'NHLinh','01',TO_DATE('2022/05/15 8:30:25', 'YYYY/MM/DD HH:MI:SS'),
TO_DATE('2022/11/30 8:30:25', 'YYYY/MM/DD HH:MI:SS'),5,3,8,2035000,N'0451345488');

--câu 3

Create or replace trigger trg_ban
before insert on BAN for each row
begin
    if  :new.SOLUONG <0 then
        RAISE_APPLICATION_ERROR (-20022, 'SỐ LƯỢNG KHÁCH HÀNG KHÔNG ĐƯỢC LÀ SỐ ÂM');
        
    end if;
end;

--KIỂM THỬ KHÔNG HỢP LỆ
INSERT INTO Ban(MaBan,SDT,SoBan,GioDat,SoLuong,NguoiLon,TreEm,MaNV) 
VALUES ('11','0923456778','10',TO_DATE('2022/10/11 10:30:25', 'YYYY/MM/DD HH:MI:SS'),-4,2,2,'DHPhi');
--KIỂM THỬ HỢP LỆ
INSERT INTO Ban(MaBan,SDT,SoBan,GioDat,SoLuong,NguoiLon,TreEm,MaNV) 
VALUES ('11','0923456778','10',TO_DATE('2022/10/11 10:30:25', 'YYYY/MM/DD HH:MI:SS'),4,2,2,'DHPhi');

--Câu 4 Khong cho phep thay doi tren bang NGUYENLIEU sau 11:00 pm va truoc 6:00am
create or replace trigger tg_nglieu
before insert or update or delete
on NGUYENLIEU
for each row
declare 
    gio int;
begin
    select to_char(sysdate,'hh24') into gio from dual;
    if gio >= 23 or gio <= 6 then raise_application_error(-20001,'Khong co trong thoi gian hoat dong');
    end if;
end;
--Chinh sua trigger de test
update NGUYENLIEU 
set SOLUONG =500 
where MANL='NL10';


--Câu 5: Viết Trigger kiểm tra giá vé không được giảm
Create or replace trigger trg_sl_ve
before update on VE for each row
begin
    if  :old.GIA > :new.GIA then
        RAISE_APPLICATION_ERROR (-20222, 'Gía vé không được giảm');
    end if;
end;

--DROP TRIGGER trg_sl_ve; 
--Không hợp lệ
UPDATE VE SET GIA = 200000 WHERE MAVE='1';
--Hợp lệ
UPDATE VE SET GIA = 310000 WHERE MAVE='1';


--user
--c1 Tạo các user THUAN, PHUC, PHUONG, SUONG, ANH, THANG
CREATE USER THUAN IDENTIFIED BY Thuan;
CREATE USER PHUC IDENTIFIED BY Phuc;
CREATE USER PHUONG IDENTIFIED BY Phuong;
CREATE USER SUONG IDENTIFIED BY Suong;
CREATE USER ANH IDENTIFIED BY Anh;
CREATE USER THANG IDENTIFIED BY Thang;

--c2 Đảm bảo các user này có thể tạo bất kỳ bảng nào trong tablespace với quota 10M
GRANT CREATE SESSION TO THUAN;
GRANT CREATE SESSION TO PHUC;
GRANT CREATE SESSION TO PHUONG;
GRANT CREATE SESSION TO SUONG;
GRANT CREATE SESSION TO ANH;
GRANT CREATE SESSION TO THANG;

ALTER USER THUAN QUOTA 10M ON users;
ALTER USER PHUC QUOTA 10M ON users;
ALTER USER PHUONG QUOTA 10M ON users;
ALTER USER SUONG QUOTA 10M ON users;
ALTER USER ANH QUOTA 10M ON users;
ALTER USER THANG QUOTA 10M ON users;

--C3 Thực hiện các yêu cầu
--a. Tạo bảng THAMDU (ID INT PRIMARY KEY, Name NVARCHAR2)
CREATE TABLE THAMDU (ID INT PRIMARY KEY, Name NVARCHAR2(50));
--b. Tạo các role sau: NhapLieu, GiamSat, QuanLy
CREATE ROLE NhapLieu;
CREATE ROLE GiamSat;
CREATE ROLE QuanLy;
-- c. Gán PHUONG, SUONG, ANH vào role NhapLieu, gán THANG vào role GiamSat, 
--và gán THUAN và PHUC vào role QuanLy.
GRANT NhapLieu TO PHUONG;
GRANT NhapLieu TO SUONG;
GRANT NhapLieu TO ANH;
GRANT GiamSat TO THANG;
GRANT QuanLy TO THUAN;
GRANT QuanLy TO PHUC;
-- d. Cho role NhapLieu các quyền SELECT, INSERT, và UPDATE trên bảng THAMDU.
GRANT SELECT,INSERT,UPDATE ON THAMDU TO NhapLieu;

-- e. Cho role GiamSat các quyền SELECT và DELETE trên bảng THAMDU.
GRANT SELECT,DELETE ON THAMDU TO GiamSat;

-- f. Cho role QuanLy quyền SELECT trên bảng THAMDU.
GRANT SELECT ON THAMDU TO QuanLy;

-- g. Kiểm tra kết quả phân quyền đã cấp cho các rol
SELECT * FROM ROLE_TAB_PRIVS;

--c4 Tạo một user mới tên TenQuanLy với password là nhom9. 
--Gán quyền update cho user này trên cột Name của bảng THAMDU
CREATE USER TenQuanLy IDENTIFIED by nhom9;
GRANT CREATE SESSION TO TenQuanLy;
ALTER USER TenQuanLy QUOTA 10M ON USERS;
GRANT UPDATE(Name) ON THAMDU TO TenQuanLy;

--C5 Thực hiện các bước sau:
--a. Gán password cho role NhapLieu ở bài 1 là “nhaplieu123”
--b. Cho phép user THUAN quyền cấp quyền cho các user khác
--c. Gán tất cả các quyền mà THUAN có cho PHUC.
ALTER ROLE NhapLieu IDENTIFIED BY nhaplieu123;
GRANT CREATE SESSION TO THUAN WITH admin option;
GRANT INSERT, UPDATE ON THAMDU TO PHUC;

--Câu 6
--1 Tạo không gian bảng (tablespace) có kích thước 100M. 
create tablespace oracle
datafile'oracle.dbf' size 100m;
--2 Tạo không gian bảng tạm (temporary tablespace) có kích thước 50M.
create temporary tablespace oracle_2
tempfile'oracle2.dbf' size 50m;
--3 Tạo rollback segment rolora để truy xuất đồng thời cho table space vừa tạo. 
create rollback segment seg
tablespace oracle;
--4 Tạo user có tên là tên nviên, mật khẩu do sinh viên tự đặt với tablespace 
--và temporary tablespace vừa tạo. 
create user nvien identified by nvien
default tablespace oracle
temporary tablespace oracle_2
password expire;
--5 Cấp quyền truy xuất tài nguyên (resource) cho user vừa tạo
grant resource to nvien;
--6 Cấp quyền cho phiên làm việc (session) cho user vừa tạo
grant create session to nvien;
--7 Cấp quyền tạo bảng (table) cho user vừa tạo
grant create table to nvien;

--8 Cấp quyền tạo khung nhìn (view) cho user vừa tạo.
grant create view to nvien;

--9 Cấp quyền Select, Insert, Update, Delete trên bảng HOADON cho user vừa tạo
grant insert, update, select, delete on HOADON to nvien;

--10 Cấp quyền Select, Insert, Update, Delete trên bảng BAN cho user vừa tạo. 
grant insert, update, select, delete on BAN to nvien;
--11 Cấp quyền Select chỉ với các thuộc tính ID, NAME trên bảng THAMDU cho user vừa tạo
grant update(ID, NAME) on THAMDU to nvien;