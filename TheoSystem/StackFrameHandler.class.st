Class {
	#name : #StackFrameHandler,
	#superclass : #SpurObject,
	#instVars : [
		'method',
		'flags',
		'linkedContext',
		'pc',
		'receiver',
		'sender'
	],
	#category : #TheoSystem
}

{ #category : #accessing }
StackFrameHandler >> flags [
	^ self pointerAt: 2
]

{ #category : #initialization }
StackFrameHandler >> init [
	method := self method.
	"flags := self flags."
	linkedContext := self linkedContext.
	"pc := self pc."
	receiver := self receiver.
	sender := self sender.
]

{ #category : #accessing }
StackFrameHandler >> linkedContext [

	^self pointerAt: 3
]

{ #category : #accessing }
StackFrameHandler >> method [
	
	| methodOffset |
	methodOffset := ExternalAddress fromAddress: self address asInteger - (8 * 1).
	^ SpurMethod on: (methodOffset pointerAt: 1) image: image
]

{ #category : #accessing }
StackFrameHandler >> pc [
]

{ #category : #accessing }
StackFrameHandler >> pointerAt: index [
	
	| offset |
	offset := ExternalAddress fromAddress: self address asInteger - (8 * index).
	^ SpurObject on: (offset pointerAt: 1) image: self image.
]

{ #category : #accessing }
StackFrameHandler >> printFrameUpTo: anInt [
	
	1 to: anInt do: [ :num | (self pointerAt: num) vmPrintOop  ]
]

{ #category : #accessing }
StackFrameHandler >> receiver [
	^self pointerAt: 4
]

{ #category : #accessing }
StackFrameHandler >> sender [
"I am not sure this the sender but this is a context here"
	| methodOffset |
	methodOffset := ExternalAddress fromAddress: self address asInteger + (8 * 1).
	^ SpurObject on: (methodOffset pointerAt: 1) image: self image.
]
