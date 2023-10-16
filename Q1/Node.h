#ifndef NODE_H_HEADER_
#define NODE_H_HEADER_

typedef struct Node {
  int isOperator;
  int value;
  struct Node *left;
  struct Node *right;
} Node;

Node *createNode(int isOp, int val, Node *left, Node *right);

void traversalFn(Node *x);

void inorderTraversal(Node *root);

void preOrderTraversal(Node *root);

#endif // !DEBUG
