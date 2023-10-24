#ifndef NODE_H_HEADER_
#define NODE_H_HEADER_

typedef struct Node {
		int isOperator;
		char value;
		struct Node *left;
		struct Node *right;
} Node;

Node *createNode(int isOp, char val, Node *left, Node *right);

void traversalFn(Node *x);

void inorderTraversal(Node *root);

void preorderTraversal(Node *root);

#endif	// !DEBUG
