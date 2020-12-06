%{
    #include <stdio.h>
    #include <stdlib.h>

    extern FILE * yyin;

    int yylex();
    int yyerror(char *);
%}

%expect 1

%token NUM

%token T_ELSE
%token T_IF
%token T_INT
%token T_RETURN
%token T_VOID
%token T_WHILE

%token ID

%token T_DIFF
%token T_ATRIB
%token T_EQ
%token T_LTEQ
%token T_GTEQ
%token T_LT
%token T_GT
%token T_COMMA
%token T_SEMICOLLON
%token T_PAR_ESQ
%token T_PAR_DIR
%token T_CHV_ESQ
%token T_CHV_DIR
%token T_COL_ESQ
%token T_COL_DIR
%token OP_PLUS
%token OP_MINUS
%token OP_MULT
%token OP_DIV

%token ERROR



%%

program : init_state;

init_state : declaration-list;


declaration-list : declaration-list declaration
                 | declaration
                 ;


declaration : var-declaration
            | fun-declaration
            ;


var-declaration : type-specifier ID ; 
                | type-specifier ID T_COL_ESQ  NUM T_COL_DIR ;
                ;


type-specifier  : T_INT
                | T_VOID
                ;


fun-declaration : type-specifier ID T_PAR_ESQ params T_PAR_DIR compound-stmt;


params      : param-list
            | T_VOID
            ;


param-list      : param-list T_COMMA param
                | param
                ;


param       : type-specifier ID
            | type-specifier ID T_COL_ESQ T_COL_DIR 
            ;


compound-stmt : T_CHV_ESQ local-declarations statement-list T_CHV_DIR ;



local-declarations  : local-declarations var-declaration 
                    |  var-declaration 
                    ;


statement-list  : statement-list statement
                |  statement
                ;



statement   : expression-stmt 
            | compound-stmt
            | selection-stmt
            | iteration-stmt
            | return-stmt
            ;



expression-stmt : expression T_SEMICOLLON
                | T_SEMICOLLON
                ;



selection-stmt  : T_IF T_PAR_ESQ expression T_PAR_DIR statement 
                | T_IF T_PAR_ESQ expression T_PAR_DIR statement T_ELSE statement
                ;






iteration-stmt : T_WHILE T_PAR_ESQ expression T_PAR_DIR statement;



return-stmt : T_RETURN T_SEMICOLLON
            | T_RETURN expression T_SEMICOLLON
            ;


expression  : var T_ATRIB expression 
            | simple-expression
            ;


var : ID 
    | ID T_COL_ESQ expression T_COL_DIR
    ;


simple-expression   : additive-expression relop additive-expression
                    | additive-expression
                    ;


relop   : T_LTEQ
        | T_LT 
        | T_GT
        | T_GTEQ
        | T_EQ 
        | T_DIFF
        ;


additive-expression : additive-expression addop term 
                    | term
                    ;


addop   : OP_PLUS 
        | OP_MINUS
        ;


term    : term mulop factor 
        | factor
        ;


mulop   : OP_MULT 
        | OP_DIV
        ;


factor  : T_PAR_ESQ expression T_PAR_DIR
        | var 
        | call 
        | NUM
        ;


call : ID T_PAR_ESQ args T_PAR_DIR;

args    : arg-list 
        |  /* empty */
        ;

arg-list    : arg-list T_COMMA expression 
            | expression
            ;

%%




main(int argc, char **argv) {
    
   


        if(yyparse()==0) {
                printf("Parse successful!\n");
        } else {
                printf("Parse failed.\n");
        }   
        


         

      
}

yyerror(char *s) {

    fprintf(stderr, "errorr: %s\n", s);
}


