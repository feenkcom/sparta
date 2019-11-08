Class {
	#name : #SkiaLinearGradientShaderExamples,
	#superclass : #SkiaExternalObjectExamples,
	#category : #'Sparta-Skia-Examples'
}

{ #category : #public }
SkiaLinearGradientShaderExamples >> simple [
	<gtExample>
	
	^ SkiaLinearGradientShader
		from: (0@0) to: (50@50)
		colors: { Color black . Color white }
		positions: { 0 . 1 }
		mode: SkiaTileMode Clamp
		flags: 0
		matrix: SpartaMatrix new
]
