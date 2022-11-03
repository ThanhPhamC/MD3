create table KHACHHANG(
MaKH nvarchar(4) primary key,
TenKH nvarchar(30) not null,
DiaChi nvarchar(50),
NgaySinh date,
SoDT nvarchar(15) unique key ); 

create table NHANVIEN(
MaNV nvarchar(4) primary key,
HoTen nvarchar(30) not null,
GioiTinh bit not null,
DiaChi nvarchar(50) not null,
NgaySinh date not null,
DienThoai nvarchar(15),
Email text, 
NoiSinh nvarchar(20) not null,
NgayVaoLam date,
MaNQL nvarchar(4)
);

create table NHACUNGCAP(
MaNCC nvarchar(5) primary key,
TenNCC nvarchar(50) not null,
DiaChi nvarchar(50) not null,
DienThoai nvarchar(15) not null,
Email nvarchar(30) not null,
Website nvarchar(30) 
);

create table LOAISP(
MaLoaiSP nvarchar(4) primary key,
TenLoaiSP nvarchar(30) not null,
GhiChu nvarchar(100) not null
);

create table SANPHAM(
MaSP nvarchar(4) primary key,
MaLoaiSP nvarchar(4) not null,
TenSP nvarchar(50) not null,
DonViTinh nvarchar(10) not null,
GhiChu nvarchar(100),
foreign key(MaLoaiSP) references LOAISP(MaLoaiSP)
);

create table PHIEUNHAP(
SoPN nvarchar(5) primary key,
MaNV nvarchar(4) not null,
MaNCC nvarchar(5) not null,
NgayNhap date default (CURRENT_DATE()),
foreign key (MaNV) references NHANVIEN(MaNV),
foreign key (MaNCC) references NHACUNGCAP(MaNCC),
Ghichut nvarchar(100));


create table CTPHIEUNHAP(
MaSP nvarchar(4) not null,
SoPN nvarchar(5) not null,
SoLuong smallint not null default 0,
GiaNhap real not null check(GiaNhap>=0),
primary key(MaSP,SoPN),
foreign key (MaSP) references SANPHAM(MaSP),
foreign key (SoPN) references PHIEUNHAP(SoPN)
);
create table PHIEUXUAT(
SoPX nvarchar(5) not null primary key,
MaNV nvarchar(4) not null,
MaKH nvarchar(4) not null,
NgayBan date not null ,  
foreign key (MaNV) references NHANVIEN(MaNV),
foreign key (MaKH) references KHACHHANG(MaKH),
GhiChu text
);
create table CTPHIEUXUAT(
SoPX nvarchar(5) not null,
MaSP nvarchar(4) not null,
SoLuong smallint not null check(SoLuong>0),
GiaBan real not null check(GiaBan>0),
foreign key (MaSP) references SANPHAM(MaSP),
foreign key (SoPX) references PHIEUXUAT(SoPX),
primary key(SoPX,MaSP)
);
select * from loaisp;
select * from sanpham;
insert into LOAISP(maloaisp, tenloaisp, ghichu)
values('C001','Quan Ao','Mua thu'),
('C123','Gang Tay', 'Giu Nhiet');
insert into sanpham(masp,maloaisp,tensp,donvitinh,ghichu)
values('P001','C001','quan ni',12,'quan nhap'),
('p123','C123','gang tay bong',5,'hang gia cong'),
('p122','C123','gang tay ni',6,'hang cao cap'),
('p113','C001','ao khoac nhe',7,'hang cui bap')

