initialization
initialize
	super initialize.
	
	spansStack := LinkedList new.
	lines := OrderedCollection new.
	isSplitted := false