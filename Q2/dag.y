%{ 
  #include <stdio.h>
  #include <stdlib.h>
  #include<string.h>
  #include "Node.h"
  #include "lex.yy.c"

  void yyerror();
  void print(Node *node);
  void postordertrav(Node* x, int vis[]);
  Node* process(char expr[50], int op, char type, Node* left, Node* right);


  Node* dag[50];
  int idx=0;
  int flag=0;

%}

//defining derived structures
%union {
  Node *Node;
  char Value;
}

%type<Node> G E T F
%type<Value> ID

%token ID 

/* Precedence  */
%left '+' '-'
%left '*' '/' 
%left '(' ')'


%start G

/* Rule */
%%
G: E  { 
        $$ = $1;
        print($$);
        return 0; 
      };

E: E'+'T{ 
            char buffer[50];
            sprintf(buffer,"%s + %s", $1->expr, $3->expr);
            $$ = process(buffer, 1,'+', $1, $3);

        }
|  E'-'T {
            char buffer[50];
            sprintf(buffer,"%s - %s", $1->expr, $3->expr);
            $$ = process(buffer, 1,'-', $1, $3);

        }
|  T     { $$ = $1; };

T: T'*'F { 
            char buffer[50];
            sprintf(buffer,"%s * %s", $1->expr, $3->expr);
            $$ = process(buffer, 1,'*', $1, $3);

        }
|  T'/'F { 
            char buffer[50];
            sprintf(buffer,"%s / %s", $1->expr, $3->expr);
            $$ = process(buffer, 1,'/', $1, $3);

        }
|   F    { $$ = $1; }; 

F: ID { 
            char buffer[50];
            sprintf(buffer,"%c", $1);
            $$ = process(buffer, 0,$1, NULL, NULL);

        }
| '('E')' { $$ = $2; }
%%


// driver code
void main()
{
    printf("Enter expression of chars with +,-,*,/ \n");
    yyparse();
    if (flag == 0)
    {
        printf("\n given expression is valid\n");
    }
}

void print(Node *x)
{
    printf("\nThe resulting DAG for given expression\n");
    printf("\n");
    int vis[idx];
    for(int i=0;i<idx;i++) vis[i]=0;
    postordertrav(x,vis);
}


Node* process(char expr[50], int op, char type, Node* left, Node* right){
    int index=-1;
    for(int i=0;i<idx;i++){
        if(strcmp(dag[i]->expr,expr)==0){
            index=i;
            break;
        }
    }

    if(index!=-1){
        return dag[index];
    }else{
        Node* x=createNode(op,idx,type,expr,left,right);
        dag[idx]=x;
        idx++;
        return x;
    }
}

void postordertrav(Node* x, int vis[]){
    if(x==NULL) return;

    if(vis[x->id]==1){
        printf("Operand Node: %s (already created)\n",x->expr);
        return;
    }

    vis[x->id]=1;
    postordertrav(x->left,vis);
    postordertrav(x->right,vis);
    if(x->op){
        printf("Operator Node: %c\n",x->type);
    } else{
        printf("Operand Node: %c (new node)\n",x->type);
    }
}


void yyerror()
{
    printf("\n given expression is invalid\n");
    flag = 1;
}