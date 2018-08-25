Class {
	#name : #SpartaCairoHintMetrics,
	#superclass : #SpartaCairoEnum,
	#classVars : [
		'CAIRO_HINT_METRICS_DEFAULT',
		'CAIRO_HINT_METRICS_OFF',
		'CAIRO_HINT_METRICS_ON'
	],
	#category : 'Sparta-Cairo-Enums'
}

{ #category : #'accessing enum' }
SpartaCairoHintMetrics class >> CAIRO_HINT_METRICS_DEFAULT [
	"This method was automatically generated"
	^ CAIRO_HINT_METRICS_DEFAULT
]

{ #category : #'accessing enum' }
SpartaCairoHintMetrics class >> CAIRO_HINT_METRICS_OFF [
	"This method was automatically generated"
	^ CAIRO_HINT_METRICS_OFF
]

{ #category : #'accessing enum' }
SpartaCairoHintMetrics class >> CAIRO_HINT_METRICS_ON [
	"This method was automatically generated"
	^ CAIRO_HINT_METRICS_ON
]

{ #category : #'enum declaration' }
SpartaCairoHintMetrics class >> enumDecl [
	"
	self rebuildEnumAccessors
	"

	^ #(
		CAIRO_HINT_METRICS_DEFAULT 0
		CAIRO_HINT_METRICS_OFF 1
		CAIRO_HINT_METRICS_ON 2
	)
]

{ #category : #initialization }
SpartaCairoHintMetrics class >> initialize [
	super initialize
]
