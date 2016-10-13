gt-inspector-extension
gtInspectorDevicesIn: composite
	<gtInspectorPresentationOrder: 30>
	composite table
		title: 'Devices';
		display: [ self devices ];
		when: [ self size isZero not ];
		column: 'Name' evaluated: [ :each | each description ];
		column: 'Device Id' evaluated: [ :each | each deviceId printString ];
		column: 'Vendor Id' evaluated: [ :each | each vendorId printString ]