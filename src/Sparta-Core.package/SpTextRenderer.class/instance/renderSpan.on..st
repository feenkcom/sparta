rendering
renderSpan: aSpan on: aCanvas
	| attributes font fontBuilder textPainter transformation |
	attributes := aSpan attributes.
	fontBuilder := aCanvas font.
	textPainter := aCanvas text.
	transformation := SpartaMatrix new.
	attributes
		do: [ :attribute | 
			attribute applyOnTransform: transformation with: aSpan.
			attribute drawOn: aCanvas with: aSpan.
			attribute applyOnFont: fontBuilder with: aSpan.
			attribute applyOnText: textPainter with: aSpan ].
	font := fontBuilder build.
	aCanvas transform
		during: [ :aTransform | 
			aTransform
				multiplyBy: transformation;
				apply.
			textPainter
				font: font;
				string: aSpan string;
				baseline: ( transformation inverted transform: aSpan baseline  + transformation translation);
				draw ]