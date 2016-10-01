drawing
draw: aRope on: aCanvas from: aStart to: anEnd
	"Don't worry, I will refactor it :) "

	| iterator renderedRope baseline |
	renderedRope := aRope from: aStart to: anEnd.
	baseline := 0@0.

	iterator := renderedRope iterator: 1 to: renderedRope size.
	[ iterator hasNext ] whileTrue: [ 
		| run attributes textPainter fontBuilder font runIterator characters renderBlock |
		run := iterator nextRun.	
		
		attributes := run attributes.
		fontBuilder := aCanvas font.
		textPainter := aCanvas text.

		attributes do: [ :attribute |
			attribute drawOn: aCanvas with: run.
			attribute applyOnFont: fontBuilder with: run.
			attribute applyOnText: textPainter with: run ].
		
		font := fontBuilder build.
		textPainter font: font.
		
		runIterator := run iterator: 1 to: run size.
		
		characters := OrderedCollection new.

		renderBlock := [ :aCharacters |
			aCharacters isNotEmpty ifTrue: [
				| string metrics |
				string := aCharacters as: String.
				aCharacters removeAll.

				textPainter string: string.
				metrics := textPainter measure.
				textPainter baseline: baseline.
				textPainter draw.
				baseline := baseline + (metrics textMetrics advanceWidth @ 0) ] ].
			
		[ runIterator hasNext ] whileTrue: [ 
			| item |
			item := runIterator next.
			item isCharacter
				ifTrue: [ characters add: item ]
				ifFalse: [ renderBlock value: characters ] ].
		renderBlock value: characters ]