accessing
canvas: aCanvas
	"Metrics provider requires a canvas, since measurement process is backend
	specific and underlying engine needs to have reference to the actual backend."
	canvas := aCanvas