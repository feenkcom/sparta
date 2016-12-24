drawing
drawBelowOn: aCanvas with: aSpan
	"I render background under text span"

	aCanvas fill
		paint: paint;
		path: (aSpan origin extent: aSpan extent);
		draw