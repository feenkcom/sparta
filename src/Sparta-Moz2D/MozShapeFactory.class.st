Class {
	#name : #MozShapeFactory,
	#superclass : #SpartaShapeFactory,
	#traits : 'TMozLibrary',
	#classTraits : 'TMozLibrary classTrait',
	#category : #'Sparta-Moz2D-Builders'
}

{ #category : #shapes }
MozShapeFactory >> ellipse: aRectangle [

	^ (self
		primEllipseX: aRectangle left
		y: aRectangle top
		width: aRectangle width
		height: aRectangle height
		fillRule: MozFillRule FILL_WINDING)
			initialize;
			autoRelease
]

{ #category : #'private - ffi' }
MozShapeFactory >> primEllipseX: x y: y width: width height: height fillRule: aFillRile [

	^ self ffiCall: #( MozPath moz2d_shape_ellipse (
		MozCanvas canvas,
		float x,
		float y,
		float width,
		float height,
		MozFillRule aFillRile ) )
]

{ #category : #'private - ffi' }
MozShapeFactory >> primRoundedRectangleX: x y: y width: width height: height tlr: tlr trr: trr brr: brr blr: blr fr: aFillRile [

	^ self ffiCall: #( MozPath moz2d_shape_rounded_rectangle (
		MozCanvas canvas,
		float x,
		float y,
		float width,
		float height,
		float tlr,
		float trr,
		float brr,
		float blr,
		MozFillRule aFillRile ) )
]

{ #category : #shapes }
MozShapeFactory >> roundedRectangle: aRectangle radii: anArrayOfCornerRadii [
	
	^ (self
		primRoundedRectangleX: aRectangle left
		y: aRectangle top
		width: aRectangle width
		height: aRectangle height
		tlr: anArrayOfCornerRadii first
		trr: anArrayOfCornerRadii second
		brr: anArrayOfCornerRadii third
		blr: anArrayOfCornerRadii fourth
		fr: MozFillRule FILL_WINDING)
			initialize;
			autoRelease
]
