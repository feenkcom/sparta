private
addFontEntry: aFontEntry

	self primAddFontEntry: aFontEntry named: aFontEntry name.
	
	fontEntries
		at: aFontEntry name
		ifPresent: [ :aSet | aSet add: aFontEntry ]
		ifAbsentPut: [ Set with: aFontEntry ]