Class {
	#name : #MozPatternBuilder,
	#superclass : #SpartaAbstractBuilder,
	#traits : 'TMozLibrary',
	#classTraits : 'TMozLibrary classTrait',
	#category : 'Sparta-Moz2D-Builders'
}

{ #category : #accessing }
MozPatternBuilder >> color: aColor [

	^ MozNativeColorPattern fromColor: aColor
]

{ #category : #accessing }
MozPatternBuilder >> linearGradient: aLinearGradient [

	self
		assert: [ aLinearGradient isNotNil ]
		description: [ 'Gradient must not be nil!' ].

	self
		assert: [ aLinearGradient stops isNotNil ]
		description: [ 'Gradient stops must not be nil!' ].

	self
		assert: [ aLinearGradient begin isNotNil ]
		description: [ 'Gradient begin point must not be nil!' ].

	self
		assert: [ aLinearGradient end isNotNil ]
		description: [ 'Gradient end point must not be nil!' ].

	^ (self
		primLinearGradientBeginX: aLinearGradient begin x
		beginY: aLinearGradient begin y
		endX: aLinearGradient end x
		endY: aLinearGradient end y
		rawStops: (self primExternalGradientStops: aLinearGradient stops)
		stopsNum: aLinearGradient stops size
		rawMatrix: aLinearGradient transformation asExternalArray getHandle
		extendMode: aLinearGradient extendMode value) autoRelease
]

{ #category : #'private - ffi' }
MozPatternBuilder >> primExternalGradientStops: stops [
	|array|
	array := ByteArray new: FFIFloat32 externalTypeSize * stops size * 5.
	
	stops withIndexDo: [ :assoc :i |
		| color offset index |
		index := (i - 1) * 5 * FFIFloat32 externalTypeSize.
		offset := assoc key.
		color := assoc value.
		array floatAt: (index + 1) put: offset.
		array floatAt: (index + 1) + FFIFloat32 externalTypeSize put: color red.
		array floatAt: (index + 1) + (2 * FFIFloat32 externalTypeSize) put: color green.
		array floatAt: (index + 1) + (3 * FFIFloat32 externalTypeSize) put: color blue.
		array floatAt: (index + 1) + (4 * FFIFloat32 externalTypeSize) put: color alpha ].
	^ array
]

{ #category : #'private - ffi' }
MozPatternBuilder >> primLinearGradientBeginX: beginX beginY: beginY endX: endX endY: endY rawStops: rawStops stopsNum: stopsNum rawMatrix: rawMatrix extendMode: anExtendMode [

	^ self ffiCall: #( MozNativeLinearGradientPattern moz2d_pattern_linear_gradient_create_flat (
		MozCanvas canvas,
		float beginX,
		float beginY,
		float endX,
		float endY,
		float* rawStops,
		uint32 stopsNum,
		float * rawMatrix,
		int anExtendMode ) )
]

{ #category : #'private - ffi' }
MozPatternBuilder >> primRadialX: innerCenterX Y: innerCenterY iR: innerRadius oX: outerCenterX Y: outerCenterY oR: outerRadius stops: rawStops stopsNum: stopsNum matrix: rawMatrix extend: anExtendMode [

	^ self ffiCall: #( #MozNativeRadialGradientPattern moz2d_pattern_radial_gradient_create_flat (
		MozCanvas canvas,
		float innerCenterX,
		float innerCenterY,
		float innerRadius,
		float outerCenterX,
		float outerCenterY,
		float outerRadius,
		float* rawStops,
		uint32 stopsNum,
		float * rawMatrix,
		int anExtendMode ) )
]

{ #category : #'private - ffi' }
MozPatternBuilder >> primSurface: aSurface X: samplingX Y: samplingY width: samplingWidth height: samplingHeight filter: aSamplingFilter extend: aExtendMode a11: a11 a12: a12 a21: a21 a22: a22 a31: a31 a32: a32 [

	^ self ffiCall: #( MozNativeSurfacePattern moz2d_pattern_surface_create (
		MozSurface aSurface,
		int32 samplingX,
		int32 samplingY,
		int32 samplingWidth,
		int32 samplingHeight,
		MozSamplingMode aSamplingFilter,
		MozExtendMode aExtendMode,
		float a11,
		float a12,
		float a21,
		float a22,
		float a31,
		float a32) )
]

{ #category : #accessing }
MozPatternBuilder >> radialGradient: aRadialGradient [
	| innerCenter outerCenter |
	innerCenter := aRadialGradient innerCenter.
	outerCenter := aRadialGradient outerCenter.
	
	(innerCenter isNil and: [ outerCenter isNil ]) ifTrue: [ 
		innerCenter := ((aRadialGradient innerRadius + aRadialGradient outerRadius) / 2.0) asPoint ].
	
	innerCenter ifNil: [ innerCenter := outerCenter ].
	outerCenter ifNil: [ outerCenter := innerCenter ].

	^ (self
		primRadialX: innerCenter x
		Y: innerCenter y
		iR: aRadialGradient innerRadius
		oX: outerCenter x
		Y: outerCenter y
		oR: aRadialGradient outerRadius
		stops: (self primExternalGradientStops: aRadialGradient stops)
		stopsNum: aRadialGradient stops size
		matrix: aRadialGradient transformation asExternalArray getHandle
		extend: aRadialGradient extendMode value) autoRelease
]

{ #category : #accessing }
MozPatternBuilder >> surface: aMozSurfacePaint [
	| samplingX samplingY samplingWidth samplingHeight |

	self
		assert: [ aMozSurfacePaint source isNotNil ]
		description: [ 'Source must not be nil in Surface Paint!' ].
	
	aMozSurfacePaint samplingArea
		ifNil: [
			samplingX := 0.
			samplingY := 0.
			samplingWidth := 0.
			samplingHeight := 0 ]
		ifNotNil: [ :rect |
			samplingX := rect left.
			samplingY := rect top.
			samplingWidth := rect width.
			samplingHeight := rect height ].
	
	^ (self 
		primSurface: aMozSurfacePaint source
		X: samplingX
		Y: samplingY
		width: samplingWidth
		height: samplingHeight
		filter: aMozSurfacePaint samplingFilter
		extend: aMozSurfacePaint extendMode
		a11: aMozSurfacePaint transformation sx
		a12: aMozSurfacePaint transformation shy
		a21: aMozSurfacePaint transformation shx
		a22: aMozSurfacePaint transformation sy
		a31: aMozSurfacePaint transformation x
		a32: aMozSurfacePaint transformation y) autoRelease
]
