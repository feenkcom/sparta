geometry
extent
	"Return measured extent of text layout.
	Note that extent is always smaller than maxWidth@maxHeight"
	<return: #Point>

	^ self width @ self height