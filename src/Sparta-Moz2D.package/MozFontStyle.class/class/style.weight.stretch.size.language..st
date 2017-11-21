instance creation
style: aStyle weight: aWeight stretch: aStretch size: aSize language: aLanguage
		
	^ (self
		primCreateStyle: aStyle
		w: aWeight
		s: aStretch
		s: aSize
		a: -1.0
		l: aLanguage
		e: false
		o: ''
		i: true
		i: false
		i: true
		i: true)
			autoRelease;
			yourself