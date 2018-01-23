instance creation
named: aFillRuleSymbol
	aFillRuleSymbol = #nonzero
		ifTrue: [ ^ self FILL_WINDING ].
	aFillRuleSymbol = #evenodd
		ifTrue: [ ^ self FILL_EVEN_ODD ].
		
	self error: 'Unknown fill rule type'