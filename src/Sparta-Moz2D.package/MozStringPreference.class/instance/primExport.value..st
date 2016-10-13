preferences
primExport: aName value: aValue

	^ self ffiCall: #(void moz_preferences_set_string (short* aName, short* aValue))