private
privateSetAttributeIntSize: aPointOrInteger index: anIndex
	|point|
	point := aPointOrInteger asPoint asIntegerPoint.
	self
		primSetAttributeIntSizeWidth: point x
		height: point y
		index: anIndex