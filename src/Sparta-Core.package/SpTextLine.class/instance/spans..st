initialization
spans: anArrayOfSpans
	spans := anArrayOfSpans.
	width := spans ifEmpty: [ 0 ] ifNotEmpty: [ spans sum: #width ].
	height := spans ifEmpty: [ 0 ] ifNotEmpty: [ (spans detectMax: #height) height ].
	ascent := spans ifEmpty: [ 0 ] ifNotEmpty: [ (spans detectMax: #ascent) ascent ].
	descent := spans ifEmpty: [ 0 ] ifNotEmpty: [ (spans detectMax: #descent) descent ]