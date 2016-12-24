accessing
nextLine

	"The last item is carriage return, we don't want it to be a new line"
	(self position = end and: [
		self peek = Character cr ])
			ifTrue: [
				"Move iterator to the next, to make sure that hasNext returns false"
				self next.
				^ SpRope fromCollection: #() ].
	^ self nextSegment: [ :item | item = Character cr ]