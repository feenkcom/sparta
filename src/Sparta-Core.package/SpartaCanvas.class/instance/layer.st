api
layer

	<return: #SpartaLayerBuilder>

	^ self layerBuilder
		reset;
		canvas: self;
		yourself