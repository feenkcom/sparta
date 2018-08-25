"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestSpartaCore,
	#superclass : #PackageManifest,
	#category : 'Sparta-Core'
}

{ #category : #'code-critics' }
ManifestSpartaCore class >> ruleRBConsistencyCheckRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#SpRope #isNotEmpty #false)) #'2016-12-24T19:39:40.268417+01:00') #(#(#RGMethodDefinition #(#SpRope #isEmpty #false)) #'2016-12-24T19:40:56.202578+01:00') )
]
