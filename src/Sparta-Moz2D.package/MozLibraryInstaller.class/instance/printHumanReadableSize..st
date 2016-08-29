printing
printHumanReadableSize: aTotalNumber

	^ ((aTotalNumber / (1024 * 1024)) asFloat round: 1) printString, 'MB'