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

	spec for: #common do: [ spec
		baseline: 'SpartaCore' with: [ spec 
			repository: 'github://syrel/Sparta/src' ];
		baseline: 'GToolkitInstaller' with: [ spec 
			repository: 'github://feenkcom/gtoolkit-installer/src' ];
		package: 'Sparta-Moz2D' with: [ spec 
			requires: #('SpartaCore' 'GToolkitInstaller') ];
		package: 'Sparta-Moz2D-Tests' with: [ spec 
			requires: #('Sparta-Moz2D') ] ]
]
