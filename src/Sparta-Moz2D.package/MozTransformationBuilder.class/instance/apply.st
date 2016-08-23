transformation
apply
	
	"transformation isPureTranslation ifTrue: [ ^ self ]."
	
	self
		primConcatenateTransformA11: transformation sx
		a12: transformation shy
		a21: transformation shx
		a22: transformation sy
		a31: transformation x
		a32: transformation y