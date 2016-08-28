api
paint
	"Start building a backend specific paint.
	User gets a paint provider responsible for paint creation.
	See !SpartaPaintProvider for available api.
	
	canvas paint radialGradient
		innerCenter: 150@150;
		outerRadius: 100;
		reflect;
		stops: { 0 -> Color white . 1 -> Color veryVeryLightGray }
	"
	<return: #SpartaPaintProvider>
		
	^ self paintProvider
		reset;
		canvas: self;
		yourself