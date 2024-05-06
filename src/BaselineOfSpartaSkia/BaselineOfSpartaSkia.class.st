Class {
	#name : #BaselineOfSpartaSkia,
	#superclass : #BaselineOf,
	#category : #BaselineOfSpartaSkia
}

{ #category : #baseline }
BaselineOfSpartaSkia >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec
			baseline: 'SpartaCore' with: [
				spec repository: 'github://feenkcom/Sparta:v0.8.184/src' ].
		spec
			baseline: 'GToolkitBoxer' with: [
				spec repository: 'github://feenkcom/gtoolkit-boxer:v0.8.53/boxer-bindings' ].
		spec
			baseline: 'GToolkitPhlowForRust' with: [
				spec repository: 'github://feenkcom/gt4phlow-rs:v0.6.9/src' ].
		spec
			baseline: 'GToolkitExamplesEngine' with: [
				spec repository: 'github://feenkcom/gtoolkit-examples:v0.8.92/src' ].

		spec package: 'Sparta-Skia' with: [
			spec requires: #('SpartaCore' 'GToolkitBoxer' 'GToolkitPhlowForRust' 'GToolkitExamplesEngine') ].
	]
]
