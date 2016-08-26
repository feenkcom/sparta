*Sparta-Core
asSpartaPaintOn: aSpartaCanvas
	"First create a bitmap surface from form and delegate convertion further"
	^ (aSpartaCanvas bitmap fromForm: self) asSpartaPaintOn: aSpartaCanvas