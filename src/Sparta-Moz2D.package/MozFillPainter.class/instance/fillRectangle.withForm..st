drawing
fillRectangle: aRectangle withForm: aForm
	| form |
	
	form := aForm unhibernate; asFormOfDepth: 32.
	self
		primFillX: aRectangle left
		y: aRectangle top
		width: aRectangle width
		height: aRectangle height
		bits: form bits
		formWidth: form width
		formHeight: form height
		stride: form stride
		drawOptions: (drawOptions ifNil: [ canvas defaultDrawOptions ])