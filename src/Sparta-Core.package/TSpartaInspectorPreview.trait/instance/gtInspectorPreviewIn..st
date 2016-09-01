gt-inspector-extension
gtInspectorPreviewIn: composite
	<gtInspectorPresentationOrder: 90>  
	| morphPresentation |
	morphPresentation := composite morph.
	morphPresentation 
		title: 'Preview';
		display: [
			[ self asForm asMorph ]
			on: Error
			do:[ :e | IconicListItem
				text:' Error drawing Preview (', e description, ')'
				icon: (Smalltalk ui icons iconNamed: #smallWarningIcon) ] ];
		act: [ :pres | self asForm asMorph exportAsPNG ] entitled: 'Export as PNG'