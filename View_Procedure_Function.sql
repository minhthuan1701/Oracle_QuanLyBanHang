--Phần View
--C1:Tạo view cho biết danh sách nhân viên thuộc giới tính Nam
create or replace view v_dsnv as
select * from NhanVien where GioiTinh='Nam'
--Kiểm thử
select * from v_dsnv
--C2:Tạo View cho biết Món thêm nào chưa được gọi
create or replace view v_dsmt as
select * from Monthem 
where MaMT not in (select MaMT from MonDaThem)
--Kiểm thử 
select * from v_dsmt
--c3 Tạo view cho biết Số lượng loại nguyên liệu của từng đối tác cung cấp
create or replace view v_dsslNL as
select NGUYENLIEU.MaDT,TenDT,count(*) as SoLuongNLCC
from NGUYENLIEU join DOITAC on nguyenlieu.madt=doitac.madt
group by nguyenlieu.madt,TenDT
--Kiểm thử
select * from v_dsslNL
--c4 Cho biết tên Nguyên liệu,số lượng,tổng giá ở Kho đang cần Nhập
create or replace view v_c4 as
select Kho.MaNL,NGUYENLIEU.TenNL,kho.soluong,kho.tonggia
from KHO join NGUYENLIEU on kho.manl=nguyenlieu.manl
where TrangThai=N'Nhập';
--Test
select * from v_c4
--c5:Cho biết bàn của khách hàng nào có số lượng đông nhất
create or replace view v_c5 as
select *
from(select TenKH,SoLuong,MaBan
    from Ban join KhachHang on ban.sdt=khachhang.sdt
    order by SoLuong desc) 
where rownum=1
--test
select * from v_c5

--Phan Procedure
--c1:Nhập vào sdt khách háng cho biết tổng tiền khách phải trả
SET SERVEROUTPUT ON;
CREATE or replace procedure sp_TongTien(sdt1 in hoadon.SDT%type)
AS cursor c_tongtien is SELECT
		Giovao,Tongve,tongtien,sdt
	FROM HoaDon
        where SDT=sdt1;
giovao Hoadon.Giovao%type;
sdt2 hoadon.sdt%type;
tongv hoadon.tongve%type;
tongt hoadon.tongtien%type;
BEGIN
	open c_tongtien;
    loop
    fetch c_tongtien into giovao,tongv,tongt,sdt2;
    dbms_output.put_line('GioVao:'||giovao||',TongVe:'||tongv||',TongTien:'||tongt||',SDT:'||sdt2);
    exit when c_tongtien%notfound;
    end loop;  
    close c_tongtien;
END;
--Kiem thu:
SET SERVEROUTPUT ON;
execute sp_TongTien('0913456799')

--c2:Nhập vào mã nhân viên cho biết thông tin nhân viên đó
CREATE or replace procedure sp_Ttnv(mnv in nhanvien.manv%type)
AS cursor c_ttnv1 is SELECT
		manv,hoten,ngaysinh,gioitinh
	FROM nhanvien
        where manv=mnv;
mnv1 Nhanvien.manv%type;
ht Nhanvien.hoten%type;
ns Nhanvien.ngaysinh%type;
gt Nhanvien.gioitinh%type;
BEGIN
	open c_ttnv1;
    loop
    fetch c_ttnv1 into mnv1,ht,ns,gt;
    dbms_output.put_line('MaNV:'||mnv1||',HoTen:'||ht||',NgaySinh:'||ns||',GioiTinh:'||gt);
    exit when c_ttnv1%notfound;
    end loop;  
    close c_ttnv1;
END;
--Kiểm thử
set serveroutput on;
execute sp_Ttnv('NHDuy');

--C3:Nhập mã bàn cho biết bàn đã gọi  thêm món ăn gì
CREATE or replace procedure sp_c3(mb in mondathem.maban%type)
AS cursor c_c3 is SELECT
		maban,tenmt,soluong
	FROM mondathem join monthem on mondathem.mamt=monthem.mamt
        where maban=mb;
mban mondathem.maban%type;
tmt monthem.tenmt%type;
sl mondathem.soluong%type;
BEGIN
	open c_c3;
    loop
    fetch c_c3 into mban,tmt,sl;
    dbms_output.put_line('MaBan:'||mban||',TenMonThem:'||tmt||',SoLuong:'||sl);
    exit when c_c3%notfound;
    end loop;  
    close c_c3;
END;
--kiểm thử
set serveroutput on;
execute sp_c3('02')

--c4:Nhập vào giới tính cho biết những nhân viên thuộc giới tính đó
CREATE or replace procedure sp_c4(a in nhanvien.gioitinh%type)
AS cursor c_c4 is SELECT
		manv,hoten,gioitinh
	FROM nhanvien
        where gioitinh=a;
mnv nhanvien.manv%type;
ten nhanvien.hoten%type;
gt nhanvien.gioitinh%type;
BEGIN
	open c_c4;
    loop
    fetch c_c4 into mnv,ten,gt;
    dbms_output.put_line('MaNV:'||mnv||',HoTen:'||ten||',GioiTinh:'||gt);
    exit when c_c4%notfound;
    end loop;  
    close c_c4;
END;
--Kiểm thử
set serveroutput on;
execute sp_c4('Nam')

--c5:Nhập vào mã đối tác cho biết đối tác đó cung cấp những nguyên liệu nào
CREATE or replace procedure sp_c5(a in doitac.madt%type)
AS cursor c_c5 is SELECT
		nguyenlieu.madt,tendt,tennl,soluong
	FROM nguyenlieu join doitac on nguyenlieu.madt=doitac.madt
        where nguyenlieu.madt=a;
mdt nguyenlieu.madt%type;
ten doitac.tendt%type;
tnl nguyenlieu.tennl%type;
sl nguyenlieu.soluong%type;
BEGIN
	open c_c5;
    loop
    fetch c_c5 into mdt,ten,tnl,sl;
    dbms_output.put_line('MaDT:'||mdt||',TenDT:'||ten||',NguyenLieu:'||tnl||',Soluong:'||sl);
    exit when c_c5%notfound;
    end loop;  
    close c_c5;
END;
--kiểm thử
set serveroutput on;
execute sp_c5('DT04')

--Phần function
--c1:Nhập vào mã bàn cho biết tên khách hàng của bàn đó
create or replace function f_c1(Mban in Ban.maban%type) return varchar2
as tenkhach varchar2(100);
begin
    select tenkh into tenkhach
    from khachhang
    where sdt = (select sdt from ban where maban=Mban);
    return tenkhach;
     exception
    when no_data_found
    then return('Du lieu khong tim thay');
    when others 
    then return('loi ham');
end;
--Kiểm thử
select f_c1('01') from dual;

--c2:Nhập vào mã bàn cho số lượng khách ngồi bàn đó
create or replace function f_c2(Mban in Ban.maban%type) return number
as sl number;
begin
    select soluong into sl
    from ban
    where maban =mban;
    return sl;
     exception
    when no_data_found
    then return('Du lieu khong tim thay');
    when others 
    then return('loi ham');
end;
--Kiểm thử
select f_c2('01') from dual

--c3:Nhập vào mã nv cho biết tổng giá tiền kho do nhân viên này quản lý
create or replace function f_c3(Mnv in kho.manv%type) return number
as tong number;
begin
    select sum(tonggia) into tong
    from kho
    where manv =mnv
    group by manv;
    return tong;
     exception
    when no_data_found
    then return('Du lieu khong tim thay');
    when others 
    then return('loi ham');
end;
--Kiểm thử
select f_c3('NQTuan') from dual

--c4:Nhận vào tham số là năm (year). Hàm trả về số lượng nhân viên sinh trong năm đó.
create or replace function f_c4(nam in number) return number
as SLNV number;
begin
    select count(manv) into SLNV
    from Nhanvien
    where TO_CHAR(Ngaysinh,'yyyy')=nam
    group by TO_CHAR(Ngaysinh,'yyyy');
    return SLNV;
     exception
    when no_data_found
    then return('Du lieu khong tim thay');
    when others 
    then return('loi ham');
end;
--kiểm thử
select f_c4('2003') from dual

--c5:Nhập vào năm cho biết số lượng loại nguyên liệu cần nhập trong năm đó
create or replace function f_c5(nam in number) return number
as SLN number;
begin
    select count(maxn) into SLN
    from kho
    where TO_CHAR(Ngayxn,'yyyy')=nam and Trangthai='Nhập'
    group by TO_CHAR(Ngayxn,'yyyy');
    return SLN;
     exception
    when no_data_found
    then return('Du lieu khong tim thay');
    when others 
    then return('loi ham');
end;
--Kiểm thử
select f_c5('2021') from dual