"
I am a Baseline of Sparta.
"
Class {
	#name : #BaselineOfSparta,
	#superclass : #BaselineOf,
	#category : 'BaselineOfSparta'
}

{ #category : #baselines }
BaselineOfSparta >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec
		baseline: 'SpartaCore' with: [ 
			spec repository: 'github://syrel/Sparta/src' ];
		baseline: 'SpartaCairo' with: [ 
			spec repository: 'github://syrel/Sparta/src' ]
	].
]
