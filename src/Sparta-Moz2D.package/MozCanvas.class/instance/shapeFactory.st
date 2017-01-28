builders
shapeFactory
	^ shapeFactory ifNil: [ shapeFactory := MozShapeFactory new ]