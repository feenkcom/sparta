drawing-support
transformBy: aDisplayTransform clippingTo: aClipRect during: aBlock smoothing: cellSize
	"Transform the receiver by the given display transformation during the execution of aBlock. The given clip rectangle defines the *global* (e.g., outer) rectangle against which the receiver should clip (which would be equivalent to 'self clipRect: aClipRect; transformBy: aDisplayTransform')."
	| aMatrix spartaMatrix |
	
	aMatrix := aDisplayTransform asMatrixTransform2x3.
	
	spartaMatrix := SpartaMatrix new.
	"spartaMatrix sx: aMatrix a11.
	spartaMatrix sy: aMatrix a22.
	
	spartaMatrix shy: aMatrix a12.
	spartaMatrix shx: aMatrix a21."
	
	spartaMatrix x: aMatrix a13.
	spartaMatrix y: aMatrix a23.

	self canvas transform
		during: [ :aTransform |
			aTransform multiplyBy: spartaMatrix.
			aTransform apply.
			self clipBy: aClipRect during: aBlock ]