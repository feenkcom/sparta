Class {
	#name : #BaselineOfSpartaSkia,
	#superclass : #BaselineOf,
	#classVars : [
		'PostLoaded'
	],
	#category : #BaselineOfSpartaSkia
}

{ #category : #baseline }
BaselineOfSpartaSkia >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec postLoadDoIt: #'postLoadSkia:'.
		spec
			baseline: 'SpartaCore' with: [
				spec repository: 'github://feenkcom/Sparta:v0.8.89/src' ].
		spec
			baseline: 'GToolkitInstaller' with: [
				spec repository: 'github://feenkcom/gtoolkit-installer:v0.8.13/src' ].
		spec
			baseline: 'GToolkitBoxer' with: [
				spec repository: 'github://feenkcom/gtoolkit-boxer:v0.8.26/boxer-bindings' ].
		spec
			baseline: 'GToolkitExamplesEngine' with: [
				spec repository: 'github://feenkcom/gtoolkit-examples:v0.8.46/src' ].

		spec package: 'Sparta-Skia' with: [
			spec requires: #('SpartaCore' 'GToolkitInstaller' 'GToolkitBoxer' 'GToolkitExamplesEngine') ].
	]
]

{ #category : #baseline }
BaselineOfSpartaSkia >> postLoadSkia: aSpecLoader [
	"prevent from installing multiple times by metacello"	
	(PostLoaded isNotNil and: [ PostLoaded ])
		ifTrue: [ ^ self ].

	PostLoaded := true.
	(self class environment at: #SkiaLibrary) install
]
