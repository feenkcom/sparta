geometry
width
	"Return measured width of the layout.
	Note: width may be greater than maxWidth. This may happen
	if maxWidth is smaller than width of a single line or word or character.
	We want to guarantee that at least something is displayed and measured."
	<return: #Number>

	^ width