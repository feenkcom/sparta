drawing-ovals
fillOval: r color: c borderWidth: borderWidth borderColor: borderColor
	"Fill the given oval."
	
	c isTransparent ifFalse: [ 
		self canvas fill
			paint: c;
			path: (self canvas shape ellipse: r);
			draw ].

	(borderWidth isZero or: [ borderColor isTransparent ])
		ifFalse: [
			self canvas stroke
				paint: borderColor;
				path: (self canvas shape ellipse: r);
				width: borderWidth;
				draw ]