gt-inspector-extension
gtInspectorFeaturesIn: composite
	<gtInspectorPresentationOrder: 30>
	composite table
		title: 'Features';
		display: [ self features ];
		when: [ self size isZero not ];
		column: 'Name' evaluated: [ :each | each name ];
		column: 'Description' evaluated: [ :each | each description ];
		column: 'Enabled' evaluated: [ :each | each isEnabled printString ];
		column: 'Status' evaluated: [ :each | each status item asString ]