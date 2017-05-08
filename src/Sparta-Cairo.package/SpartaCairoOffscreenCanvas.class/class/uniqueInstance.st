accessing
uniqueInstance
	^ uniqueInstance
		ifNil: [ uniqueInstance := self new ]
		ifNotNil: [ :aCanvas | aCanvas isValid
			ifTrue: [ uniqueInstance ]
			ifFalse: [ uniqueInstance := self new ] ]