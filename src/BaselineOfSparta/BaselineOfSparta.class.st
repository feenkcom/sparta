"
I am a Baseline of Sparta.
"
Class {
	#name : #BaselineOfSparta,
	#superclass : #BaselineOf,
	#category : #BaselineOfSparta
}

{ #category : #baselines }
BaselineOfSparta >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec
		postLoadDoIt: #postLoadSparta:;
		baseline: 'SpartaCore' with: [ 
			spec repository: 'github://syrel/Sparta/src' ];
		baseline: 'SpartaCairo' with: [ 
			spec repository: 'github://syrel/Sparta/src' ];
		baseline: 'SpartaMoz2D' with: [ 
			spec repository: 'github://syrel/Sparta/src' ] ]
]

{ #category : #baselines }
BaselineOfSparta >> postLoadSparta: aSpecLoader [
	#spartaPostLoad pragmas do: [ :each | each method methodClass instanceSide perform: each method selector ]
]
