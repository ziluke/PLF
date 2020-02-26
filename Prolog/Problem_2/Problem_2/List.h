#pragma once
class List
{
private:
	struct Node
	{
		int info;
		Node* next;
	};
	Node* head;

public:
	List();
	void add(int info);
	~List();
};

