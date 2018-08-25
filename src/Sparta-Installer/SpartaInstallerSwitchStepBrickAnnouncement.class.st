"
I am sent when step brick should we switched. It happens when we switch to the next installer step
"
Class {
	#name : #SpartaInstallerSwitchStepBrickAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'brick'
	],
	#category : 'Sparta-Installer-Announcements'
}

{ #category : #accessing }
SpartaInstallerSwitchStepBrickAnnouncement >> brick [
	<return: #GLMBrick>

	^ brick
]

{ #category : #accessing }
SpartaInstallerSwitchStepBrickAnnouncement >> brick: aGLMBrick [
	brick := aGLMBrick
]
