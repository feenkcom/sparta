initialization
reset
	self wantsAutoRelease
		ifFalse: [ self finalize ].

	rope := nil.
	maxHeight := Float infinity.
	maxWidth := Float infinity.
	height := 0.
	width := 0.
	end := 0.
	autoRelease := true