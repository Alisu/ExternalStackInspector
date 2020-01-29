Class {
	#name : #BaselineOfStackFrameInspector,
	#superclass : #BaselineOf,
	#category : #BaselineOfStackFrameInspector
}

{ #category : #baselines }
BaselineOfStackFrameInspector >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec
				baseline: 'SpurReader' with: [ spec repository: 'github://Alisu/PharoImageInspector'];
				package: 'TheoSystem' with:[ spec requires: #('SpurReader') ]
		]
]

{ #category : #baselines }
BaselineOfStackFrameInspector >> projectClass [
	^ MetacelloCypressBaselineProject
]
