Class {
	#name : #MozInstallerDownloadProgress,
	#superclass : #Announcement,
	#instVars : [
		'progress'
	],
	#category : 'Sparta-Moz2D-Installer-Announcements'
}

{ #category : #accessing }
MozInstallerDownloadProgress >> progress [
	^ progress
]

{ #category : #accessing }
MozInstallerDownloadProgress >> progress: anObject [
	progress := anObject
]
