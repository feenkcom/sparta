opening
openInBorderlessWindow
	^ (self asBrickedMorph mozOpenInWindowAt: 0@0)
		makeBorderless;
		beWithoutGrips;
		removeLabelArea