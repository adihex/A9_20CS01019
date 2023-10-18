%{
  #include"parse.tab.h"
%}

digits [0-9]+
operators [\+\-\/\*\%]
parantheses [()]

%%
{digits} { yylval.value= atoi(yytext); return NUMBER; }
{operators} { return yytext[0]; }
{parantheses} { return yytext[0]; }
[\t\n] { return 0; }
. { printf("Invalid operator entered! %s",yytext); }
%%
int yywrap(){
  return 1;
}
