private
toAbsolute: aPoint
	"Convert a given point to absolute path coordinates within user space"
	<return: #Point>

	^ absolute
		ifTrue: [ aPoint ]
		ifFalse: [ endPoint + aPoint ]