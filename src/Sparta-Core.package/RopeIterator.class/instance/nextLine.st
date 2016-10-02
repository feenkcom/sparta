accessing
nextLine
	^ self nextSegment: [ :item | item = Character cr ]