Class {
	#name : #SpartaCairoGradientPattern,
	#superclass : #SpartaCairoPattern,
	#category : 'Sparta-Cairo-External'
}

{ #category : #'private - ffi' }
SpartaCairoGradientPattern >> primAddStop: anOffset R: aRed G: aGreen B: aBlue A: anAlpha [

	^ self ffiCall: #(void cairo_pattern_add_color_stop_rgba (
			self,
			double anOffset,
			double aRed,
			double aGreen,
			double aBlue,
			double anAlpha ) )
]

{ #category : #accessing }
SpartaCairoGradientPattern >> stops: aCollectionOfStops [

	aCollectionOfStops do: [ :aStop |
		| aColor |
		aColor := aStop value.
		self
			primAddStop:  aStop key
			R: aColor red
			G: aColor green
			B: aColor blue
			A: aColor alpha ]
]
