*Sparta-Moz2D
mozFromFreetypeFont: aFont cairoFace: face

	| options fontMatrix deviceMatrix font |

	options := CairoFontOptions new.
	fontMatrix := AthensCairoMatrix new.
	deviceMatrix := AthensCairoMatrix new.

	fontMatrix scaleBy: (TextStyle pointsToPixels: aFont pointSize).

	font := MozCanvas primCreateCairoScaledFont: face fontMatrix: fontMatrix  userToDeviceMatrix: deviceMatrix options: options. 
	
	"to keep a reference to cairo face in instance"
	^ font initWithFace: face.
	
