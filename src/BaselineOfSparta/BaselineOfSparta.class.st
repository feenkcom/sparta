"
I am a Baseline of Sparta.
"
Class {
	#name : #BaselineOfSparta,
	#superclass : #BaselineOf,
	#category : #BaselineOfSparta
}

{ #category : #baseline }
BaselineOfSparta >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			baseline: 'SpartaCore' with: [
				spec repository: 'github://feenkcom/Sparta:v0.6.7/src' ];
			baseline: 'SpartaCairo' with: [
				spec repository: 'github://feenkcom/Sparta:v0.6.7/src' ];
			baseline: 'SpartaMoz2D' with: [
				spec repository: 'github://feenkcom/Sparta:v0.6.7/src' ]. ].

]
