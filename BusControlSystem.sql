/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/12/6 15:05:45                           */
/*==============================================================*/


drop table if exists Bus;

drop table if exists BusLine;

drop table if exists OneTurnTask;

drop table if exists User;

/*==============================================================*/
/* Table: Bus                                                   */
/*==============================================================*/
create table Bus
(
   PlateNumber          char(8) not null,
   LineCode             varchar(4),
   BusState             varchar(20) not null,
   primary key (PlateNumber)
);

/*==============================================================*/
/* Table: BusLine                                               */
/*==============================================================*/
create table BusLine
(
   LineCode             varchar(4) not null,
   StartStation         varchar(50) not null,
   FinalStation         varchar(50) not null,
   primary key (LineCode)
);

/*==============================================================*/
/* Table: OneTurnTask                                           */
/*==============================================================*/
create table OneTurnTask
(
   LeaveTime0           int not null,
   WorkDirection        char(1) not null,
   LineCode             varchar(4),
   PlateNumber          char(8),
   PredictTime          int not null,
   ArrivalTime0         int not null,
   LeaveTime1           int,
   ActualTime           int,
   ArrivalTime1         int,
   WorkState            char(1),
   primary key (LeaveTime0, WorkDirection)
);

/*==============================================================*/
/* Table: User                                                  */
/*==============================================================*/
create table User
(
   UserID               int not null auto_increment,
   Username             varchar(50) not null,
   Password             varchar(18) not null,
   EmailAddress         varchar(50) not null,
   primary key (UserID)
);

alter table Bus add constraint FK_Have foreign key (LineCode)
      references BusLine (LineCode) on delete restrict on update restrict;

alter table OneTurnTask add constraint FK_Divide foreign key (LineCode)
      references BusLine (LineCode) on delete restrict on update restrict;

alter table OneTurnTask add constraint FK_Workfor foreign key (PlateNumber)
      references Bus (PlateNumber) on delete restrict on update restrict;

