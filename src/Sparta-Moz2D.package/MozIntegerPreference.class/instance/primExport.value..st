private - ffi
primExport: aName value: aValue

	^ self ffiCall: #(void moz_preferences_set_int (short* aName, int32 aValue))