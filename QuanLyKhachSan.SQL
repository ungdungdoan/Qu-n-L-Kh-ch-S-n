CREATE DATABASE QuanLyKhachSan
Go
Use QuanLyKhachSan
Go

CREATE TABLE KhachHang(
	MaKH varchar(5) primary key,
	TenKh nvarchar(30),
	DiaChi nvarchar(30),
	GioiTinh nvarchar(5),
	CMND varchar(10),
	SDT char(13),
	QuocTich nvarchar(20)
)
CREATE TABLE ChucVu(
	MaCV varchar(5) primary key,
	TenCV nvarchar(30),
)
CREATE TABLE NhanVien(
	MaNV varchar(5) primary key,
	tenNV nvarchar(30),
	MaCV varchar(5),
	GioiTinh nvarchar(5),
	NgaySinh smalldatetime,
	DiaChi nvarchar(50),
	SDT char(15)
CONSTRAINT FK_NhanVien_ChucVu FOREIGN KEY(MaCV) REFERENCES ChucVu(MaCV)
)
CREATE TABLE LoaiPhong(
	MaLoaiPhong varchar(6) primary key,
	TenLoaiPhong nvarchar(30),
	Gia int
)
CREATE TABLE Phong(
	MaPhong varchar(6) primary key,
	TenPhong nvarchar(20),
	TinhTrang nvarchar(15),
	MaLoaiPhong varchar(6),
	Gia int,
	DonVi varchar(10)
CONSTRAINT FK_Phong_LoaiPhong FOREIGN KEY(MaLoaiPhong) REFERENCES LoaiPhong(MaLoaiPhong)
)
CREATE TABLE DichVu(
	MaDV varchar(5) primary key,
	MaPDK varchar(5),
	TenDv nvarchar(30),
	GiaDV int,
	DonVi varchar(5),
)
CREATE TABLE HoaDon(
	MaHD varchar(5) primary key,
	NgayThanhToan smalldatetime,
	MaNV varchar(5),
	MaDV varchar(5),
	SoTienDatTruoc int,
	TongTien int,
	DonVi varchar(5),
CONSTRAINT FK_HoaDon_NhanVien FOREIGN KEY(MaNV) REFERENCES NhanVien(MaNV),
CONSTRAINT FK_HoaDon_DichVu FOREIGN KEY(MaDV) REFERENCES DichVu(MaDV)
)
CREATE TABLE PhieuDangKy(
	MaPDK varchar(5) primary key,
	MaKH varchar(5),
	MaNV varchar(5),
	NgayLap smalldatetime,
	MaPhong varchar(6),
	SoTienTraTruoc int,
	DonVi varchar(5),	
CONSTRAINT FK_PhieuDangKy_KhachHang FOREIGN KEY(MaKH) REFERENCES KhachHang(MaKH),
CONSTRAINT FK_PhieuDangKy_NhanVien FOREIGN KEY(MaNV) REFERENCES NhanVien(MaNV),
CONSTRAINT FK_PhieuDangKy_Phong FOREIGN KEY(MaPhong) REFERENCES Phong(MaPhong)
)
