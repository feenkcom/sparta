Class {
	#name : 'SkiaPerformanceLogger',
	#superclass : 'MemoryLogger',
	#instVars : [
		'interestingSignals'
	],
	#category : 'Sparta-Skia-Telemetry'
}

{ #category : 'instance creation' }
SkiaPerformanceLogger class >> on: aSignalClassOrCollection [
	^ self new signals: aSignalClassOrCollection
]

{ #category : 'accessing' }
SkiaPerformanceLogger >> gtPerformanceTreeFor: aView [
	<gtView>
	^ aView explicit
		title: 'Treemap';
		priority: 10;
		stencil: [
			| aTotalDuration theGroups |
			
			aTotalDuration := self totalDuration.
			theGroups := ((recordings groupedBy: #class)
				collect: [ :eachGroup | (eachGroup sum: [ :each | each duration ]) / aTotalDuration ])
					associations.
			
			GtNestedRectangleTreeMap new
				roots: { theGroups };
				leaves: [ :aNode | aNode ];
				deep: [ :aNode | #() ];
				leavesSize: [ :aNode | aNode value ];
				containerElement: [ :anElement :aNodeContext |
					anElement padding: (BlInsets all: 1) ];
				leafElement: [ :anElement :aLeafContext | 
					anElement addChild:
						(BrLabel new
							text: (aLeafContext model key new name, ': ', (aLeafContext model value * 100) rounded asString, '%');
							aptitude: (BrGlamorousLabelAptitude new fontSize: 14; foreground: Color darkGray);
							constraintsDo: [ :c | c ignoreByLayout ]).
					anElement border: (BlBorder paint: (Color gray alpha: 0.5 / aLeafContext level) width: 1).
					anElement background: (Color red alpha: aLeafContext model value) ];
				create ]
]

{ #category : 'initialization' }
SkiaPerformanceLogger >> initialize [
	super initialize.
	
	interestingSignals := #()
]

{ #category : 'initialization' }
SkiaPerformanceLogger >> interestingSignals [
	^ interestingSignals
]

{ #category : 'accessing' }
SkiaPerformanceLogger >> nextPut: aSignal [
	(self interestingSignals anySatisfy: [ :eachSignalClass |
		aSignal class == eachSignalClass or: [ aSignal class inheritsFrom: eachSignalClass ] ])
			ifFalse: [ ^ self ].

	super nextPut: aSignal
]

{ #category : 'initialization' }
SkiaPerformanceLogger >> signals: aSignalClassOrCollection [
	interestingSignals := aSignalClassOrCollection asOrderedCollection asArray
]

{ #category : 'accessing' }
SkiaPerformanceLogger >> totalDuration [
	^ recordings
		inject: 0 milliSeconds
		into: [ :total :each | total + each duration ]
]
