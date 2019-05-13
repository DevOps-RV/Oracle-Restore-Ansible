Role
====
ORACLE DB Restore - for STANDALONE and RAC (1-3 Node)

Requirements
------------
Source, Traget hosts should have password less SSH from Ansible Server and also able to login using hostname. (E.g.: ssh database_1)

Role Variables
--------------
DB_NAME - Name of the Database.  E.g.:database_1
DISK_GROUP - ASM Disk Group Name.  E.g.:+DATA_DG
CATALOG_SERVER - Oracle Catalog Sever address or FQDN.  E.g.:ora.catalogserver1.net
DATE_TIME - Point in time.  E.g.:'12-MAR-2019 10:20:00'
SOURCE - Source DB hostname.  E.g.: oradbprd101
TARGET - Target DB hostname.  E.g.: oradbprd201
TARGET_ORACLE_HOME - Target DB ORACLE_HOME.  E.g.: "/u01/app/oracle/product/11.2.0/dbhome_1"
CLUSTER_DATABASE - True if Rac , False if Standalone.  E.g.:'true' or 'false'
TARGET_NODE2 - for 2 Node cluster.  E.g.: oradbprd202
TARGET_NODE3 - for 3 Node Cluster.  E.g.: oradbprd203

Dependencies
------------
SOURCE and TARGET Parameters should use HOSTNAMEs not FQDN (E.g.: ssh database_1)
Update the SOURCE_ORA_ENV, ASM_ENV and TARGET_ORA_ENV in the Vars

Example Playbook
----------------
Example of how to use your role (for instance, with variables passed in as parameters):

Single Node / Standalone:
ansible-playbook oracle_restore_backup.yml --extra-vars "DB_NAME=database_1 DISK_GROUP=+DATA_DG TARGET_ORACLE_HOME='/u01/app/oracle/product/11.2.0/dbhome_1' CATALOG_SERVER=ora.catalogserver1.net DATE_TIME='12-MAR-2019 10:20:00' SOURCE=oradbprd101 TARGET=oradbprd201 CLUSTER_DATABASE=false"

Two Node Cluster:
ansible-playbook oracle_restore_backup.yml  --extra-vars "DB_NAME=database_1 DISK_GROUP=+DATA_DG TARGET_ORACLE_HOME='/u01/app/oracle/product/11.2.0/dbhome_1' CATALOG_SERVER=ora.catalogserver1.net DATE_TIME='12-MAR-2019 10:20:00' SOURCE=oradbprd101 TARGET=oradbprd201 CLUSTER_DATABASE=true TARGET_NODE2=oradbprd202"

Three Node Cluster:
ansible-playbook oracle_restore_backup.yml --extra-vars "DB_NAME=database_1 DISK_GROUP=+DATA_DG TARGET_ORACLE_HOME='/u01/app/oracle/product/11.2.0/dbhome_1' CATALOG_SERVER=ora.catalogserver1.net DATE_TIME='12-MAR-2019 10:20:00' SOURCE=oradbprd101 TARGET=oradbprd201 CLUSTER_DATABASE=true TARGET_NODE2=oradbprd202 TARGET_NODE3=oradbprd203"

Author Information
------------------
Raghu Tekumudi
