private
isWhitespace: aCharacter
	"Return true if aCharacter is a whitespace and
	therefore needs to be skipped if appears on new line after
	line break"
	<return: #Boolean>

	^ aCharacter = Character space