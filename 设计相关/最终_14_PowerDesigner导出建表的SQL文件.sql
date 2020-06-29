/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/6/29 13:05:24                           */
/*==============================================================*/


drop table if exists CourseInfo;

drop table if exists Dictionary;

drop table if exists RoleInfo;

drop table if exists StudentCourse;

drop table if exists UserInfo;

drop table if exists UserMenu;

drop table if exists UserRole;

drop table if exists courseArrange;

drop table if exists loginInfo;

drop table if exists menu;

drop table if exists "数据字典-内容";

/*==============================================================*/
/* Table: CourseInfo                                            */
/*==============================================================*/
create table CourseInfo
(
   CourseId             int not null,
   CourseName           national varchar(256),
   CreateDate           datetime,
   CreateBy             national varchar(64),
   ModifyDate           datetime,
   ModifyBy             national varchar(64),
   primary key (CourseId)
);

alter table CourseInfo comment '课程基本信息';

/*==============================================================*/
/* Table: Dictionary                                            */
/*==============================================================*/
create table Dictionary
(
   DectionaryId         int not null,
   DataType             national varchar(128),
   DataValue            national varchar(128),
   DataDesc             text,
   CreateDate           datetime,
   CreateBy             national varchar(64),
   ModifyDate           datetime,
   ModifyBy             national varchar(64),
   DataKey              national varchar(0),
   primary key (DectionaryId)
);

/*==============================================================*/
/* Table: RoleInfo                                              */
/*==============================================================*/
create table RoleInfo
(
   RoleId               int not null,
   RoleName             national varchar(64),
   CreateDate           datetime,
   CreateBy             national varchar(64),
   ModifyDate           datetime,
   ModifyBy             national varchar(64),
   primary key (RoleId)
);

alter table RoleInfo comment '角色基本信息';

/*==============================================================*/
/* Table: StudentCourse                                         */
/*==============================================================*/
create table StudentCourse
(
   UserCourseID         int not null,
   UserId               int,
   CourseId             int,
   SignInStatus         int,
   CreateDate           datetime,
   CreateBy             national varchar(64),
   ModifyDate           datetime,
   ModifyBy             national varchar(64),
   primary key (UserCourseID)
);

/*==============================================================*/
/* Table: UserInfo                                              */
/*==============================================================*/
create table UserInfo
(
   UserId               int not null,
   UserName             national varchar(128),
   UserSex              national varchar(8),
   UserAccount          national varchar(64),
   UserEmail            national varchar(128),
   UserTelephone        national varchar(16),
   UserCollege          national varchar(256),
   CreateDate           datetime,
   CreateBy             national varchar(64),
   ModifyDate           datetime,
   ModifyBy             national varchar(64),
   primary key (UserId)
);

alter table UserInfo comment '用户基本信息';

/*==============================================================*/
/* Table: UserMenu                                              */
/*==============================================================*/
create table UserMenu
(
   RoleId               int,
   MenuId               int,
   UserMenuID           int,
   status               national varchar(0)
);

/*==============================================================*/
/* Table: UserRole                                              */
/*==============================================================*/
create table UserRole
(
   UserRoleId           int not null,
   RoleId               int,
   UserId               int,
   CreateDate           datetime,
   CreateBy             national varchar(64),
   ModifyDate           datetime,
   ModifyBy             national varchar(64),
   primary key (UserRoleId)
);

alter table UserRole comment '用户 角色';

/*==============================================================*/
/* Table: courseArrange                                         */
/*==============================================================*/
create table courseArrange
(
   CreateDate           datetime,
   CreateBy             national varchar(64),
   ModifyDate           datetime,
   ModifyBy             national varchar(64),
   CourseId             int,
   id                   int not null,
   courseDesc           text,
   name                 national varchar(256),
   semester             national varchar(16),
   classroom            national varchar(256),
   startSection         int,
   endSection           int,
   startWeek            int,
   endWeek              int,
   primary key (id)
);

/*==============================================================*/
/* Table: loginInfo                                             */
/*==============================================================*/
create table loginInfo
(
   UserId               int,
   id                   int,
   account              national varchar(0),
   loginDate            datetime,
   loginWay             national varchar(0),
   password             national varchar(0)
);

/*==============================================================*/
/* Table: menu                                                  */
/*==============================================================*/
create table menu
(
   MenuId               int not null,
   men_MenuId           int,
   MenuName             national varchar(256),
   MenuURL              national varchar(256),
   MenuStatus           national varchar(16),
   CreateDate           datetime,
   CreateBy             national varchar(64),
   ModifyDate           datetime,
   ModifyBy             national varchar(64),
   Code                 char(10),
   Type                 national varchar(128),
   sequence             int,
   icon                 national varchar(0),
   primary key (MenuId)
);

alter table menu comment '系统菜单权限控制';

/*==============================================================*/
/* Table: "数据字典-内容"                                             */
/*==============================================================*/
create table "数据字典-内容"
(
   DictionaryContentId  int not null,
   DectionaryId         int,
   DictionaryContentValue national varchar(128),
   DictionaryContentText national varchar(256),
   DictionaryContentStatus int,
   DictionaryContentDesc text,
   CreateDate           datetime,
   CreateBy             national varchar(64),
   ModifyDate           datetime,
   ModifyBy             national varchar(64),
   sequence             int,
   primary key (DictionaryContentId)
);

alter table StudentCourse add constraint FK_Reference_10 foreign key (CourseId)
      references CourseInfo (CourseId);

alter table StudentCourse add constraint FK_Reference_8 foreign key (UserId)
      references UserInfo (UserId);

alter table UserMenu add constraint FK_Reference_12 foreign key (RoleId)
      references RoleInfo (RoleId);

alter table UserMenu add constraint FK_Reference_13 foreign key (MenuId)
      references menu (MenuId);

alter table UserRole add constraint FK_Reference_4 foreign key (RoleId)
      references RoleInfo (RoleId);

alter table UserRole add constraint FK_Reference_7 foreign key (UserId)
      references UserInfo (UserId);

alter table courseArrange add constraint FK_Reference_11 foreign key (CourseId)
      references CourseInfo (CourseId);

alter table loginInfo add constraint FK_Reference_14 foreign key (UserId)
      references UserInfo (UserId);

alter table menu add constraint FK_Reference_5 foreign key (men_MenuId)
      references menu (MenuId);

alter table "数据字典-内容" add constraint FK_Reference_6 foreign key (DectionaryId)
      references Dictionary (DectionaryId);

