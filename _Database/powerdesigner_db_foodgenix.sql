/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     11/19/2017 9:14:52 PM                        */
/*==============================================================*/


DROP TABLE IF EXISTS DB_FOODGENIX.BLOCK;

DROP TABLE IF EXISTS DB_FOODGENIX.COMMENT;

DROP TABLE IF EXISTS DB_FOODGENIX.COMMENT_HASHTAG;

DROP TABLE IF EXISTS DB_FOODGENIX.COMPANY;

DROP TABLE IF EXISTS DB_FOODGENIX.EXCHANGE_VOUCHER;

DROP TABLE IF EXISTS DB_FOODGENIX.EXCHANGE_VOUCHER_CODE;

DROP TABLE IF EXISTS DB_FOODGENIX.FAVORITE;

DROP TABLE IF EXISTS DB_FOODGENIX.FOLLOW;

DROP TABLE IF EXISTS DB_FOODGENIX.HASHTAG;

DROP TABLE IF EXISTS DB_FOODGENIX.LOCATION;

DROP TABLE IF EXISTS DB_FOODGENIX.LOG;

DROP TABLE IF EXISTS DB_FOODGENIX.MENTION;

DROP TABLE IF EXISTS DB_FOODGENIX.PHOTO_TAG;

DROP TABLE IF EXISTS DB_FOODGENIX.POINT_ADD;

DROP TABLE IF EXISTS DB_FOODGENIX.POST;

DROP TABLE IF EXISTS DB_FOODGENIX.POST_VIEW;

DROP TABLE IF EXISTS DB_FOODGENIX.REPORT;

DROP TABLE IF EXISTS DB_FOODGENIX.SEARCH;

DROP TABLE IF EXISTS DB_FOODGENIX.SETTING;

DROP TABLE IF EXISTS DB_FOODGENIX.USER;

DROP TABLE IF EXISTS DB_FOODGENIX.USER_LIKE;

DROP TABLE IF EXISTS DB_FOODGENIX.USER_VIEW;

DROP TABLE IF EXISTS DB_FOODGENIX.USER_VOUCHER;

DROP TABLE IF EXISTS DB_FOODGENIX.VOUCHER;

DROP TABLE IF EXISTS DB_FOODGENIX.VOUCHER_CODE;

/*==============================================================*/
/* Table: BLOCK                                                 */
/*==============================================================*/
CREATE TABLE DB_FOODGENIX.BLOCK
(
   ID                   VARCHAR(255) NOT NULL,
   USER_ID              VARCHAR(10) NOT NULL,
   USER_BLOCKED_ID      VARCHAR(10) NOT NULL,
   CREATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   UPDATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   DELETED_AT           TIMESTAMP,
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: COMMENT                                               */
/*==============================================================*/
CREATE TABLE DB_FOODGENIX.COMMENT
(
   ID                   VARCHAR(10) NOT NULL,
   USER_ID              VARCHAR(10) NOT NULL,
   POST_ID              VARCHAR(10) NOT NULL,
   COMMENT_TEXT         VARCHAR(255) NOT NULL,
   CREATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   UPDATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   DELETED_AT           TIMESTAMP,
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: COMMENT_HASHTAG                                       */
/*==============================================================*/
CREATE TABLE DB_FOODGENIX.COMMENT_HASHTAG
(
   ID                   VARCHAR(10) NOT NULL,
   COMMENT_ID           VARCHAR(10) NOT NULL,
   HASHTAG_ID           VARCHAR(10) NOT NULL,
   CREATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   UPDATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   DELETED_AT           TIMESTAMP,
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: COMPANY                                               */
/*==============================================================*/
CREATE TABLE DB_FOODGENIX.COMPANY
(
   ID                   VARCHAR(10) NOT NULL,
   NAME                 VARCHAR(100) NOT NULL,
   ADDRESS              VARCHAR(255) NOT NULL,
   CITY                 VARCHAR(100) NOT NULL,
   STATE                VARCHAR(100) NOT NULL,
   PHONE_NUMBER         VARCHAR(20),
   CP_NAME              VARCHAR(100),
   CP_PHONE_NUMBER      VARCHAR(20),
   CREATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   UPDATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   DELETED_AT           TIMESTAMP,
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: EXCHANGE_VOUCHER                                      */
/*==============================================================*/
CREATE TABLE DB_FOODGENIX.EXCHANGE_VOUCHER
(
   ID                   VARCHAR(10) NOT NULL,
   VOUCHER_ID           VARCHAR(10) NOT NULL,
   USER_ID              VARCHAR(10) NOT NULL,
   COUNT                INT(10) NOT NULL DEFAULT 1,
   REAL_PRICE           INT(10) NOT NULL,
   FOODGENIX_PRICE      INT(10) NOT NULL,
   REAL_TOTAL           INT(15) NOT NULL,
   FOODGENIX_TOTAL      INT(15) NOT NULL,
   CREATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   UPDATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   DELETED_AT           TIMESTAMP,
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: EXCHANGE_VOUCHER_CODE                                 */
/*==============================================================*/
CREATE TABLE DB_FOODGENIX.EXCHANGE_VOUCHER_CODE
(
   ID                   VARCHAR(255) NOT NULL,
   EXCHANGE_VOUCHER_ID  VARCHAR(10) NOT NULL,
   VOUCHER_CODE_ID      VARCHAR(255) NOT NULL,
   CREATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   UPDATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   DELETED_AT           TIMESTAMP,
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: FAVORITE                                              */
/*==============================================================*/
CREATE TABLE DB_FOODGENIX.FAVORITE
(
   ID                   VARCHAR(10) NOT NULL,
   POST_ID              VARCHAR(10) NOT NULL,
   USER_ID              VARCHAR(10) NOT NULL,
   CREATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   UPDATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   DELETED_AT           TIMESTAMP,
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: FOLLOW                                                */
/*==============================================================*/
CREATE TABLE DB_FOODGENIX.FOLLOW
(
   ID                   VARCHAR(255) NOT NULL,
   USER_ID              VARCHAR(10) NOT NULL,
   USER_FOLLOWED_ID     VARCHAR(10) NOT NULL,
   CREATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   UPDATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   DELETED_AT           TIMESTAMP,
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: HASHTAG                                               */
/*==============================================================*/
CREATE TABLE DB_FOODGENIX.HASHTAG
(
   ID                   VARCHAR(10) NOT NULL,
   TEXT                 VARCHAR(255) NOT NULL,
   CREATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   UPDATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   DELETED_AT           TIMESTAMP,
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: LOCATION                                              */
/*==============================================================*/
CREATE TABLE DB_FOODGENIX.LOCATION
(
   ID                   VARCHAR(10) NOT NULL,
   NAME                 VARCHAR(255) NOT NULL,
   LATITUDE             DOUBLE NOT NULL,
   LONGITUDE            DOUBLE NOT NULL,
   GOOGLE_MAP_LINK      VARCHAR(255) NOT NULL,
   CREATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   UPDATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   DELETED_AT           TIMESTAMP,
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: LOG                                                   */
/*==============================================================*/
CREATE TABLE DB_FOODGENIX.LOG
(
   ID                   VARCHAR(10) NOT NULL,
   USER_ID              VARCHAR(10) NOT NULL,
   TEXT                 VARCHAR(255) NOT NULL,
   CREATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   UPDATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   DELETED_AT           TIMESTAMP,
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: MENTION                                               */
/*==============================================================*/
CREATE TABLE DB_FOODGENIX.MENTION
(
   ID                   VARCHAR(10) NOT NULL,
   COMMENT_ID           VARCHAR(10) NOT NULL,
   USER_ID              VARCHAR(10) NOT NULL,
   CREATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   UPDATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   DELETED_AT           TIMESTAMP,
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: PHOTO_TAG                                             */
/*==============================================================*/
CREATE TABLE DB_FOODGENIX.PHOTO_TAG
(
   ID                   VARCHAR(10) NOT NULL,
   POST_ID              VARCHAR(10) NOT NULL,
   USER_ID              VARCHAR(10) NOT NULL,
   X_COORDINATE         INT(5) NOT NULL,
   Y_COORDINATE         INT(5) NOT NULL,
   CREATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   UPDATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   DELETED_AT           TIMESTAMP,
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: POINT_ADD                                             */
/*==============================================================*/
CREATE TABLE DB_FOODGENIX.POINT_ADD
(
   ID                   VARCHAR(10) NOT NULL,
   USER_ID              VARCHAR(10) NOT NULL,
   USER_LIKE_ID         VARCHAR(10) NOT NULL,
   COUNT                INT(7) NOT NULL DEFAULT 0,
   CREATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   UPDATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   DELETED_AT           TIMESTAMP,
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: POST                                                  */
/*==============================================================*/
CREATE TABLE DB_FOODGENIX.POST
(
   ID                   VARCHAR(10) NOT NULL,
   USER_ID              VARCHAR(10) NOT NULL,
   POST_URL             VARCHAR(255) NOT NULL,
   PHOTO_URL            VARCHAR(255) NOT NULL,
   CAPTION_ID           VARCHAR(10),
   LOCATION_ID          VARCHAR(10),
   LAST_COMMENT_ID      VARCHAR(10),
   SECOND_LAST_COMMENT_ID VARCHAR(10),
   LIKE_COUNT           INT(15) NOT NULL DEFAULT 0,
   COMMENT_COUNT        INT(15) NOT NULL DEFAULT 0,
   IS_PROMOTION         TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0 not, 1 yes',
   IS_VIDEO             TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0 not, 1 yes',
   CREATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   UPDATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   DELETED_AT           TIMESTAMP,
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: POST_VIEW                                             */
/*==============================================================*/
CREATE TABLE DB_FOODGENIX.POST_VIEW
(
   ID                   VARCHAR(255) NOT NULL,
   USER_ID              VARCHAR(10) NOT NULL,
   POST_VIEWED_ID       VARCHAR(10) NOT NULL,
   CREATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   UPDATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   DELETED_AT           TIMESTAMP,
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: REPORT                                                */
/*==============================================================*/
CREATE TABLE DB_FOODGENIX.REPORT
(
   ID                   VARCHAR(255) NOT NULL,
   POST_ID              VARCHAR(10) NOT NULL,
   USER_ID              VARCHAR(10) NOT NULL,
   REASON               VARCHAR(255) NOT NULL,
   CREATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   UPDATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   DELETED_AT           TIMESTAMP,
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: SEARCH                                                */
/*==============================================================*/
CREATE TABLE DB_FOODGENIX.SEARCH
(
   ID                   VARCHAR(10) NOT NULL,
   USER_ID              VARCHAR(10) NOT NULL,
   KEYWORD              VARCHAR(255) NOT NULL,
   TYPE                 INT(1) NOT NULL DEFAULT 0 COMMENT '0 user, 1 hashtag, 2 place',
   CREATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   UPDATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   DELETED_AT           TIMESTAMP,
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: SETTING                                               */
/*==============================================================*/
CREATE TABLE DB_FOODGENIX.SETTING
(
   ID                   VARCHAR(10) NOT NULL,
   LANGUAGE             VARCHAR(10) NOT NULL DEFAULT 'ID',
   PRIVATE_ACCOUNT      TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0 not, 1 yes',
   LIKE_NOTIFICATION    TINYINT(1) NOT NULL DEFAULT 1 COMMENT '0 not, 1 yes',
   COMMENT_NOTIFICATION TINYINT(1) NOT NULL DEFAULT 1 COMMENT '0 not, 1 yes',
   TAG_NOTIFICATION     TINYINT(1) NOT NULL DEFAULT 1 COMMENT '0 not, 1 yes',
   MENTION_NOTIFICATION TINYINT(1) NOT NULL DEFAULT 1 COMMENT '0 not, 1 yes',
   LIKE_COMMENT_TAGGED_NOTIFICATION TINYINT(1) NOT NULL DEFAULT 1 COMMENT '0 not, 1 yes',
   NEW_FOLLOWER_NOTIFICATION TINYINT(1) NOT NULL DEFAULT 1 COMMENT '0 not, 1 yes',
   SAVE_ORIGINAL_PHOTO  TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0 not, 1 yes',
   CREATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   UPDATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   DELETED_AT           TIMESTAMP,
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: USER                                                  */
/*==============================================================*/
CREATE TABLE DB_FOODGENIX.USER
(
   ID                   VARCHAR(10) NOT NULL,
   USERNAME             VARCHAR(50) NOT NULL,
   PASSWORD             VARCHAR(255) NOT NULL,
   NAME                 VARCHAR(255) NOT NULL,
   EMAIL                VARCHAR(100) NOT NULL,
   PHONE_NUMBER         VARCHAR(20) NOT NULL,
   GENDER               TINYINT(1) NOT NULL COMMENT '1 male, 0 female',
   BIRTHDATE            DATE NOT NULL,
   FACEBOOK_ID          VARCHAR(255),
   GOOGLE_ID            VARCHAR(255),
   POST_COUNT           INT(15) NOT NULL DEFAULT 0,
   FOLLOWER_COUNT       INT(15) NOT NULL DEFAULT 0,
   FOLLOWING_COUNT      INT(15) NOT NULL DEFAULT 0,
   PHOTO_URL            VARCHAR(255),
   BIO                  VARCHAR(255) NOT NULL,
   FOODGENIX_POINTS     INT(15) NOT NULL DEFAULT 0,
   IS_RESTAURANT        TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0 not, 1 yes',
   SETTING_ID           VARCHAR(10) NOT NULL,
   CREATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   UPDATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   DELETED_AT           TIMESTAMP,
   PRIMARY KEY (ID),
   KEY FACEBOOK_ID (FACEBOOK_ID),
   KEY GOOGLE_ID (GOOGLE_ID),
   KEY SETTING_ID (SETTING_ID),
   KEY USERNAME (USERNAME)
);

/*==============================================================*/
/* Table: USER_LIKE                                             */
/*==============================================================*/
CREATE TABLE DB_FOODGENIX.USER_LIKE
(
   ID                   VARCHAR(10) NOT NULL,
   POST_ID              VARCHAR(10) NOT NULL,
   USER_ID              VARCHAR(10) NOT NULL,
   CREATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   UPDATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   DELETED_AT           TIMESTAMP,
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: USER_VIEW                                             */
/*==============================================================*/
CREATE TABLE DB_FOODGENIX.USER_VIEW
(
   ID                   VARCHAR(255) NOT NULL,
   USER_ID              VARCHAR(10) NOT NULL,
   USER_VIEWED_ID       VARCHAR(10) NOT NULL,
   CREATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   UPDATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   DELETED_AT           TIMESTAMP,
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: USER_VOUCHER                                          */
/*==============================================================*/
CREATE TABLE DB_FOODGENIX.USER_VOUCHER
(
   ID                   VARCHAR(10) NOT NULL,
   USER_ID              VARCHAR(10) NOT NULL,
   VOUCHER_CODE_ID      VARCHAR(255) NOT NULL,
   CREATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   UPDATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   DELETED_AT           TIMESTAMP,
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: VOUCHER                                               */
/*==============================================================*/
CREATE TABLE DB_FOODGENIX.VOUCHER
(
   ID                   VARCHAR(10) NOT NULL,
   COMPANY_ID           VARCHAR(10) NOT NULL,
   NAME                 VARCHAR(255) NOT NULL,
   DESCRIPTION          VARCHAR(255) NOT NULL,
   REAL_PRICE           INT(10) NOT NULL,
   FOODGENIX_PRICE      INT(10) NOT NULL,
   START_STOCK          INT(10) NOT NULL,
   REMAINING_STOCK      INT(10) NOT NULL,
   MAX_BUY              INT(10) NOT NULL,
   EXP_DATE             DATE,
   CREATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   UPDATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   DELETED_AT           TIMESTAMP,
   PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: VOUCHER_CODE                                          */
/*==============================================================*/
CREATE TABLE DB_FOODGENIX.VOUCHER_CODE
(
   ID                   VARCHAR(255) NOT NULL,
   VOUCHER_ID           VARCHAR(10) NOT NULL,
   CODE                 VARCHAR(255) NOT NULL,
   REDEEM_DATETIME      TIMESTAMP,
   EXP_DATE             DATE,
   CREATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   UPDATED_AT           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   DELETED_AT           TIMESTAMP,
   PRIMARY KEY (ID)
);

ALTER TABLE DB_FOODGENIX.BLOCK ADD CONSTRAINT FK_REFERENCE_16 FOREIGN KEY (USER_BLOCKED_ID)
      REFERENCES DB_FOODGENIX.USER (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.BLOCK ADD CONSTRAINT FK_REFERENCE_17 FOREIGN KEY (USER_ID)
      REFERENCES DB_FOODGENIX.USER (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.COMMENT ADD CONSTRAINT FK_REFERENCE_6 FOREIGN KEY (POST_ID)
      REFERENCES DB_FOODGENIX.POST (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.COMMENT ADD CONSTRAINT FK_REFERENCE_7 FOREIGN KEY (USER_ID)
      REFERENCES DB_FOODGENIX.USER (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.COMMENT_HASHTAG ADD CONSTRAINT FK_REFERENCE_23 FOREIGN KEY (COMMENT_ID)
      REFERENCES DB_FOODGENIX.COMMENT (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.COMMENT_HASHTAG ADD CONSTRAINT FK_REFERENCE_24 FOREIGN KEY (HASHTAG_ID)
      REFERENCES DB_FOODGENIX.HASHTAG (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.EXCHANGE_VOUCHER ADD CONSTRAINT FK_REFERENCE_35 FOREIGN KEY (VOUCHER_ID)
      REFERENCES DB_FOODGENIX.VOUCHER (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.EXCHANGE_VOUCHER ADD CONSTRAINT FK_REFERENCE_36 FOREIGN KEY (USER_ID)
      REFERENCES DB_FOODGENIX.USER (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.EXCHANGE_VOUCHER_CODE ADD CONSTRAINT FK_REFERENCE_37 FOREIGN KEY (EXCHANGE_VOUCHER_ID)
      REFERENCES DB_FOODGENIX.EXCHANGE_VOUCHER (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.EXCHANGE_VOUCHER_CODE ADD CONSTRAINT FK_REFERENCE_38 FOREIGN KEY (VOUCHER_CODE_ID)
      REFERENCES DB_FOODGENIX.VOUCHER_CODE (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.FAVORITE ADD CONSTRAINT FK_REFERENCE_29 FOREIGN KEY (USER_ID)
      REFERENCES DB_FOODGENIX.USER (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.FAVORITE ADD CONSTRAINT FK_REFERENCE_30 FOREIGN KEY (POST_ID)
      REFERENCES DB_FOODGENIX.POST (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.FOLLOW ADD CONSTRAINT FK_REFERENCE_14 FOREIGN KEY (USER_FOLLOWED_ID)
      REFERENCES DB_FOODGENIX.USER (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.FOLLOW ADD CONSTRAINT FK_REFERENCE_15 FOREIGN KEY (USER_ID)
      REFERENCES DB_FOODGENIX.USER (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.LOG ADD CONSTRAINT FK_REFERENCE_20 FOREIGN KEY (USER_ID)
      REFERENCES DB_FOODGENIX.USER (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.MENTION ADD CONSTRAINT FK_REFERENCE_25 FOREIGN KEY (COMMENT_ID)
      REFERENCES DB_FOODGENIX.COMMENT (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.MENTION ADD CONSTRAINT FK_REFERENCE_26 FOREIGN KEY (USER_ID)
      REFERENCES DB_FOODGENIX.USER (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.PHOTO_TAG ADD CONSTRAINT FK_REFERENCE_10 FOREIGN KEY (USER_ID)
      REFERENCES DB_FOODGENIX.USER (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.PHOTO_TAG ADD CONSTRAINT FK_REFERENCE_9 FOREIGN KEY (POST_ID)
      REFERENCES DB_FOODGENIX.POST (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.POINT_ADD ADD CONSTRAINT FK_REFERENCE_31 FOREIGN KEY (USER_ID)
      REFERENCES DB_FOODGENIX.USER (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.POINT_ADD ADD CONSTRAINT FK_REFERENCE_32 FOREIGN KEY (USER_LIKE_ID)
      REFERENCES DB_FOODGENIX.USER_LIKE (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.POST ADD CONSTRAINT FK_REFERENCE_1 FOREIGN KEY (USER_ID)
      REFERENCES DB_FOODGENIX.USER (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.POST ADD CONSTRAINT FK_REFERENCE_3 FOREIGN KEY (CAPTION_ID)
      REFERENCES DB_FOODGENIX.COMMENT (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.POST ADD CONSTRAINT FK_REFERENCE_4 FOREIGN KEY (LAST_COMMENT_ID)
      REFERENCES DB_FOODGENIX.COMMENT (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.POST ADD CONSTRAINT FK_REFERENCE_5 FOREIGN KEY (SECOND_LAST_COMMENT_ID)
      REFERENCES DB_FOODGENIX.COMMENT (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.POST ADD CONSTRAINT FK_REFERENCE_8 FOREIGN KEY (LOCATION_ID)
      REFERENCES DB_FOODGENIX.LOCATION (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.POST_VIEW ADD CONSTRAINT FK_REFERENCE_18 FOREIGN KEY (USER_ID)
      REFERENCES DB_FOODGENIX.USER (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.POST_VIEW ADD CONSTRAINT FK_REFERENCE_19 FOREIGN KEY (POST_VIEWED_ID)
      REFERENCES DB_FOODGENIX.POST (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.REPORT ADD CONSTRAINT FK_REFERENCE_11 FOREIGN KEY (POST_ID)
      REFERENCES DB_FOODGENIX.POST (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.REPORT ADD CONSTRAINT FK_REFERENCE_12 FOREIGN KEY (USER_ID)
      REFERENCES DB_FOODGENIX.USER (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.SEARCH ADD CONSTRAINT FK_REFERENCE_13 FOREIGN KEY (USER_ID)
      REFERENCES DB_FOODGENIX.USER (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.USER ADD CONSTRAINT FK_REFERENCE_2 FOREIGN KEY (SETTING_ID)
      REFERENCES DB_FOODGENIX.SETTING (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.USER_LIKE ADD CONSTRAINT FK_REFERENCE_27 FOREIGN KEY (USER_ID)
      REFERENCES DB_FOODGENIX.USER (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.USER_LIKE ADD CONSTRAINT FK_REFERENCE_28 FOREIGN KEY (POST_ID)
      REFERENCES DB_FOODGENIX.POST (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.USER_VIEW ADD CONSTRAINT FK_REFERENCE_21 FOREIGN KEY (USER_VIEWED_ID)
      REFERENCES DB_FOODGENIX.USER (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.USER_VIEW ADD CONSTRAINT FK_REFERENCE_22 FOREIGN KEY (USER_ID)
      REFERENCES DB_FOODGENIX.USER (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.USER_VOUCHER ADD CONSTRAINT FK_REFERENCE_39 FOREIGN KEY (VOUCHER_CODE_ID)
      REFERENCES DB_FOODGENIX.VOUCHER_CODE (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.USER_VOUCHER ADD CONSTRAINT FK_REFERENCE_40 FOREIGN KEY (USER_ID)
      REFERENCES DB_FOODGENIX.USER (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.VOUCHER ADD CONSTRAINT FK_REFERENCE_33 FOREIGN KEY (COMPANY_ID)
      REFERENCES DB_FOODGENIX.COMPANY (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE DB_FOODGENIX.VOUCHER_CODE ADD CONSTRAINT FK_REFERENCE_34 FOREIGN KEY (VOUCHER_ID)
      REFERENCES DB_FOODGENIX.VOUCHER (ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

