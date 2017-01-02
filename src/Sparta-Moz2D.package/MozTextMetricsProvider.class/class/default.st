accessing
default
	^ default
		ifNil: [ default := self new ]
		ifNotNil: [ :aProvider | aProvider isValid
			ifTrue: [ aProvider ]
			ifFalse: [ default := self new ] ]