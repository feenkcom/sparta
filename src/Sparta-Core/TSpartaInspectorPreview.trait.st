"
I add preview feature to the object that can be converted to or presented as a Form.

Classes that use me must implement asForm convertion method.
"
Trait {
	#name : #TSpartaInspectorPreview,
	#category : #'Sparta-Core-Utils'
}

{ #category : #converting }
TSpartaInspectorPreview >> asForm [
	^ self explicitRequirement
]

{ #category : #'gt-inspector-extension' }
TSpartaInspectorPreview >> gtPreviewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Preview';
		priority: 1;
		stencil: [ self asForm asElement ]
]
