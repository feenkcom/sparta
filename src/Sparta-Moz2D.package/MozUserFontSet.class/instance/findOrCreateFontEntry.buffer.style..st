private
findOrCreateFontEntry: aFamilyName buffer: aBufferArray style: aMozFontStyle
	| aFontEntry |
	
	aFontEntry := self
		primFindOrCreateFontEntry: aFamilyName
		buffer: aBufferArray
		length: aBufferArray size
		style: aMozFontStyle.

	aFontEntry autoRelease.
	aFontEntry load.

	^ aFontEntry