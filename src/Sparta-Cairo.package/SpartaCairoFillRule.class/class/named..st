instance creation
named: aFillRuleSymbol
	aFillRuleSymbol = #nonzero
		ifTrue: [ ^ self CAIRO_FILL_RULE_WINDING ].
	aFillRuleSymbol = #evenodd
		ifTrue: [ ^ self CAIRO_FILL_RULE_EVEN_ODD ].
		
	self error: 'Unknown fill rule type'