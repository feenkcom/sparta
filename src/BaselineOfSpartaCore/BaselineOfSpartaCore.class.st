Class {
	#name : #BaselineOfSpartaCore,
	#superclass : #BaselineOf,
	#category : #BaselineOfSpartaCore
}

{ #category : #baselines }
BaselineOfSpartaCore >> baseline: spec [
	<baseline>

	spec for: #common do: [ spec package: 'Sparta-Core' ]
]
