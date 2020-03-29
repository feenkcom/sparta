Class {
	#name : #BaselineOfSpartaWrapper,
	#superclass : #BaselineOf,
	#category : #BaselineOfSpartaWrapper
}

{ #category : #baseline }
BaselineOfSpartaWrapper >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec baseline: 'SpartaCore' with: [
				spec repository: 'github://feenkcom/Sparta:v0.7.126/src' ].
		spec package: 'Sparta-Wrapper' with: [
				spec requires: #('SpartaCore' ). ]. ].

]
