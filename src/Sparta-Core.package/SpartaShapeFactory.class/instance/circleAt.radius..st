shapes
circleAt: aPoint radius: aNumber
	"Return a closed circle shape with center at aPoint and radius aNumber"
	<return: #TSpartaPath>

	^ canvas path
		absolute;
		moveTo: aPoint + (aNumber @ 0);
		arcAround: aPoint radius: aNumber startAngle: 0 endAngle: Float pi * 2;
		close;
		finish