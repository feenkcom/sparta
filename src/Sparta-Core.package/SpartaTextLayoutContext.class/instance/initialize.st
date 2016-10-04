initialization
initialize
	super initialize.
	
	spansStack := LinkedList new.
	accumulatedWidth := 0.
	accumulatedHeight := 0.
	position := 1.
	isSplitted := false