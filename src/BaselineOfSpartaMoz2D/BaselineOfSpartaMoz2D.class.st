"
I am a Baseline of Sparta-Moz2D backend
"
Class {
	#name : #BaselineOfSpartaMoz2D,
	#superclass : #BaselineOf,
	#classVars : [
		'PostLoaded'
	],
	#category : #BaselineOfSpartaMoz2D
}

{ #category : #baseline }
BaselineOfSpartaMoz2D >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec postLoadDoIt: #'postLoadMoz2D:'.
		spec 
			baseline: 'SpartaCore' with: [
				spec repository: 'github://feenkcom/Sparta:v0.7.1/src' ];
			baseline: 'GToolkitInstaller' with: [
				spec repository: 'github://feenkcom/gtoolkit-installer:v0.7.0/src' ].
		spec 
			package: 'Sparta-Moz2D' with: [
				spec requires: #('SpartaCore' 'GToolkitInstaller' ). ];
			package: 'Sparta-Moz2D-Tests' with: [
				spec requires: #('Sparta-Moz2D' ). ]. ].

]

{ #category : #baseline }
BaselineOfSpartaMoz2D >> postLoadMoz2D: aSpecLoader [
	"prevent from installing multiple times by metacello"	
	(PostLoaded isNotNil and: [ PostLoaded ])
		ifTrue: [ ^ self ].

	PostLoaded := true.
	(self class environment at: #MozLibrary) install
]
