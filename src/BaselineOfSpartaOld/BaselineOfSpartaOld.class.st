Class {
	#name : #BaselineOfSpartaOld,
	#superclass : #BaselineOf,
	#category : 'BaselineOfSpartaOld'
}

{ #category : #baselines }
BaselineOfSpartaOld >> baseline: spec [
	<baseline>
	spec for: #common do: [spec
		baseline: 'Beacon' with: [ spec repository: 'github://pharo-project/pharo-beacon/repository' ];
		postLoadDoIt: #postLoadSparta:;
		
		package: 'Sparta-Core';
		package: 'Sparta-Moz2D'
			with: [ spec requires: #('Sparta-Core') ];
		package: 'Sparta-Installer'
			with: [ spec requires: #('Sparta-Moz2D' 'Beacon') ];
		package: 'Sparta-Moz2D-Installer'
			with: [ spec requires: #('Sparta-Moz2D' 'Beacon' 'Sparta-Installer') ];
		package: 'Sparta-Moz2D-Tests'
			with: [ spec requires: #('Sparta-Moz2D') ];
		package: 'Sparta-Cairo'
			with: [ spec requires: #('Sparta-Core') ];

		"additional development packages"
		package: 'Sparta-Critiques';

		"groups with only sources"
		group: 'core' with: #(
			'Sparta-Core'
			'Sparta-Cairo');
			
		group: 'development' with: #(
			'core'
			'Sparta-Critiques'
			'Sparta-Moz2D'
			'Sparta-Installer'
			'Sparta-Moz2D-Installer'
			'Sparta-Moz2D-Tests');

		"Allow better integration of Sparta in Bloc"
		group: 'stub' with: #();
		
		"#default should not be used"
		group: 'default' with: #(core) ].
]

{ #category : #actions }
BaselineOfSpartaOld >> postLoadSparta: aSpecLoader [
	| pragmas |
	
	pragmas := OrderedCollection new.
	Object withAllSubclassesDo: [:each |
		pragmas addAll: (Pragma allNamed: #spartaPostLoad in: each) ].
	pragmas do: [ :each | each method methodClass baseClass perform: each method selector ]
]
