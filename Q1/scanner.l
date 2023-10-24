%{
  #include <stdio.h>
  #include "parser.tab.h"
%}

id [a-zA-Z0-9]+
operators [\+\-\/\*\%]
parantheses [()]

%%
{id} { yylval.value= yytext[0]; return NUMBER; }
{operators} { return yytext[0]; }
{parantheses} { return yytext[0]; }
[ \t\n] { }
. { printf("Invalid operator entered! %s",yytext); }
%%
int yywrap(){
  return 1;
}

