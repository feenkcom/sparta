private - ffi
primToStringQuotes: withQuotes
	"withQuotes is a boolean"
	
	^ self ffiCall: #(char* moz2d_font_family_name_to_string (self, bool withQuotes))