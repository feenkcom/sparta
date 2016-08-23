private - ffi
primToStringQuotes: withQuotes includeDefault: includeDefault

	^ self ffiCall: #(char* moz2d_font_family_list_to_string(self, bool withQuotes, bool includeDefault))