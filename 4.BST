#include<iostream>
using namespace std;
class Node {
	public:
		int data;
		Node* left;
		Node* right;
		Node(int d)
		{
			data=d;
			left=NULL;
			right=NULL;
			
		}
};
class BST {
	public:
		Node* root;
		BST()
		{
			root=NULL;
			
		}
		void insert(int d);
		void inorder(Node* root);
		void preorder(Node* root);
		void postorder(Node* root);
		void findData(int d);
		void minimum();
		void reverse(Node* root);
		int height(Node* root);
		void numberOfNodes();
		void printTree(Node* root, int space=0);
		
};

void BST::insert(int d)
{
	if(root==NULL)
	{
		root= new Node(d);
		cout<<"Stored!\n";
		return;
	}
	Node* temp= root;
	while(1) {
		if(d < temp->data) {
			if(temp->left==NULL){
				temp->left= new Node(d);
				cout<<"\nStored!\n";
				return;
			}
			else{
				temp=temp->left;
			}
			
			
		}
		else {
			if(temp->right==NULL){
				temp->right= new Node(d);
				cout<<"\nStored!\n";
				return;
			}
			else{
				temp=temp->right;
			}
			
		}
	}
}
void BST:: inorder(Node* root) { 
	if(root == NULL) return;
	inorder(root->left);
	cout<<root->data<<" ";
	inorder(root->right);
}
void BST:: preorder(Node* root) { 
	if(root == NULL) return;
	cout<<root->data<<" ";
	preorder(root->left);
	preorder(root->right);
}
void BST:: postorder(Node* root) {
	if(root==NULL) return;
	postorder(root->left);
	postorder(root->right);
	cout<<root->data <<" ";
}
void BST:: findData(int d) {
	Node* temp= root;
	while(temp!= NULL) {
	
	
		if(temp->data== d) {
			cout<<"\nFound!";
			return;
		}
		
		else{
			if(d<temp->data) {
				temp= temp->left;
				
			}
			else{
				temp=temp->right;
			}
		}
		
	}
	cout<<"\nNot Found!";
}
void BST:: minimum() {
	Node* temp= root;
	while(temp->left != NULL) {
		temp= temp->left;
	}
	cout<<"The minimum element is: "<< temp->data<<endl;
	return;
}

void BST:: reverse(Node* root) {
	
	if(root == NULL) {
		return;
	}
	
	Node* temp =root->right;
	root->right = root->left;
	root->left = temp;
	reverse(root->left);
	reverse(root->right);
}

int BST :: height(Node* root) {
	if(root==NULL) return -1;
	
	int leftHeight = height(root->left);
	int rightHeight = height(root->right);
	
	return 1+ max(leftHeight, rightHeight);
}
void BST:: numberOfNodes() {
	int nodes= 1+ height(root);
	cout<<"\nNumber of nodes in farthest path from root to leaf node: "<<nodes;
}

void BST:: printTree(Node* root, int space) {
	int gap=5;
    if (!root) return;

    space += gap;
    printTree(root->right, space);

    cout << endl;
    for (int i = gap; i < space; i++) cout << " ";
    cout << root->data << "\n";

    printTree(root->left, space);
}



int main()
{
	BST obj;
	BST revobj;
	do{
		cout<<"\n\t---------------------";
		cout<<"\n\t 1: Insert";
		cout<<"\n\t 2: Inorder";
		cout<<"\n\t 3: Preorder";
		cout<<"\n\t 4: Postorder";
		cout<<"\n\t 5: Find Data";
		cout<<"\n\t 6: Minimum";
		cout<<"\n\t 7: Mirror Image";
		cout<<"\n\t 8: Height of the tree";
		cout<<"\n\t 9: Number of nodes in longest path";
		cout<<"\n\t10: Display Tree";
		
		
		cout<<"\n\t------------------------\n";
		int ch;
		cout<<"\nEnter choice: "; cin>>ch;
		
		if(ch==1) {
			int d;
		cout<<"\nEnter value to be inserted: "; cin>>d;
			obj.insert(d);
		}
		else if(ch==2) {
			//display
			if(obj.root != NULL) {
				cout<<"\ninorder: ";
				obj.inorder(obj.root);
				cout<<endl;
			}
			else {
				cout<<"\nTree is empty!";
			}
		}
		else if(ch==3) {
			if(obj.root != NULL) {
				cout<<"\nPreorder: ";
				obj.preorder(obj.root);
				cout<<endl;
			}
			else {
				cout<<"\nTree is empty!";
			}
		}
		else if(ch==4) {
			if(obj.root != NULL) {
				cout<<"\nPostorder: ";
				obj.postorder(obj.root);
				cout<<endl;
			}
			else {
				cout<<"\nTree is empty!";
			}
		}
		else if(ch==5) {
			if(obj.root != NULL) {
				int find; cout<<"\nEnter the data to be found: "; cin>> find;
				obj.findData(find);
				cout<<endl;
			}
			else {
				cout<<"\nTree is empty!";
			}
		}
		else if(ch==6) {
			if(obj.root != NULL) {
				
				obj.minimum();
				cout<<endl;
			}
			else {
				cout<<"\nTree is empty!";
			}
		}
		else if(ch==7) {
			if(obj.root != NULL) {
				
				revobj= obj;
				revobj.reverse(revobj.root);
				cout<<"Mirror image of Tree: \n";
				revobj.printTree(revobj.root);
			}
			else {
				cout<<"\nTree is empty!";
			}
		}
		else if(ch==8) {
			if(obj.root != NULL) {
				int h= obj.height(obj.root);
				cout<<"\nHeight of the tree is: "<<h<<endl;
			}
			else {
				cout<<"\nTree is Empty!";
			}
		}
		else if(ch==9) {
			if(obj.root != NULL) {
				obj.numberOfNodes();
				cout<<endl;
			}
			else {
				cout<<"\nTree is Empty!";
			}
		}
		else if(ch==10) {
			obj.printTree(obj.root);
		}
		
		else if(ch==-1) {
			cout<<"\n---------END--------";
			break;
		}
	}while(1);
	return 0;
}
