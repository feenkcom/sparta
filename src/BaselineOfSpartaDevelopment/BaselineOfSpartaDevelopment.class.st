Class {
	#name : #BaselineOfSpartaDevelopment,
	#superclass : #BaselineOf,
	#category : #BaselineOfSpartaDevelopment
}

{ #category : #baselines }
BaselineOfSpartaDevelopment >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec
		baseline: 'Sparta' with: [ spec 
			repository: 'github://syrel/Sparta/src' ];
		baseline: 'SpartaMoz2D' with: [ spec 
			repository: 'github://syrel/Sparta/src' ];

		package: 'Sparta-Critiques'
	].
]
