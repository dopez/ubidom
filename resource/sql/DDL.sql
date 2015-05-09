
--########################################### SQL Server ############################################
ALTER PROCEDURE [dbo].[PROC_SEL_TBL_CD]
@schWord VARCHAR(10)
AS
BEGIN
SELECT CD, CD_NM FROM TBL_CD WHERE CD LIKE @schWord+'%'
END

--############################################# Oracle ##############################################
CREATE OR REPLACE PROCEDURE SP_SEL_SYS (
    rst out sys_refcursor
) AS
BEGIN
    OPEN rst FOR
        SELECT 
			SYS_CD,
			SYS_NM,
			VIEW_IDX,
			USE_YN,
			TOP_MENU_YN,
			TO_CHAR(CREATE_DATE, 'YYYY-MM-DD HH24:MI') STR_CDATE,
			CREATOR || '(홍길동)' STR_CUSER
		FROM 
			PO_SYS_MT
		ORDER BY VIEW_IDX;
END;

CREATE TABLE WWW.PO_SYS_MT 
(
	SYS_CD        CHAR (3) NOT NULL,
	SYS_NM        VARCHAR2 (20),
	VIEW_IDX      NUMBER (3),
	TOP_MENU_YN   CHAR (1),
	USE_YN        CHAR (1),
	CREATE_DATE   DATE,
	CREATOR       VARCHAR2 (20),
	EDIT_DATE     DATE,
	EDITOR        VARCHAR2 (20)
);

ALTER TABLE WWW.PO_SYS_MT ADD(
	CONSTRAINT PK_PO_SYS_MT PRIMARY KEY (SYS_CD));