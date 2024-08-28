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
       01 var-defined    PICTURE IS 99.
       PROCEDURE DIVISION.

       MAIN-PROCEDURE.

           display var-defined
           display var-not-defined

           move var-defined to var-not-defined

           STOP RUN.
