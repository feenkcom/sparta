accessing
at: anIndex
	^ self stream
		position: (anIndex - 1);
		next