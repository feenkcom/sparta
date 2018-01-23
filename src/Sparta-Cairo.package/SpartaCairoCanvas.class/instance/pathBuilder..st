builders
pathBuilder: aFillRuleSymbol
	^ SpartaCairoPathBuilder new fillRule: (SpartaCairoFillRule named: aFillRuleSymbol)