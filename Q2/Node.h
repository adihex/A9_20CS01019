#ifndef NODE_H_HEADER_
#define NODE_H_HEADER_

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef struct Node
{
    int op;
    int id;
    char type;
    char expr[50];
    struct Node *left;
    struct Node *right;
} Node;

// creating a new node of AST
Node *createNode(int op, int id, char type, char expr[50], Node *left, Node *right)
{
    Node *node = (Node *)malloc(sizeof(Node));
    node->op = op;
    node->id = id;
    node->type = type;
    strcpy(node->expr, expr);
    node->left = left;
    node->right = right;
    return node;
}

#endif