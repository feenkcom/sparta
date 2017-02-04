instance creation
externalFromSpartaMatrix: aSpartaMatrix

	^ self externalNew
		initX: aSpartaMatrix x
		y: aSpartaMatrix y
		sx: aSpartaMatrix sx
		sy: aSpartaMatrix sy
		shx: aSpartaMatrix shx
		shy: aSpartaMatrix shy;
		yourself