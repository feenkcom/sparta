area
activeVertices
	"rectangle with right arrow"
	| aHeight aTriangleCathetus aWidth |
	
	aHeight := self height.
	aTriangleCathetus := aHeight // 2.
	
	aWidth := self width.
	
	^ { 
		0@0.
		(aWidth - aTriangleCathetus) @ 0.
		(aWidth @ aTriangleCathetus).
		(aWidth - aTriangleCathetus) @ (aTriangleCathetus * 2).
		0@(aTriangleCathetus * 2).
	}