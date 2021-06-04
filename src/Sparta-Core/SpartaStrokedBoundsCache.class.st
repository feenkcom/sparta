"
I provide the support of stroked bounds cache. The computation of the stroked bounds is expensive and we want to provide a quick consecutive access to it forthe same stroke options.

```
	cache := SpartaStrokedBoundsCache new.
	cache
		strokedBounds: strokeOptions
		ifAbsentPut: [ ""compute bounds here"" ]
```

"
Class {
	#name : #SpartaStrokedBoundsCache,
	#superclass : #Object,
	#instVars : [
		'bounds',
		'strokeOptions',
		'session'
	],
	#category : #'Sparta-Core-Path'
}

{ #category : #'private - accessing' }
SpartaStrokedBoundsCache >> bounds [
	<return: #Rectangle>
	
	^ bounds
]

{ #category : #'private - session management' }
SpartaStrokedBoundsCache >> checkSession [
	session == Smalltalk session
		ifFalse: [
			self releaseCache.
			session := Smalltalk session ]
]

{ #category : #'private - testing' }
SpartaStrokedBoundsCache >> hasCachedBounds [
	<return: #Boolean>
	
	^ bounds isNotNil
]

{ #category : #'private - session management' }
SpartaStrokedBoundsCache >> releaseCache [
	"Release bounds caches requiring their fresh creation"

	bounds := nil
]

{ #category : #'private - accessing' }
SpartaStrokedBoundsCache >> strokeOptions [
	<return: #TSpartaStrokeOptions>

	^ strokeOptions
]

{ #category : #'api - bounds' }
SpartaStrokedBoundsCache >> strokedBounds: aStrokeOptions ifAbsentPut: anAbsentBlock [
	<return: #Rectangle>

	self checkSession.

	(self hasCachedBounds
		and: [ self strokeOptions = aStrokeOptions ])
			ifTrue: [ ^ self bounds ].

	strokeOptions := aStrokeOptions.

	bounds := anAbsentBlock value.

	^ bounds
]
