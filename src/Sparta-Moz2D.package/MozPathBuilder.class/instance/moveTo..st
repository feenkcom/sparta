path commands
moveTo: aPoint

	self
		primMoveToX: aPoint x
		Y: aPoint y
		absolute: self isAbsolute