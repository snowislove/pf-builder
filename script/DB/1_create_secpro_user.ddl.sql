--#1 create default tablespace
CREATE TABLESPACE secpro_default_ts
DATAFILE  'd:/opt/oracle/secpro/secpro_default_ts.dbf' SIZE 4096 M 
AUTOEXTEND ON 
EXTENT MANAGEMENT LOCAL UNIFORM SIZE 1 M;
--#2 create temp tablesepce
CREATE TEMPORARY TABLESPACE secpro_temp_ts
TEMPFILE  'd:/opt/oracle/secpro/secpro_temp_ts.dbf' SIZE 4096 M 
AUTOEXTEND ON 
EXTENT MANAGEMENT LOCAL UNIFORM SIZE 1 M;

--#3 create the user
CREATE USER secpro
  IDENTIFIED BY secpro
  DEFAULT TABLESPACE secpro_default_ts
  TEMPORARY TABLESPACE secpro_temp_ts
  PROFILE DEFAULT
  ACCOUNT UNLOCK;
  
  GRANT DBA TO secpro;
  GRANT RESOURCE TO secpro;
  ALTER USER secpro DEFAULT ROLE ALL;
  GRANT SELECT ANY TABLE TO secpro;
  GRANT UNLIMITED TABLESPACE TO secpro;
  GRANT CREATE ANY TABLE to secpro;
