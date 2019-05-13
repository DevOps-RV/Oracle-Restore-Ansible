set lines 1200
col value for a125;
SET PAGESIZE 0 FEEDBACK OFF VERIFY OFF HEADING OFF ECHO OFF
select value from v$parameter where name='control_files';
exit;