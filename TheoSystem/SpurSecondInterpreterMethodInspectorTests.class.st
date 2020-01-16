Class {
	#name : #SpurSecondInterpreterMethodInspectorTests,
	#superclass : #SpurMethodInspectorTests,
	#category : #TheoSystem
}

{ #category : #running }
SpurSecondInterpreterMethodInspectorTests >> setUp [
	
	image := SpurExternalImage
		newImage: '/Users/theo/Documents/Pharo/images/TestImage2/TestImage2.image'
		withArguments: 'eval 10 factorial'.
	(Delay forSeconds: 2) wait
]

{ #category : #running }
SpurSecondInterpreterMethodInspectorTests >> someMethod [

	^ image getFrame method
]
