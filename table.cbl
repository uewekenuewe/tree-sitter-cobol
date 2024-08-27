      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. variables.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 ws-table.
           05 ws-row occurs 10 times.
               10 ws-row-data pic x(10) value space.
       01 ws-var1 pic x(04).
       01 ws-var2 pic x(04).
       PROCEDURE DIVISION.
       
       MAIN-PROCEDURE.

           move 'xxx' to ws-row-data(1)

           display ws-row-data
 
           STOP RUN.
       END PROGRAM variables.
