private - ffi
primChar32: aString32 toChar16: aString16 length: aLength

	^ self ffiCall: #(bool moz2d_text_convert_char32_to_char16(uint32* aString32, uint32 aLength, const uint16* aString16))