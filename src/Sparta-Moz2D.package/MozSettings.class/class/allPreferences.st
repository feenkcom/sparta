accessing
allPreferences
	| mySuperclasses currentSuperclass allPreferences |
	mySuperclasses := LinkedList new.
	
	currentSuperclass := self.
	[ currentSuperclass ~= MozSettings ] whileTrue: [ 
		mySuperclasses addFirst: currentSuperclass.
		currentSuperclass := currentSuperclass superclass ].
	mySuperclasses addFirst: currentSuperclass.

	allPreferences := Dictionary new.
	mySuperclasses do: [ :aSuperclass |
		allPreferences addAll: aSuperclass uniqueInstance preferences ].
	^ allPreferences