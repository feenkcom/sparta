dispatch
spartaClipOn: aSpartaCanvas with: aSpartaClipper
	"When clipping by line we actually clip by rectangle that encompasses the line"
	aSpartaClipper pushRectangle: ((from min: to) corner: (from max: to))