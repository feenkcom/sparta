instance creation
create: aCairoFontFace fontMatrix: aFontMatrix userToDeviceMatrix: aUserToDeviceMatrix options: theFontOptions
	| aFontCairoMatrix aUserToDeviceCairoMatrix aScaledFont |

	aFontCairoMatrix := SpartaCairoMatrix fromSpartaMatrix: aFontMatrix.
	aUserToDeviceCairoMatrix := SpartaCairoMatrix fromSpartaMatrix: aUserToDeviceMatrix.

	aScaledFont := (self primCreate: aCairoFontFace fontMatrix: aFontCairoMatrix userToDeviceMatrix: aUserToDeviceCairoMatrix options: theFontOptions)
		autoRelease;
		cairoFontFace: aCairoFontFace;
		fontMatrix: aFontMatrix;
		userToDeviceMatrix: aUserToDeviceMatrix;
		options: theFontOptions;
		yourself.

	^ aScaledFont