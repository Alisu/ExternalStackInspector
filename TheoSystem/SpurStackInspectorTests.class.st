"
We look only at the 1st frame after starting the image.
We assume everything from here:
-that the sender/receiver/etc ... are in certain places
-that the loadInitialContext loads always the same
-that the method executed is the launchSnapshopt:andQuit:
"
Class {
	#name : #SpurStackInspectorTests,
	#superclass : #SpurSecondInterpreterMethodInspectorTests,
	#instVars : [
		'stackInspector'
	],
	#category : #TheoSystem
}

{ #category : #running }
SpurStackInspectorTests >> setUp [
	
	super setUp.
	stackInspector := image getFrame.
	stackInspector init.
]

{ #category : #tests }
SpurStackInspectorTests >> testLinkedContextIsAContext [

	self assert: stackInspector linkedContext basicClass asSpurClass className equals: 'Context'
]

{ #category : #tests }
SpurStackInspectorTests >> testMethodIsInitialContextMethod [

	"look at class comments"
	self assert: stackInspector method selector equals: #launchSnapshot:AndQuit:
]

{ #category : #tests }
SpurStackInspectorTests >> testReceiverIsInitialContextReceiver [

	"look at class comments"
	self assert: stackInspector receiver asSpurClass className equals: 'SessionManager'
]

{ #category : #tests }
SpurStackInspectorTests >> testSenderIsAContext [

	"look at class comments"
	self assert: stackInspector sender basicClass asSpurClass className equals: 'Context'
]
