finalization
toFinalizeSend: aSelector to: aFinalizer with: aResourceHandle
	super toFinalizeSend: aSelector to: aFinalizer with: aResourceHandle.
	'finalized' logCr.