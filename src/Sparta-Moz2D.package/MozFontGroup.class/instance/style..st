accessing
style: aFontStyle
	"We need to hard ref a font style to prevent it from being garbage collected
	and make sure that its lifetime is greater than font group"
	style := aFontStyle