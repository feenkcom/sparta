Extension { #name : #SpartaMatrix }

{ #category : #'*Sparta-Moz2D' }
SpartaMatrix >> asExternalArray [
	|array|
"
| sx   shx   x   |      | a11  a12 |      | a11  a21  a31 |
| shy  sy    y   |  =>  | a21  a22 |  =>  | a12  a22  a32 |  => [ a11 a12 a21 a22 a31 a32 ]
|  0    0    1   |      | a31  a32 | 
"
	array := FFIExternalArray externalNewType: 'float' size: 6.
	array at: 1 put: sx.
	array at: 2 put: shy.
	array at: 3 put: shx.
	array at: 4 put: sy.
	array at: 5 put: x.
	array at: 6 put: y.
	^ array
]

{ #category : #'*Sparta-Moz2D' }
SpartaMatrix class >> fromExternalArray: anArray [
	^ self new
		sx: (anArray at: 1);
		shy: (anArray at: 2);
		shx: (anArray at: 3);
		sy: (anArray at: 4);
		x: (anArray at: 5);
		y: (anArray at: 6);
		yourself
]
