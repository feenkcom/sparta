private
privateSetAttributeMatrix: aMatrix index: anIndex
	self
		primSetAttributeA11: aMatrix sx
		a12: aMatrix shy
		a21: aMatrix shx
		a22: aMatrix sy
		a31: aMatrix x
		a32: aMatrix y
		index: anIndex