shapes
polygon: aCollectionOfPoints
	"Return a closed polygon shape constructed out of provided vertices as points"
	<return: #TSpartaPath>
	| aPathBuilder |

	aPathBuilder := self canvas path absolute.
	"return empty path if there were no vertices provided"
	aCollectionOfPoints
		ifEmpty: [ ^ aPathBuilder build ].

	aPathBuilder moveTo: aCollectionOfPoints first.
	aCollectionOfPoints allButFirstDo: [ :aPoint | aPathBuilder lineTo: aPoint ].
	^ aPathBuilder close; build