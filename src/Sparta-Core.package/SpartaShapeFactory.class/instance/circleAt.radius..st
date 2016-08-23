shapes
circleAt: aPoint radius: aNumber
	"Return a closed circle shape with center at aPoint and radius aNumber"
	<return: #SpartaPath>

	^ canvas path
		arcAround: aPoint radius: aNumber startAngle: 0 endAngle: Float pi * 2;
		finish