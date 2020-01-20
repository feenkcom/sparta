Class {
	#name : #SkiaBatcher,
	#superclass : #SpartaBatcher,
	#instVars : [
		'textRunBatch'
	],
	#category : #'Sparta-Skia-Builders'
}

{ #category : #initialization }
SkiaBatcher >> initialize [
	super initialize.
	
	textRunBatch := OrderedCollection new
]

{ #category : #accessing }
SkiaBatcher >> process [

	"textRunBatch is a set of consisting of:
	{ 
		aString.
		aSkiaFont.
		aSkiaPaintBlock.
		aFinishedBlock
	}
	
	"
	| start |
	SkiaTextToGlyphsBatch newDuring: [ :aSkiaTextToGlyphsBatch |
		SkiaPaint
			new: textRunBatch size
			during: [ :thePaints |
				GtBoxerString
					new: textRunBatch size
					during: [ :theBoxerStrings |
						GtBoxerArrayU16
							new: textRunBatch size
							during: [ :theGlyphArrays |
								textRunBatch withIndexDo: [ :eachRequest :eachIndex |
									| eachSkiaPaint eachBoxerString eachGlyphArray eachSkiaFont |
									
									eachBoxerString := theBoxerStrings at: eachIndex.
									eachBoxerString string: eachRequest first.
									
									eachSkiaFont := eachRequest second.
									
									eachSkiaPaint := thePaints at: eachIndex.
									eachRequest third value: eachSkiaPaint.

									eachGlyphArray := theGlyphArrays at: eachIndex.
									
									aSkiaTextToGlyphsBatch
										addString: eachBoxerString
										encoding: SkiaTextEncoding UTF8
										font: eachSkiaFont
										paint: eachSkiaPaint
										glyphs: eachGlyphArray ].
								
								aSkiaTextToGlyphsBatch process.
								
								textRunBatch withIndexDo: [ :eachRequest :eachIndex |
									| eachTextRun |
									
									eachTextRun := SkiaTextRun new
										font: eachRequest second;
										glyphs: (theGlyphArrays at: eachIndex) asByteArray;
										advance: (aSkiaTextToGlyphsBatch advanceAt: eachIndex);
										bounds: (aSkiaTextToGlyphsBatch boundsAt: eachIndex).
										
									eachRequest fourth value: eachTextRun
								]
							]
						]
					]
				]
]

{ #category : #enumerating }
SkiaBatcher >> textRunFrom: aString font: aSkiaFont paint: aSkiaPaintBlock whenFinishedDo: aFinishedBlock [
	textRunBatch add: { 
		aString.
		aSkiaFont.
		aSkiaPaintBlock.
		aFinishedBlock
	}
]
