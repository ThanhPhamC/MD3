-- 1. Liệt kê danh sách sinh viên, gồm các thông tin sau: Mã sinh viên, Họ sinh viên, Tên sinh viên, Học bổng.
--  Danh sách sẽ được sắp xếp theo thứ tự Mã sinh viên tăng dần
SELECT * FROM dmsv;
select dmsv.masv, dmsv.hosv, dmsv.tensv, dmsv.hocbong
from dmsv
where hocbong !=0;
-- 2. Danh sách các sinh viên gồm thông tin sau: Mã sinh viên, họ tên sinh viên,
-- Phái, Ngày sinh. Danh sách sẽ được sắp xếp theo thứ tự Nam/Nữ.
select dmsv.masv, CONCAT(dmsv.hosv, dmsv.tensv) as hoten, dmsv.Phai, dmsv.ngaysinh
from dmsv 
order by dmsv.Phai;
--  3.Thông tin các sinh viên gồm: Họ tên sinh viên, Ngày sinh, Học bổng. 
-- Thông tin sẽ được sắp xếp theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần.
select dmsv.masv, CONCAT(dmsv.hosv, ' ',dmsv.tensv) as hoten, dmsv.ngaysinh, dmsv.hocbong
from dmsv 
order by dmsv.ngaysinh, dmsv.hocbong DESC;
SELECT * FROM dmmh;
-- 4.Danh sách các môn học có tên bắt đầu bằng chữ T, gồm các thông tin: Mã môn, Tên môn, Số tiết.
select dmmh.mamh, dmmh.tenmh, dmmh.sotiet
from dmmh
where dmmh.tenmh like 'T%';
-- 5.Liệt kê danh sách những sinh viên có chữ cái cuối cùng trong tên là I, gồm các thông tin: Họ tên sinh viên, Ngày sinh, Phái.
SELECT * FROM dmsv;
select dmsv.masv, CONCAT(dmsv.hosv,' ', dmsv.tensv) as hoten, dmsv.ngaysinh, dmsv.phai
from dmsv
where dmsv.tensv like '%i';
-- 6.Danh sách những khoa có ký tự thứ hai của tên khoa có chứa chữ N, gồm các thông tin: Mã khoa, Tên khoa.
select*from dmkhoa;
select dmkhoa.makhoa, dmkhoa.tenkhoa
from dmkhoa
where dmkhoa.tenkhoa like '%n%';

-- 7.Liệt kê những sinh viên mà họ có chứa chữ Thị.
select *from dmsv
where dmsv.hosv like '%Thi%';
-- 8.Cho biết danh sách các sinh viên có học bổng lớn hơn 100,000, gồm các thông tin:
--  Mã sinh viên, Họ tên sinh viên, Mã khoa, Học bổng. Danh sách sẽ
-- được sắp xếp theo thứ tự Mã khoa giảm dần.
select dmsv.masv, CONCAT(dmsv.hosv,' ', dmsv.tensv) as hoten, dmsv.makhoa, dmsv.hocbong
from dmsv
where dmsv.hocbong>100000
order by dmsv.makhoa DESC;
-- 9.Liệt kê các sinh viên có học bổng từ 150,000 trở lên và sinh ở Hà Nội, gồm 
-- các thông tin: Họ tên sinh viên, Mã khoa, Nơi sinh, Học bổng.
select dmsv.masv, CONCAT(dmsv.hosv,' ', dmsv.tensv) as hoten, dmsv.makhoa,dmsv.noisinh , dmsv.hocbong
from dmsv
where dmsv.hocbong>150000 and noisinh='Hà Nội';
-- 10.Danh sách các sinh viên của khoa Anh văn và khoa Vật lý, gồm các thông tin: Mã sinh viên, Mã khoa, Phái.
select dmsv.masv, dmsv.makhoa, dmsv.phai
from dmsv
where dmsv.makhoa='AV' or dmsv.makhoa='VL';
-- 11.	Cho biết những sinh viên có ngày sinh từ ngày 01/01/1991 đến ngày 05/06/1992 
-- gồm các thông tin: Mã sinh viên, Ngày sinh, Nơi sinh, Học bổng.
select *from dmsv;
select masv,CONCAT(dmsv.hosv,' ', dmsv.tensv) as hoten , ngaysinh, noisinh, hocbong
from dmsv
where ngaysinh between '1991-01-01' and '1992-06-05';
-- 12. Danh sách những sinh viên có học bổng từ 80.000 đến 150.000, gồm các thông tin: Mã sinh viên, Ngày sinh, Phái, Mã khoa.
select masv, CONCAT(dmsv.hosv,' ', dmsv.tensv) as hoten, ngaysinh, phai, makhoa, hocbong
from dmsv 
where hocbong between 80000 and 150000; 
-- 13.Cho biết những môn học có số tiết lớn hơn 30 và nhỏ hơn 45, gồm các thông tin: Mã môn học, Tên môn học, Số tiết.
select *from dmmh;
 select mamh, tenmh, sotiet
 from dmmh
where sotiet between 30 and 45;
-- 14.Liệt kê những sinh viên nam của khoa Anh văn và khoa tin học, gồm các thông tin: Mã sinh viên, Họ tên sinh viên, tên khoa, Phái.
 select masv, concat(hosv,' ', tensv) , makhoa, phai
 from dmsv
 where phai='nam' and (makhoa = 'AV' or'TH');
 
 -- 15. Liệt kê những sinh viên nữ, tên có chứa chữ N
  select *from dmsv
  where phai= 'nu' and tensv like '%n%';
-- 16.Danh sách sinh viên có nơi sinh ở Hà Nội và sinh vào tháng 02, 
-- gồm các thông tin: Họ sinh viên, Tên sinh viên, Nơi sinh, Ngày sinh.
select hosv, tensv, noisinh, ngaysinh
from dmsv
where noisinh= 'ha noi' and MONTH(ngaysinh)=2;
-- 17. Cho biết những sinh viên có tuổi lớn hơn 20, thông tin gồm: Họ tên sinh viên, Tuổi,Học bổng.
select masv, concat(hosv,' ', tensv) as hoten,(year(now()) - year(ngaysinh)) as tuoi, hocbong 
from dmsv
where ((year(now()) - year(ngaysinh))>20);
-- 18. Danh sách những sinh viên có tuổi từ 20 đến 25, thông tin gồm: Họ tên sinh viên, Tuổi, Tên khoa.
select masv, concat(hosv,' ', tensv) as hoten, (year(now()) - year(ngaysinh)) as tuoi, tenkhoa
from dmsv inner join dmkhoa on dmsv.makhoa=dmkhoa.makhoa
where ((year(now()) - year(ngaysinh))>20 and ((year(now()) - year(ngaysinh))<25));
-- 19. Danh sách sinh viên sinh vào mùa xuân năm 1990, gồm các thông tin: Họ tên sinh viên,Phái, Ngày sinh.
select concat(hosv,' ', tensv) as hoten, phai, ngaysinh
from dmsv
where year(ngaysinh)=1990 and month(ngaysinh) between 1 and 3;
-- 20.  Cho biết thông tin về mức học bổng của các sinh viên, 
-- gồm: Mã sinh viên, Phái, Mã khoa, Mức học bổng. Trong đó, mức học bổng sẽ hiển thị 
-- là “Học bổng cao” nếu giá trị của field học bổng lớn hơn 500,000 và ngược lại hiển thị là “Mức trung bình”
select masv, concat(hosv, ' ', tensv), phai,makhoa, case hocbong when hocbong>500000 then 'hoc bong cao' else 'trung binh' end as ' muc hoc bong'
from dmsv;
-- 21. Cho biết tổng số sinh viên của toàn trường
select count(masv) as 'tong so sv'
from dmsv;
-- 22. Cho biết tổng sinh viên và tổng sinh viên nữ.
 select *from dmsv;
select count(masv) as 'tong so sv nu '
from dmsv 
where phai= 'nu'
group by phai;
-- 23.  Cho biết tổng số sinh viên của từng khoa.
 select *from dmkhoa;
select tenkhoa 
from dmkhoa inner join dmsv on dmkhoa.makhoa=dmsv.ma