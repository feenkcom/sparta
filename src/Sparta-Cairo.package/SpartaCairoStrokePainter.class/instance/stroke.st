private
stroke
	"Perform a stroke operation"

	self primStroke.
	"do not forget to restore source to default"
	self primSetSourceR: 0.0 G: 0.0 B: 0.0 A: 1.0