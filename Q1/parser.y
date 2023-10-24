%{
  #include<stdio.h>
  #include<stdlib.h>
  #include"Node.h"
  int yyerror();
  void displayAST(Node *X);
  int flag=0;
%}

%union {
  struct Node* Node;
  char value; 
}

%type<Node> G E T F
%type<value> NUMBER

%token NUMBER

%left '+' '-'
%left '*' '/'
%left '%'
%left '(' ')'

%start G

%%

G: E {
      $$ = $1;
      displayAST($$);
      return 0;
     };

E: E'+'T { 
           Node *plusNode = createNode (1,0,$1,$3);
           $$ = plusNode;
         }

 | E'-'T {
           Node *minusNode = createNode (1,1,$1,$3);
           $$ = minusNode;
         }
 | T     { $$ = $1; }

T: T'*'F  { 
           Node *prodNode = createNode(1,2,$1,$3);
           $$ = prodNode;
          }

 | T'/'F  { 
            if($3->value==0)
              {
              printf("ERROR!!=>Divisor cannot be zero!\n");
              return -1;
              }
            else 
              {
               Node *divNode = createNode(1,3,$1,$3);
               $$= divNode;
              }
          }

 | T'%'F  {
            if($3->value<=0)
              {
              printf("ERROR!!=>The number on which mod is taken should be positive");
              return -1;
              }
            else
              {
              Node *modNode = createNode(1,4,$1,$3);
              $$= modNode;    
              }
          }

 | F { $$ = $1; };

F: NUMBER { 
            Node *numNode = createNode(0,$1,NULL,NULL);
            $$ = numNode;
          }
 | '('E')' {
            $$ = $2;
           };
%%

void displayAST(Node *x) {
   if(x!=NULL)
   {
    printf("Preorder traversal of the AST=>\n");
    preorderTraversal(x);
    printf("\n");
    printf("Inorder traversal of the AST=>\n");
    inorderTraversal(x);
    printf("\n");
   }
}

int yyerror(){
return EXIT_FAILURE;
}
