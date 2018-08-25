Class {
	#name : #BaselineOfSpartaMoz2DDevelopment,
	#superclass : #BaselineOf,
	#category : #BaselineOfSpartaMoz2DDevelopment
}

{ #category : #baselines }
BaselineOfSpartaMoz2DDevelopment >> baseline: spec [
	<baseline>
	spec for: #OS64bit do: [ spec
		postLoadDoIt: #postLoadSparta:;
		baseline: 'Beacon' with: [ spec 
			repository: 'github://pharo-project/pharo-beacon/repository' ];
		baseline: 'SpartaMoz2D' with: [ spec 
			repository: 'github://syrel/Sparta/src' ];
		baseline: 'SpartaCoreDevelopment' with: [ spec 
			repository: 'github://syrel/Sparta/src' ];

		package: 'Sparta-Moz2D-Installer' with: [ spec 
			requires: #('SpartaMoz2D' 'Beacon' 'SpartaCoreDevelopment') ]
	]
]

{ #category : #accessing }
BaselineOfSpartaMoz2DDevelopment >> customProjectAttributes [
	Smalltalk os isMacOS ifTrue: [ ^ #(#MacOS #OS64bit) ].
	Smalltalk os isUnix32 ifTrue: [ ^ #(#Unix32 #OS32bit) ].
	Smalltalk os isUnix64 ifTrue: [ ^ #(#Unix64 #OS64bit) ].
	Smalltalk os isWindows ifTrue: [ ^ #(#Windows #OS64bit) ]
]

{ #category : #actions }
BaselineOfSpartaMoz2DDevelopment >> postLoadSparta: aSpecLoader [
	| pragmas |
	
	pragmas := OrderedCollection new.
	Object withAllSubclassesDo: [:each |
		pragmas addAll: (Pragma allNamed: #spartaPostLoad in: each) ].
	pragmas do: [ :each | each method methodClass baseClass perform: each method selector ]
]
