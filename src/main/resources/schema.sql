create table customer(
     id bigint primary key auto_increment,
     nama varchar(255) not null,
     alamat varchar(255) not null,
     kota varchar(255) not null,
     provinsi varchar(255) not null,
     tgl_registrasi date not null,
     status boolean
);