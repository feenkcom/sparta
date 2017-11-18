accessing
contentsOfArea: aRectangle into: aForm
	"Return the contents of the given area"
	| bb |
	
	formCanvas ifNotNil: [ ^ formCanvas contentsOfArea: aRectangle into: aForm ].
	
	self canvas flush.
	bb := BitBlt toForm: aForm.
	bb
		sourceForm: self canvas asForm;
		combinationRule: Form over;
		sourceX: aRectangle left + self origin x;
		sourceY: aRectangle top + self origin y;
		width: aRectangle width;
		height: aRectangle height;
		copyBits.
	^ aForm