drawing-support
transformBy: aDisplayTransform clippingTo: aClipRect during: aBlock smoothing: cellSize
	"Transform the receiver by the given display transformation during the execution of aBlock. The given clip rectangle defines the *global* (e.g., outer) rectangle against which the receiver should clip (which would be equivalent to 'self clipRect: aClipRect; transformBy: aDisplayTransform')."
	| spartaMatrix |
	
	spartaMatrix := SpartaMatrix new.
	"spartaMatrix sx: aMatrix a11.
	spartaMatrix sy: aMatrix a22.
	
	spartaMatrix shy: aMatrix a12.
	spartaMatrix shx: aMatrix a21."
	
	spartaMatrix x: aDisplayTransform offset x negated.
	spartaMatrix y: aDisplayTransform offset y negated.

	self
		clipBy: aClipRect
		during: [
			self canvas transform
				during: [ :aTransform |
					aTransform multiplyBy: spartaMatrix.
					aTransform apply.
					aBlock cull: self ] ]