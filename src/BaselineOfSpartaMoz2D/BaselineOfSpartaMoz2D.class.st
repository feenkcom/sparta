"
I am a Baseline of Sparta-Moz2D backend
"
Class {
	#name : #BaselineOfSpartaMoz2D,
	#superclass : #BaselineOf,
	#category : #BaselineOfSpartaMoz2D
}

{ #category : #baselines }
BaselineOfSpartaMoz2D >> baseline: spec [
	<baseline>
	spec for: #Moz2D do: [ spec
		postLoadDoIt: #postLoadSparta:;
		baseline: 'SpartaCore' with: [ spec 
			repository: 'github://syrel/Sparta/src' ];
		baseline: 'SpartaCoreDevelopment' with: [ spec 
			repository: 'github://syrel/Sparta/src' ];
		baseline: 'Beacon' with: [ spec 
			repository: 'github://pharo-project/pharo-beacon/repository' ];

		package: 'Sparta-Moz2D' with: [ spec 
			requires: #('SpartaCore') ];
		package: 'Sparta-Moz2D-Tests' with: [ spec 
			requires: #('Sparta-Moz2D') ];
		package: 'Sparta-Moz2D-Installer' with: [ spec 
			requires: #('Sparta-Moz2D' 'Beacon' 'SpartaCoreDevelopment') ]
	].
]

{ #category : #accessing }
BaselineOfSpartaMoz2D >> customProjectAttributes [
	Smalltalk os isMacOS ifTrue: [ ^ #(#Moz2D) ].
	Smalltalk os isUnix32 ifTrue: [ ^ #(Moz2D) ].
	Smalltalk os isUnix64 ifTrue: [ ^ #(#Moz2D) ].
	Smalltalk os isWindows ifTrue: [ ^ #(#Moz2D) ].
	^ #()
]

{ #category : #actions }
BaselineOfSpartaMoz2D >> postLoadSparta: aSpecLoader [
	| pragmas |
	pragmas := OrderedCollection new.
	Object
		withAllSubclassesDo:
			[ :each | pragmas addAll: (Pragma allNamed: #spartaPostLoad in: each) ].
	pragmas
		do:
			[ :each | each method methodClass instanceSide perform: each method selector ]
]
