rendering
renderSpan: aSpan on: aCanvas
	| attributes transformation aTextRun aTextPainter aBaseline |
	
	attributes := aSpan attributes.
	transformation := aSpan transformation.
	aTextRun := aSpan textRun.
	
	aTextPainter := aCanvas text.
	attributes
		do: [ :attribute | 
			attribute drawBelowOn: aCanvas with: aSpan.
			attribute applyOnText: aTextPainter with: aSpan ].

	aBaseline := transformation inverted transform: (aSpan baseline + transformation translation).
	
	"If transformation is just a translation there is no need
	to changed transformation matrix of a canvas, we can just
	translate a baseline - just faster"
	transformation isPureTranslation
		ifTrue: [ 
			aBaseline := aBaseline + transformation translation.
			self renderSpan: aSpan with: aTextPainter at: aBaseline ]
		ifFalse: [ 
			aCanvas transform during: [ :aTransform | 
				aTransform
					multiplyBy: transformation;
					apply.
				self renderSpan: aSpan with: aTextPainter at: aBaseline ] ].

	"And finally let attributes to render above the text"
	attributes
		do: [ :attribute | attribute drawAboveOn: aCanvas with: aSpan ].