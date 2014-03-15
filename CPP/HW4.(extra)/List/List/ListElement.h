// Represents the element of List class
class ListElement
{

public:
	// Constructor
	ListElement(int inValue);

	~ListElement();

	// Takes mValue
	int getValue() const;
	// Sets mValue
	void setValue(const int newValue);
	// Takes mNext
	ListElement *getNext() const;
	// Sets mNext
	void setNext(ListElement *newNext);

private:
	// Useful data
	int mValue;
	// Pointer to the next element in List
	ListElement *mNext;

};
