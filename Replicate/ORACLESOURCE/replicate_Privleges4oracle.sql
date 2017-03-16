--------------create user--------------------------
drop user ARUSER;
create user ARUSER identified by ARUSER ;
-------------grant base privilege-------------------
grant connect                            to ARUSER;
grant CREATE SESSION                     to ARUSER;
grant SELECT ANY TRANSACTION             to ARUSER;              
grant SELECT  on SYS.ALL_CATALOG         to ARUSER;
grant SELECT  on SYS.ALL_CONSTRAINTS     to ARUSER;
grant SELECT  on SYS.ALL_CONS_COLUMNS    to ARUSER;
grant SELECT  on SYS.ALL_INDEXES         to ARUSER;
grant SELECT  on SYS.ALL_IND_COLUMNS     to ARUSER;
grant SELECT  on SYS.ALL_LOG_GROUPS      to ARUSER;
grant SELECT  on SYS.ALL_OBJECTS         to ARUSER;
grant SELECT  on SYS.ALL_TABLES          to ARUSER;
grant SELECT  on SYS.ALL_TAB_COLS        to ARUSER;
grant SELECT  on SYS.ALL_USERS           to ARUSER;
grant SELECT  on SYS.DBA_OBJECTS         to ARUSER;  --- Required if the Oracle version is earlier than 11.2.0.3.
grant SELECT  on SYS.DBA_REGISTRY        to ARUSER;
grant SELECT  on SYS.V_$ARCHIVED_LOG     to ARUSER;
grant SELECT  on SYS.V_$DATABASE         to ARUSER;
grant SELECT  on SYS.V_$LOG              to ARUSER;
grant SELECT  on SYS.V_$LOGFILE          to ARUSER;
grant SELECT  on SYS.V_$NLS_PARAMETERS   to ARUSER;
grant SELECT  on SYS.V_$PARAMETER        to ARUSER;
grant SELECT  on SYS.V_$THREAD           to ARUSER;
grant SELECT  on SYS.V_$TIMEZONE_NAMES   to ARUSER;
grant SELECT  on SYS.V_$TRANSACTION      to ARUSER;
grant SELECT  on SYS.OBJ$                to ARUSER;
grant SELECT  on SYS.ENC$                to ARUSER;
grant SELECT  on DBA_TABLESPACES         to ARUSER;
grant SELECT  on ALL_TAB_PARTITIONS      to ARUSER;
grant SELECT  on ALL_ENCRYPTED_COLUMNS   to ARUSER;

grant SELECT  on ALL_VIEWS               to ARUSER;

grant SELECT ANY TABLE                   to ARUSER;-- This is for pattern selection
grant ALTER ANY TABLE                    to ARUSER;-- This is used when automaticall add supplemental log.

--use logmnr access log
grant EXECUTE on SYS.DBMS_LOGMNR         to ARUSER;
grant SELECT  on SYS.V_$LOGMNR_CONTENTS  to ARUSER;
grant SELECT  on SYS.V_$LOGMNR_LOGS      to ARUSER;
--grant LOGMINING                         to ARUSER; --This privilege is only required for Oracle 12c and above

--use binary Reader to Access Log
grant SELECT on v_$transportable_platform to ARUSER;
grant CREATE ANY DIRECTORY               to ARUSER;
-- Create directory 
-- AR Binary Reader should work with Oracle Standby DB, you need define the directories manually before AR task startup. For your scenario, you need define at least 3 directories include: 
-- 1- The directory of the ONLINE redo log 
-- 2- The directory of the ARCHIVED redo log 
-- 3- The directory of the alternative ARCHIVED redo log (for example on NAS device) 

--  Please note: 
--  1. The directory name should NOT start with "ATTUREP_" 
--  2. The directory should be defined by the as same account as AR database connection string OR grant read to ARUSER.
--  3. AR doesn't need a dedicated directory name for each task, one directory definition can be shared by multiple tasks. 
--  4. You need not define directory ATTUREP_TEST 
--  

-- create or replace directory <DB>_ATTU_ONLINE as '<ONLINEREDO_PATH>'
-- create or replace directory <DB>_ATTU_ARCHIVE as '_ATTU_ARCHIVE'
-- create or replace directory <DB>_ATTU_ALTERNATIVE as '_ATTU_ALTERNATIVE'
-- GRANT SELECT ON dba_directories TO ARUSER; 
 
 --For ASM REDO log copy

grant EXECUTE ON DBMS_FILE_TRANSFER       to ARUSER;
grant EXECUTE ON DBMS_FILE_GROUP          to ARUSER;
