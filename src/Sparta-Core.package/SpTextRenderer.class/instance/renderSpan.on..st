rendering
renderSpan: aSpan on: aCanvas
	| attributes aTransformation aTransformationInverted aTextPainter aBaseline |

	attributes := aSpan attributes.
	aTransformation := aSpan transformation.
	aTransformationInverted := aSpan transformationInverted.

	aTextPainter := aCanvas text.
	attributes
		do: [ :attribute |
			attribute drawBelowOn: aCanvas with: aSpan.
			attribute applyOnText: aTextPainter with: aSpan ].

	aBaseline := aTransformationInverted transform: (aSpan baseline + aTransformation translation).

	"If transformation is just a translation there is no need
	to changed transformation matrix of a canvas, we can just
	translate a baseline - just faster"
	aTransformation isPureTranslation
		ifTrue: [ 
			aBaseline := aBaseline + aTransformation translation.
			self renderSpan: aSpan with: aTextPainter at: aBaseline ]
		ifFalse: [ 
			aCanvas transform during: [ :aTransform | 
				aTransform
					multiplyBy: aTransformation;
					apply.
				self renderSpan: aSpan with: aTextPainter at: aBaseline ] ].

	"And finally let attributes to render above the text"
	attributes
		do: [ :attribute | attribute drawAboveOn: aCanvas with: aSpan ].