Class {
	#name : #SkiaPerformanceSignal,
	#superclass : #SkiaSignal,
	#instVars : [
		'start',
		'end',
		'duration'
	],
	#classVars : [
		'isEnabled'
	],
	#category : 'Sparta-Skia-Telemetry'
}

{ #category : #'api - signal' }
SkiaPerformanceSignal class >> disable [
	<script: 'self disable'>

	isEnabled := false
]

{ #category : #'api - signal' }
SkiaPerformanceSignal class >> enable [
	<script: 'self enable'>

	isEnabled := true
]

{ #category : #'class initialization' }
SkiaPerformanceSignal class >> initialize [
	super initialize.
	
	isEnabled := false
]

{ #category : #'api - signal' }
SkiaPerformanceSignal class >> timeDuring: aBlock [
	| aStart anEnd |
	isEnabled
		ifFalse: [ ^ aBlock value ].

	aStart := DateAndTime now.

	"we use #valueUnpreemptively to measure time as precise as possible"
	aBlock valueUnpreemptively.
	anEnd := DateAndTime now.
	
	^ (self new start: aStart end: anEnd) emit
]

{ #category : #accessing }
SkiaPerformanceSignal >> asMilliSeconds [
	^ duration asMilliSeconds
]

{ #category : #accessing }
SkiaPerformanceSignal >> duration [
	^ duration
]

{ #category : #accessing }
SkiaPerformanceSignal >> end [
	^ end
]

{ #category : #printing }
SkiaPerformanceSignal >> printOneLineContentsOn: stream [
	"hook to be overriden by subclasses"
	
	stream nextPutAll: duration humanReadablePrintString
]

{ #category : #accessing }
SkiaPerformanceSignal >> start [
	^ start
]

{ #category : #initialize }
SkiaPerformanceSignal >> start: aStartTime end: anEndTime [
	start := aStartTime.
	end := anEndTime.
	duration := anEndTime - aStartTime
]
