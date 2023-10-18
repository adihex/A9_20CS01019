#include "Node.h"

#include <stdio.h>
#include <stdlib.h>

Node *createNode(int isOp, int val, Node *left, Node *right) {
	Node *newNode = (Node *)malloc(sizeof(Node));
	newNode->isOperator = isOp;
	newNode->value = val;
	newNode->left = left;
	newNode->right = right;
	return newNode;
}

void traversalFn(Node *x) {
	if (x->isOperator) {
		switch (x->value) {
			case 0:
				printf("+ ");
				break;
			case 1:
				printf("- ");
				break;
			case 2:
				printf("* ");
				break;
			case 3:
				printf("/ ");
				break;
			case 4:
				printf("%% ");
				break;
			default:
				printf("invalid operator!! ");
				break;
		}
	} else {
		printf("%d", x->value);
	}
}

void preorderTraversal(Node *x) {
	if (x != NULL) {
		traversalFn(x);
		preorderTraversal(x->left);
		preorderTraversal(x->right);
	}
}

void inorderTraversal(Node *x) {

	if (x != NULL) {
		inorderTraversal(x->left);
		traversalFn(x);
		inorderTraversal(x->right);
	}
}
