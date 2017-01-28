private
calcCenter: start end: end angle: angle

	| v  center radius len m |	

	v := end - start.
	
	m := SpartaMatrix new rotateByRadians: (Float pi - angle   /2).

	v := m transform: v.
	len := v r.
	radius := len / 2 / (angle /2) sin.
	
	center := v * (radius/len) + start.

	^ center