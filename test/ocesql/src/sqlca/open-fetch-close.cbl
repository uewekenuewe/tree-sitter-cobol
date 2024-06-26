       IDENTIFICATION              DIVISION.
      ******************************************************************
       PROGRAM-ID.                 prog.
      ******************************************************************
       DATA                        DIVISION.
      ******************************************************************
       WORKING-STORAGE             SECTION.
       01 TEST-DATA.
         03 FILLER PIC X(9) VALUE "0001____1".
         03 FILLER PIC X(9) VALUE "0002____2".
         03 FILLER PIC X(9) VALUE "0003____3".
         03 FILLER PIC X(9) VALUE "0004____4".
         03 FILLER PIC X(9) VALUE "0005____5".

       01 TEST-DATA-R REDEFINES TEST-DATA.
         03 TEST-TBL OCCURS 5.
           05 TEST-ID PIC 9(4).
           05 TEST-V  PIC X(5).

       01 IDX PIC 9.

       01 READ-DATA.
         03  READ-TBL    OCCURS  1.
           05  READ-V PIC X(5).

       EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01 DATA-ID PIC 9(4).
       01 DATA-V PIC X(5).
       01  DBNAME                  PIC  X(30) VALUE SPACE.
       01  USERNAME                PIC  X(30) VALUE SPACE.
       01  PASSWD                  PIC  X(10) VALUE SPACE.
       EXEC SQL END DECLARE SECTION END-EXEC.

       EXEC SQL INCLUDE SQLCA END-EXEC.

      ******************************************************************
       PROCEDURE                   DIVISION.
      ******************************************************************
       MAIN-RTN.
           
       PERFORM SETUP-DB.

       EXEC SQL 
         DECLARE C CURSOR FOR
           SELECT V 
           FROM TESTTABLE
           ORDER BY ID
       END-EXEC.

       EXEC SQL
         OPEN C
       END-EXEC.
       PERFORM SHOW-STATUS.

       EXEC SQL
         OPEN CC
       END-EXEC.
       PERFORM SHOW-STATUS.

       EXEC SQL
         FETCH C INTO :DATA-V
       END-EXEC.
       PERFORM SHOW-STATUS.

       EXEC SQL
         FETCH CC INTO :DATA-V
       END-EXEC.
       PERFORM SHOW-STATUS.

       EXEC SQL
         CLOSE C
       END-EXEC.
       PERFORM SHOW-STATUS.

       EXEC SQL
         CLOSE CC
       END-EXEC.
       PERFORM SHOW-STATUS.

       PERFORM CLEANUP-DB.

       STOP RUN.

      ******************************************************************
       SETUP-DB.
      ******************************************************************

           MOVE  "<|DB_NAME|>@<|DB_HOST|>:<|DB_PORT|>"
             TO DBNAME.
           MOVE  "<|DB_USER|>"
             TO USERNAME.
           MOVE  "<|DB_PASSWORD|>"
             TO PASSWD.

           EXEC SQL
               CONNECT :USERNAME IDENTIFIED BY :PASSWD USING :DBNAME 
           END-EXEC.

           EXEC SQL
               DROP TABLE IF EXISTS TESTTABLE
           END-EXEC.

           EXEC SQL
               CREATE TABLE TESTTABLE
               (
                 ID integer,
                 V  char(5)
               )
           END-EXEC.


           PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > 5
             MOVE TEST-ID(IDX) TO DATA-ID
             MOVE TEST-V(IDX) TO DATA-V
             EXEC SQL
               INSERT INTO TESTTABLE VALUES
                 (:DATA-ID, :DATA-V)
             END-EXEC
           END-PERFORM.

      ******************************************************************
       CLEANUP-DB.
      ******************************************************************

           EXEC SQL
               DISCONNECT ALL
           END-EXEC.

      ******************************************************************
       SHOW-STATUS.
      ******************************************************************
           DISPLAY SQLCODE.
           DISPLAY SQLSTATE.

