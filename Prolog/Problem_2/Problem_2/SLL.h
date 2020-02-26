#pragma once
class SLL
{
private:
	struct Node
	{
		int info;
		Node* next;
	};
	Node* head;

public:
	SLL();
	void add(int info);
	~SLL();
};

