Class {
	#name : #SpurExternalImage,
	#superclass : #SpurImage,
	#instVars : [
		'myGIVNumber'
	],
	#category : #TheoSystem
}

{ #category : #'instance creation' }
SpurExternalImage class >> newImage: aString withArguments: anotherString [

| anImage |
anImage := self new.
anImage myGIVNumber: (self newPrimitiveImage: aString withArguments: anotherString).
	^anImage.
]

{ #category : #'instance creation' }
SpurExternalImage class >> newPrimitiveImage: aString withArguments: anotherString [
"Primitive 123 would correspond to launching in a new thread doing the equivalent of:
./Pharo aString anotherString
Exemple:
SmalltalkImage newImage: '/Users/Pharo/images/TestImage2/TestImage2.image' withArguments: 'eval 10 factorial' =>
./Pharo /Users/Pharo/images/TestImage2/TestImage2.image eval 10 factorial 
"
	<primitive: 123>
]

{ #category : #accessing }
SpurExternalImage >> GIVElement: aString ofInterpreter: anInt [
	
	<primitive: 153>
	self primitiveFail 
]

{ #category : #formatting }
SpurExternalImage >> format [ 
	"64 bits for me for you i don't know"
	^64
]

{ #category : #stepping }
SpurExternalImage >> getFrame [
	^ StackFrameHandler on: (self getFrame: self myGIVNumber) image: self
]

{ #category : #stepping }
SpurExternalImage >> getFrame: anInt [
	 
	<primitive: 151>
	self primitiveFail 
]

{ #category : #accessing }
SpurExternalImage >> headerSize [ 
	^128
]

{ #category : #accessing }
SpurExternalImage >> memory [
	
	^ SpExternalMemory new
]

{ #category : #accessing }
SpurExternalImage >> myGIVNumber [
	^ myGIVNumber
]

{ #category : #accessing }
SpurExternalImage >> myGIVNumber: anObject [
	myGIVNumber := anObject
]

{ #category : #stepping }
SpurExternalImage >> nextInInterpreter: anInteger [
		
		<primitive: 150>
]

{ #category : #stepping }
SpurExternalImage >> nilObject [
	^ SpurObject on: self nilObjectAddress image: self
]

{ #category : #stepping }
SpurExternalImage >> nilObjectAddress [
	^ self nilObjectAddress: self myGIVNumber
]

{ #category : #stepping }
SpurExternalImage >> nilObjectAddress: anInt [
	 
	^self GIVElement: 'nilObj' ofInterpreter: anInt
]

{ #category : #accessing }
SpurExternalImage >> objectAt: aCollection [ 
	^aCollection pointerAt: 1. 
]

{ #category : #accessing }
SpurExternalImage >> oldBaseAddress [ 
	^(self oldBaseAddress: self myGIVNumber)
]

{ #category : #accessing }
SpurExternalImage >> oldBaseAddress: anInt [
	
	^self GIVElement: 'oldSpaceStart' ofInterpreter: anInt 
]

{ #category : #printing }
SpurExternalImage >> printByteSymbol: aByteSymbolClass [

	| offsetToRead bitsToIgnoreInLastWord |
	"Assume there is a ByteSymbol here"
	bitsToIgnoreInLastWord := aByteSymbolClass objectFormat - (2 * 8).
	offsetToRead := (8 * (aByteSymbolClass slots)) - bitsToIgnoreInLastWord.
	"- 1 because 9 is included"
	^ (aByteSymbolClass address copyFrom: 9  to: 9 + offsetToRead - 1) utf8Decoded
]

{ #category : #stepping }
SpurExternalImage >> step [
		self nextInInterpreter: myGIVNumber
]
