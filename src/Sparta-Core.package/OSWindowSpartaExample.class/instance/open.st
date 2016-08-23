instance creation
open
	| attrs |
	attrs := OSWindowAttributes new.
	attrs preferableDriver: self defaultPreferableDriver;
		extent: self defaultExtent;
		resizable: false;
		position: 100@100.
		
	window := OSWindow createWithAttributes: attrs.
	
	renderer := self createSpartaRenderer.

	window eventHandler: self createEventHandler.
	
	drawingProcess := self createDrawingProcess