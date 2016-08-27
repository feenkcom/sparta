running
basicCheck: anEntity 

	(self shouldCheck: anEntity)
		ifFalse: [ ^ false ].
		
	^ self checkEntity: anEntity