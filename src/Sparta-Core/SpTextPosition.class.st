Class {
	#name : #SpTextPosition,
	#superclass : #Object,
	#instVars : [
		'lineIndex',
		'spanIndex',
		'offset'
	],
	#category : 'Sparta-Core-Text-Rendering'
}

{ #category : #'instance creation' }
SpTextPosition class >> line: aLineIndex span: aSpanIndex offset: anOffsetInSpan [
	^ self new
		line: aLineIndex span: aSpanIndex offset: anOffsetInSpan;
		yourself
]

{ #category : #'instance creation' }
SpTextPosition class >> none [
	^ self line: 0 span: 0 offset: 0 
]

{ #category : #initialization }
SpTextPosition >> line: aLineIndex span: aSpanIndex offset: anOffsetInSpan [
	lineIndex := aLineIndex.
	spanIndex := aSpanIndex.
	offset := anOffsetInSpan
]
