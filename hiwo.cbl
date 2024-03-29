       IDENTIFICATION DIVISION.
       PROGRAM-ID. hello-world.
       DATA DIVISION.  
       WORKING-STORAGE SECTION.   
       01 ws-variables.
           05 var1 pic 9(03).  
           05 var2 pic x(33).
       PROCEDURE DIVISION.
           DISPLAY "Hello world!".
           Perform test-routine
           perform test-routine 
           STOP RUN.
       test-routine2 section.
           move 4 to ws-helper             
           move var to var2 
           move xoxo to xx 
           display "this test routine"
           go to test-routine
           exit.
       test-routine section.
           display "this test routine"
           exit.
