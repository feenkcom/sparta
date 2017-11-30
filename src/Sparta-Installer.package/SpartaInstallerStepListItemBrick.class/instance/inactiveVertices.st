area
inactiveVertices
	"rectangle with right arrow"
	| aHeight aTriangleCathetus aWidth |
	
	aHeight := self height.
	aTriangleCathetus := aHeight // 2.
	
	aWidth := self width.
	
	^ { 
		0@0.
		(aWidth - aTriangleCathetus) @ 0.
		(aWidth @ aTriangleCathetus).
		0@(aTriangleCathetus * 2).
	}