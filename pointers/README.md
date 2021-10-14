# Pointers on
Explanations and memory rules about things
### Pointers

Allocated memory address of something, for example a string (char *string). Pointer points to the start of that memory address, so the first character of that string. Example of a double pointer would be char **array, which could point to an array of strings.

### Linked lists

A pointer iterating through a linked list can be thought of as a one-way train. Every node is a city or village the train passes through, possibly stopping to add or reduce something. When the train comes to the end stop, it will be taken to pieces.

Array vs linked list: It’s fast to find something from array if you know the index because everything is next to each other in one memory location, but you can’t change the size of an array without creating a new one, so you have to know how much you need or allocate big amount “just in case”. With linked list you can always add something before, to the middle or after previous data, but you can’t find something with just an index so you always have to loop from the first element to get to the one you want. You could save the last element address or something in the middle though, but arrays handle that automatically. So linked lists are good when you have to iterate through the whole list anyway or add some new data, arrays are good if you know how much memory you want or you have to access certain indexes and you know their position.

You can also create two way linked lists if you need to iterate to both directions. Just add a pointer to the previous element too. There are also binary trees with similar node structure, but one element can point to 0, 1 or 2 next ones. The left subtree of a node contains only values less than the node's value, right subtree values that are more than the node’s value. Because of this binary trees are faster to traverse than linked lists when you need to find a certain node.
