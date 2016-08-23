private
privateSetAttributeSize: aPointOrFloat index: anIndex
	|point|
	point := aPointOrFloat asPoint asPoint.
	self
		primSetAttributeSizeWidth: point x
		height: point y
		index: anIndex