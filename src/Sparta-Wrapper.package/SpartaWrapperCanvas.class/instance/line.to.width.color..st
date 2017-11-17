private
line: pt1 to: pt2 width: w color: c
	"Draw a line using the given width and color"
	
	self canvas stroke
		path: (self canvas shape line: pt1 to: pt2);
		paint: c;
		width: w;
		draw