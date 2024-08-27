       IDENTIFICATION DIVISION.
       PROGRAM-ID. variables.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
       
       MAIN-PROCEDURE.

           display 'main'
           go to verarbeitung
           STOP RUN.

       verarbeitung section. 
           display 'verarbeitung'
           exit.

       END PROGRAM variables.

