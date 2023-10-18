%{ 
  #include "y.tab.h"
%}


id 			[a-z]
operators 	[\+\*\-\/]
parantheses [()]

%% 
{id} 			{ 
					yylval.Value = yytext[0];
					return ID; 
		 		} 
{operators} 	{ return yytext[0]; } 
{parantheses} 	{ return yytext[0]; }
[\t\n ]     	{ return 0; }
.				{ printf("Invalid operator\n %s", yytext); 
                  exit(0); }
%% 

int yywrap() 
{ 
	return 1; 
}