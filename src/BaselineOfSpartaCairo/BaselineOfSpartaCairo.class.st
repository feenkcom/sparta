"
I am a Baseline of Sparta-Cairo backend
"
Class {
	#name : #BaselineOfSpartaCairo,
	#superclass : #BaselineOf,
	#category : #BaselineOfSpartaCairo
}

{ #category : #baseline }
BaselineOfSpartaCairo >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec baseline: 'SpartaCore' with: [
				spec repository: 'github://feenkcom/Sparta:v0.7.158/src' ].
		spec package: 'Sparta-Cairo' with: [
				spec requires: #('SpartaCore' ). ]. ].

]
