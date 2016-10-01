instance creation
from: anObjectOrCollection
	^ anObjectOrCollection isCollection
		ifTrue: [ self fromCollection: anObjectOrCollection ]
		ifFalse: [ self fromItem: anObjectOrCollection ]