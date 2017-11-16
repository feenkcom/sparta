instance creation
newStepBrickIn: anInstaller
	| aContainer aLabel progressBrick |
	
	aContainer := GLMBandBrick new.
	aContainer margin: 20.
	aContainer hSpaceFill.
	aContainer vAlign: #center.
	
	aLabel := GLMLabelBrick new.
	aLabel text: 'Downloading Moz2D...'.
	aLabel hSpaceFill.
	aLabel marginBottom: 5.
	
	progressBrick := MozInstallerProgressBrick new.
	progressBrick hSpaceFill.
	progressBrick height: 4.
	progressBrick marginTop: 5.
	progressBrick color: Color veryVeryLightGray.
	progressBrick progressColor: Color lightGray.
	
	self when: MozInstallerDownloadProgress do: [ :anAnnouncement |
		| anHTTPProgress |
		anHTTPProgress := anAnnouncement progress.
		anHTTPProgress isEmpty
			ifFalse: [ progressBrick progress: anHTTPProgress fraction asFloat  ].
	].

	aContainer addAllBricks: { aLabel . progressBrick }.

	^ aContainer