/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     25/09/2023 09:17:42                          */
/*==============================================================*/


drop table if exists JENIS_PRODUK;

drop table if exists PEMBELI;

drop table if exists PENJUALAN;

drop table if exists PRODUK;

drop table if exists STOK;

drop table if exists TOKO;

/*==============================================================*/
/* Table: JENIS_PRODUK                                          */
/*==============================================================*/
create table JENIS_PRODUK
(
   ID                   int not null,
   NAMA                 varchar(100),
   KETERANGAN           varchar(255),
   primary key (ID)
);

/*==============================================================*/
/* Table: PEMBELI                                               */
/*==============================================================*/
create table PEMBELI
(
   ID                   int not null,
   PEN_ID               int,
   NAMA                 varchar(100),
   ALAMAT               varchar(100),
   NO_HP                varchar(20),
   TIPE                 int,
   primary key (ID)
);

/*==============================================================*/
/* Table: PENJUALAN                                             */
/*==============================================================*/
create table PENJUALAN
(
   ID                   int not null,
   PRO_ID               int,
   TANGGAL              date,
   NOMINAL              decimal,
   primary key (ID)
);

/*==============================================================*/
/* Table: PRODUK                                                */
/*==============================================================*/
create table PRODUK
(
   ID                   int not null,
   JEN_ID               int,
   TOK_ID               int,
   PRO_ID               int,
   NAMA                 varchar(100),
   HARGA                decimal(10,2),
   STOCK                int,
   primary key (ID)
);

/*==============================================================*/
/* Table: STOK                                                  */
/*==============================================================*/
create table STOK
(
   TOK_ID               int not null,
   PRO_ID               int not null,
   ID                   int,
   JUMLAH               numeric(8,0),
   NOMINAL              decimal,
   primary key (TOK_ID, PRO_ID)
);

/*==============================================================*/
/* Table: TOKO                                                  */
/*==============================================================*/
create table TOKO
(
   ID                   int not null,
   NAMA                 varchar(100),
   ALAMAT               varchar(100),
   PEMILIK              varchar(100),
   NO_HP                varchar(20),
   primary key (ID)
);

alter table PEMBELI add constraint FK_RELATIONSHIP_3 foreign key (PEN_ID)
      references PENJUALAN (ID) on delete restrict on update restrict;

alter table PENJUALAN add constraint FK_RELATIONSHIP_2 foreign key (PRO_ID)
      references PRODUK (ID) on delete restrict on update restrict;

alter table PRODUK add constraint FK_RELATIONSHIP_1 foreign key (JEN_ID)
      references JENIS_PRODUK (ID) on delete restrict on update restrict;

alter table PRODUK add constraint FK_RELATIONSHIP_6 foreign key (TOK_ID, PRO_ID)
      references STOK (TOK_ID, PRO_ID) on delete restrict on update restrict;

alter table STOK add constraint FK_RELATIONSHIP_5 foreign key (TOK_ID)
      references TOKO (ID) on delete restrict on update restrict;

alter table STOK add constraint FK_RELATIONSHIP_6 foreign key (PRO_ID)
      references PRODUK (ID) on delete restrict on update restrict;

