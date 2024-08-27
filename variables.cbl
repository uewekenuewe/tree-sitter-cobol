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
       01  FIRST-NUMBER    PICTURE IS 99.
       01  SECOND-NUMBER   PICTURE IS 99.
       01  THRID-Number.
            05 ws-var1 pic x(10).
            05 ws-var2 pic x(10).
       01  RESULT          PICTURE IS 9999.
       PROCEDURE DIVISION.
       
       MAIN-PROCEDURE.
 
           DISPLAY "Hello, Please enter a two digit number. "
           ACCEPT FIRST-NUMBER.
 
           DISPLAY "Enter a second number."
           ACCEPT SECOND-NUMBER.
 
           COMPUTE RESULT = FIRST-NUMBER +  SECOND-NUMBER.
 
           DISPLAY "The result is:".
           DISPLAY RESULT.
 
           STOP RUN.
       END PROGRAM variables.
