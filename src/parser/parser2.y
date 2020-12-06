selection-stmt : T_IF T_PAR_ESQ expression T_PAR_DIR statement
               | T_IF T_PAR_ESQ expression T_PAR_DIR statement T_ELSE statement
               ;


statement   : expression-stmt 
            | compound-stmt 
            | selection-stmt
            | iteration-stmt
            | return-stmt
            ;


            selection-stmt : T_IF T_PAR_ESQ expression T_PAR_DIR statement
               | T_IF T_PAR_ESQ expression T_PAR_DIR statement T_ELSE statement
               ;







matched-stmt    : T_IF T_PAR_ESQ expression T_PAR_DIR matched-stmt T_ELSE matched-stmt
                | /* */ ;
                ;

open-stmt       : T_IF T_PAR_ESQ expression T_PAR_DIR statement
                | T_IF T_PAR_ESQ expression T_PAR_DIR matched-stmt T_ELSE open-stmt