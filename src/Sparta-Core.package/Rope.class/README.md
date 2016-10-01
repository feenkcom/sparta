I represent an abstract rope.

I am composed of smaller collections that is used for efficiently storing and manipulating a very long collection.

A text editing program may use a rope to represent the text being edited, so that operations such as insertion, deletion, and random access can be done efficiently.


Public API and Key Messages

- append: concatenate me with another rope
- at: get a single item at an index
- from:to: return a subrope within interval
- insert:at: insert a rope after an index
- reversed - return a reversed version of me
- size - return amount of items I contain

   Rope from: '123456789'
 
Internal Representation and Key Implementation Points.

	It is highly recommented to use iterators for read access