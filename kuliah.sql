CREATE TABLE jurusan(id character(3) primary key not null, name_jurusan varchar(50) not null);
INSERT INTO jurusan VALUES('111','Teknologi Hasil Pertanian');
INSERT INTO jurusan VALUES('112','Sosial Ekonomi Pertanian');
INSERT INTO jurusan VALUES('113','Teknologi Mesin Pertanian');

CREATE TABLE dosen(nip character(7) primary key not null, name_dosen varchar(50) not null,id character(3), foreign key(id) references jurusan(id));
INSERT INTO dosen VALUES('D111101','Ir. Satro','111');
INSERT INTO dosen VALUES('D111201','Ir. Sairi','112');
INSERT INTO dosen VALUES('D111301','Ir. Sarbini','113');
INSERT INTO dosen VALUES('D111102','Ir. Wahiji','111');

CREATE TABLE mahasiswa(nim character(7) primary key not null, name_mahasiswa varchar(50) not null, alamat text(100),id varchar(3), foreign key(id) references jurusan(id));
INSERT INTO mahasiswa VALUES('2411101','muksin','jl. waringin kurung no.60 serang banten','111');
INSERT INTO mahasiswa VALUES('2411201','hilmi','jl. soekarno Hatta no. 1 bandung','112');
INSERT INTO mahasiswa VALUES('2411301','ramdani','jl. soekarno Hatta no. 3 lampung','113');

CREATE TABLE mata_kuliah(id_mata_kuliah character(4) primary key not null, name_mata_kuliah varchar(50), sks integer(1));
INSERT INTO mata_kuliah VALUES('IP01','Ilmu pangan', '2');
INSERT INTO mata_kuliah VALUES('TS01','Teknologi sayur', '3');
INSERT INTO mata_kuliah VALUES('MF01','Mekanika fluida', '2');
INSERT INTO mata_kuliah VALUES('PA01','pengantar agribisnis', '2');

CREATE TABLE mengajar(nomor integer primary key autoincrement, nip character(7) not null, id_mata_kuliah character(4) not null, foreign key (nip) references dosen (nip), foreign key (id_mata_kuliah) references mata_kuliah(id_mata_kuliah));
INSERT INTO mengajar (nip, id_mata_kuliah) VALUES('D111101','IP01');
INSERT INTO mengajar (nip, id_mata_kuliah) VALUES('D111102','IS01');
INSERT INTO mengajar (nip, id_mata_kuliah)VALUES('D111201','PA01');
INSERT INTO mengajar (nip, id_mata_kuliah)VALUES('D111301','MF01');

CREATE TABLE belajar(nomor integer primary key autoincrement, nim character(7) not null, id_mata_kuliah character(4) not null, nilai character(2),foreign key (nim) references mahasiswa (nim), foreign key (id_mata_kuliah) references mata_kuliah(id_mata_kuliah));
INSERT INTO belajar (nim, id_mata_kuliah)VALUES('2411101','IP01');
INSERT INTO belajar (nim, id_mata_kuliah)VALUES('2411102','TS01');
INSERT INTO belajar (nim, id_mata_kuliah)VALUES('2411201','PA01');
INSERT INTO belajar (nim, id_mata_kuliah)VALUES('2411301','MF01');


.header on
.mode column
select*from mahasiswa;
select*from jurusan;
select*from dosen;
select*from mata_kuliah;
select*from belajar;
select*from mengajar;



select*from mahasiswa cross join jurusan using(id);
select*from Dosen cross join jurusan using(id);
select*from Dosen cross join jurusan using(id) cross join mahasiswa using(id);
select*from dosen ross join mengajar using(nip);
select*from dosen cross join mengajar using(nip)cross join mata_kuliah using(id_mata_kuliah);
select*from dosen cross join mengajar using(nip)cross join mata_kuliah using(id_mata_kuliah) order by nomor desc; 
select*from dosen cross join mengajar using(nip)cross join mata_kuliah using(id_mata_kuliah) cross join mahasiswa using(id) order by nomor desc;
select nim, name_mahasiswa from (select*from dosen cross join mengajar using(nip)cross join mata_kuliah using(id_mata_kuliah) cross join mahasiswa using(id) order by nomor desc);
select*from dosen cross join mengajar using(nip)cross join mata_kuliah using(id_mata_kuliah) cross join mahasiswa using(id) group by mahasiswa.nim having name_mata_kuliah= 'Ilmu pangan'; 
update belajar set nilai='B' where nomor=3; 
