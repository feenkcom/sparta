accessing
stops: aCollectionOfStops

	aCollectionOfStops do: [ :aStop |
		| aColor |
		aColor := aStop value.
		self
			primAddStop:  aStop key
			R: aColor red
			G: aColor green
			B: aColor blue
			A: aColor alpha ]