rendering
renderSpan: aSpan on: aCanvas
	| attributes transformation textRun textPainter |
	
	attributes := aSpan attributes.
	transformation := aSpan transformation.
	textRun := aSpan textRun.
	
	textPainter := aCanvas text.
	attributes
		do: [ :attribute | 
			attribute drawOn: aCanvas with: aSpan.
			attribute applyOnText: textPainter with: aSpan ].
		
	aCanvas transform
		during: [ :aTransform | 
			aTransform
				multiplyBy: transformation;
				apply.
			textPainter
				text: textRun;
				start: aSpan start;
				end: aSpan end;
				baseline: ( transformation inverted transform: aSpan baseline  + transformation translation);
				draw ]