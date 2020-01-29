"
I am a proxy to represent the memory of an image 
"
Class {
	#name : #SpExternalMemory,
	#superclass : #Object,
	#category : #TheoSystem
}

{ #category : #copying }
SpExternalMemory >> copyFrom: aCollection to: aCollection2 [ 
	| offset |
	offset := aCollection2 asInteger - aCollection asInteger. 
	^aCollection copyFrom: 1 to: offset.
]

{ #category : #accessing }
SpExternalMemory >> integerAt: address size: anInt signed: aBool [
	
	^ address integerAt: 1 size: anInt signed: aBool
]

{ #category : #accessing }
SpExternalMemory >> long64At: bodyAddress bigEndian: aBool [.

	^ bodyAddress integerAt: 1 size: 8 signed: true.

]

{ #category : #accessing }
SpExternalMemory >> unsignedLongAt: anExternalAddress bigEndian: isBigEndian [
	
	^ anExternalAddress unsignedLongAt: 1 bigEndian: isBigEndian
]
