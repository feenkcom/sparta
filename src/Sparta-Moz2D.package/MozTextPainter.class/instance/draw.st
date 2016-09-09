drawing
draw
	| x y r g b a aDrawMode textRun flags |

	self
		assert: [ string isNotNil ]
		description: [ 'String must not be nil' ].
	
	self
		assert: [ font isNotNil ]
		description: [ 'Font must not be nil' ].
	
	
	x := 0.
	y := 0.
	r := 0.
	g := 0.
	b := 0.
	a := 0.
	
	origin ifNotNil: [
		x := origin x.
		y := origin y ].
	
	color ifNotNil: [ 
		r := color red.
		g := color green.
		b := color blue.
		a := color alpha ].
	
	aDrawMode := drawMode ifNil: [ MozTextDrawMode GLYPH_FILL value ].

	flags := 0.
	flags := flags | (orientation ifNil: [ MozTextOrientation HORIZONTAL ]) value.

	textRun := font makeTextRun: string canvas: canvas flags: flags.

	self
		primDrawTextRun: textRun
		x: x
		y: y
		drawMode: aDrawMode
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])
		strokeOptions: (strokeOptions ifNil: [ canvas defaultStrokeOptions ])
		r: r
		g: g
		b: b
		a: a