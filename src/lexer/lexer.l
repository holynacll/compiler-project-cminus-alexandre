%{
#include "parser.tab.h"

int numLines = 1;
%}

LINE_FEED (\r\n|\r|\n)

%%
"//".*  { /* ignore comment  */ }

{LINE_FEED}     { numLines++; }

[0-9]+          { return NUM; }


"else"            { return T_ELSE; }
"if"             { return T_IF; }
"int"            { return T_INT; }
"return"            { return T_RETURN; }
"void"            { return T_VOID; }
"while"            { return T_WHILE; }

[A-Za-z][A-Za-z0-9]* { return ID; }

"!="            { return T_DIFF; }
"="             { return T_ATRIB; }
"=="            { return T_EQ; }
"<="            { return T_LTEQ; }
">="            { return T_GTEQ; }
"<"             { return T_LT; }
">"             { return T_GT; }
","             { return T_COMMA; }
";"             { return T_SEMICOLLON; }
"("             { return T_PAR_ESQ; }
")"             { return T_PAR_DIR; }
"{"             { return T_CHV_ESQ; }
"}"             { return T_CHV_DIR; }
"["             { return T_COL_ESQ; }
"]"             { return T_COL_DIR; }
"+"             { return OP_PLUS; }
"-"             { return OP_MINUS; }
"*"             { return OP_MULT; }
"/"             { return OP_DIV; }

[ \t]   { /* ignore white space */ }

.               { return ERROR; }
%%


