Class {
	#name : 'SkiaGradientShaderExamples',
	#superclass : 'SkiaExternalObjectExamples',
	#category : 'Sparta-Skia-Examples'
}

{ #category : 'public' }
SkiaGradientShaderExamples >> conicalGradient [
	<gtExample>
	| aShader |

	aShader := SkiaConicalGradientShader
		start: 200@200 radius: 150
		end: 200@50 radius: 50
		colors: { Color black . Color white }
		positions: { 0 . 1 }
		mode: SkiaTileMode Clamp
		flags: 0
		matrix: SpartaMatrix new.

	self assert: aShader isOpaque not.
	self assert: aShader isImage not.
	
	^ aShader
]

{ #category : 'public' }
SkiaGradientShaderExamples >> linearGradient [
	<gtExample>
	| aShader |

	aShader := SkiaLinearGradientShader
		from: (0@0) to: (50@50)
		colors: { Color black . Color white }
		positions: { 0 . 1 }
		mode: SkiaTileMode Clamp
		flags: 0
		matrix: SpartaMatrix new.

	self assert: aShader isOpaque.
	self assert: aShader isImage not.
	
	^ aShader
]

{ #category : 'public' }
SkiaGradientShaderExamples >> radialGradient [
	<gtExample>
	| aShader |

	aShader := SkiaRadialGradientShader
		center: 50@50
		radius: 20
		colors: { Color black . Color white }
		positions: { 0 . 1 }
		mode: SkiaTileMode Clamp
		flags: 0
		matrix: SpartaMatrix new.

	self assert: aShader isOpaque.
	self assert: aShader isImage not.
	
	^ aShader
]

{ #category : 'public' }
SkiaGradientShaderExamples >> sweepGradient [
	<gtExample>
	| aShader |

	aShader := SkiaSweepGradientShader
		center: 50@50
		startAngle: 45
		endAngle: 180
		colors: { Color black . Color white }
		positions: { 0 . 1 }
		mode: SkiaTileMode Clamp
		flags: 0
		matrix: SpartaMatrix new.

	self assert: aShader isOpaque.
	self assert: aShader isImage not.
	
	^ aShader
]
