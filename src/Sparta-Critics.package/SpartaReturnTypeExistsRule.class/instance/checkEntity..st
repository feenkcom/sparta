running
checkEntity: aMethod

	^ ((aMethod pragmas select: [ :pragma | pragma keyword beginsWith: #return: ])
		allSatisfy: [ :pragma | pragma arguments allSatisfy: [ :symbol | symbol
				ifNil: [ true ]
				ifNotNil: [ :className | Smalltalk hasClassNamed: className ] ] ]) not