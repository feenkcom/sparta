finalization
finalizePropertyProvider
	"Release property provider property.
	Note: property provider supports smart pointer with counter,
	so it is ok to pass it to Moz2D external functions"

	propertyProvider 
		ifNotNil: [ :aPropertyProvider | aPropertyProvider release ].
	propertyProvider := nil