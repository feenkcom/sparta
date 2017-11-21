instance creation
fromLogicalFont: aLogicalFont
		
	^ (self
		primCreateStyle: aLogicalFont slantValue
		w: aLogicalFont weightValue
		s: aLogicalFont stretchValue
		s: aLogicalFont pixelSize
		a: -1.0
		l: 'en'
		e: false
		o: ''
		i: true
		i: false
		i: true
		i: true)
			autoRelease;
			yourself