drawing
drawOn: aCanvas with: aSpan
	"Attribute may add additional visual effects"
	aCanvas fill
		paint: color;
		path: ((aSpan origin extent: aSpan extent));
		draw