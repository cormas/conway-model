"
I'm a cell of a Conway's Game of Life.
"
Class {
	#name : #ConwayCell,
	#superclass : #CMSpatialEntityCell,
	#classVars : [
		'CurrentId'
	],
	#category : #'Conway-Model'
}

{ #category : #'pov symbols' }
ConwayCell class >> SpatialEntityPOV_alive [

	<pov: #alive>
	^ Array with: 0.0 with: 0.670004 with: 0.0
]

{ #category : #'pov symbols' }
ConwayCell class >> SpatialEntityPOV_dead [

	<pov: #dead>
	^ Array with: 0.0 with: 0.0 with: 0.0
]

{ #category : #'pov symbols' }
ConwayCell class >> SpatialEntityPOV_dead_red [

	<pov: #dead_red>
	^ Array with: 0.5 with: 0.0 with: 0.1
]

{ #category : #'default value' }
ConwayCell class >> state_default [

	^ nil
]

{ #category : #init }
ConwayCell >> initAllDead [

	self state: #dead
]

{ #category : #init }
ConwayCell >> initRandomly [

	Cormas random < 0.5
		ifTrue: [ self state: #dead ]
		ifFalse: [ self state: #alive ]
]

{ #category : #init }
ConwayCell >> initTen [

	Cormas random < 0.1
		ifTrue: [ self state: #dead ]
		ifFalse: [ self state: #alive ]
]

{ #category : #init }
ConwayCell >> initTenPercentDead [

	Cormas random < 0.1
		ifTrue: [ self state: #dead ]
		ifFalse: [ self state: #alive ]
]

{ #category : #probes }
ConwayCell >> isAlive [

	self state = #alive ifTrue: [ ^ 1 ].
	^ 0
]

{ #category : #control }
ConwayCell >> newState [

	| tmp1 |
	tmp1 := self neighbourhood count: [ :arg1 | arg1 state = #alive ].
	self state = #dead & (tmp1 = 3) ifTrue: [ ^ self bufferState: #alive ].
	(self state = #alive and: [ tmp1 = 2 or: [ tmp1 = 3 ] ]) ifTrue: [ 
		^ self bufferState: #alive ].
	^ self bufferState: #dead
]

{ #category : #pov }
ConwayCell >> pdv [

	^ state
]

{ #category : #pov }
ConwayCell >> pov [

	^ self state
]

{ #category : #pov }
ConwayCell >> pov_red [

	self state = #dead ifTrue: [ ^ #dead_red ].
	^ self state
]
