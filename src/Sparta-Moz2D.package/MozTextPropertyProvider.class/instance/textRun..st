private
textRun: aTextRun
	"Let text property provider know a text run during measurement process.
	Warning! Text run must be set to nil right after measurement to avoid
	memory leaks"

	textRun := aTextRun