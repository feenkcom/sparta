Class {
	#name : #BaselineOfSpartaMoz2DDevelopment,
	#superclass : #BaselineOf,
	#category : 'BaselineOfSpartaMoz2DDevelopment'
}

{ #category : #baselines }
BaselineOfSpartaMoz2DDevelopment >> baseline: spec [
	<baseline>
	spec for: #common do: [spec
		postLoadDoIt: #postLoadSparta:;
		baseline: 'Beacon' with: [ spec 
			repository: 'github://pharo-project/pharo-beacon/repository' ];
		baseline: 'SpartaMoz2D' with: [ spec 
			repository: 'github://syrel/Sparta/src' ];
		baseline: 'SpartaCoreDevelopment' with: [ spec 
			repository: 'github://syrel/Sparta/src' ];

		package: 'Sparta-Moz2D-Installer' with: [ spec 
			requires: #('SpartaMoz2D' 'Beacon' 'SpartaCoreDevelopment') ]
	].
]

{ #category : #actions }
BaselineOfSpartaMoz2DDevelopment >> postLoadSparta: aSpecLoader [
	| pragmas |
	
	pragmas := OrderedCollection new.
	Object withAllSubclassesDo: [:each |
		pragmas addAll: (Pragma allNamed: #spartaPostLoad in: each) ].
	pragmas do: [ :each | each method methodClass baseClass perform: each method selector ]
]
