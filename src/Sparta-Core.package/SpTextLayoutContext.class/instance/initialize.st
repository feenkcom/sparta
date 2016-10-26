initialization
initialize
	super initialize.
	
	maxWidth := Float infinity.
	maxHeight := Float infinity.
	spansStack := LinkedList new.
	accumulatedWidth := 0.
	accumulatedHeight := 0.
	position := 1.
	isSplitted := false.
	lines := OrderedCollection new