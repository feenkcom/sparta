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
				spec repository: 'github://feenkcom/Sparta:v0.8.246/src' ].
		spec
			baseline: 'GToolkitBoxer' with: [
				spec repository: 'github://feenkcom/gtoolkit-boxer:v0.8.61/boxer-bindings' ].

		spec package: 'Sparta-Skia' with: [
			spec requires: #(#SpartaCore #GToolkitBoxer) ].
	]
]
