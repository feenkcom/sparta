initialize-release
initializeFont: aSpan on: aCanvas
	| fontBuilder attributes |

	attributes := aSpan attributes.
	fontBuilder := aCanvas font.

	attributes do: [ :attribute |
		attribute applyOnFont: fontBuilder with: aSpan].

	^ fontBuilder build