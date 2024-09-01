"
I'm a cell of a Conway's Game of Life.
"
Class {
	#name : 'ConwayCell',
	#superclass : 'CMSpatialEntityCell',
	#classVars : [
		'CurrentId'
	],
	#category : 'Conway-Model',
	#package : 'Conway-Model'
}

{ #category : 'init' }
ConwayCell >> initAllDead [

	self state: #dead
]

{ #category : 'init' }
ConwayCell >> initRandomly [

	self random < 0.5
		ifTrue: [ self state: #dead ]
		ifFalse: [ self state: #alive ]
]

{ #category : 'init' }
ConwayCell >> initTen [

	self random < 0.1
		ifTrue: [ self state: #dead ]
		ifFalse: [ self state: #alive ]
]

{ #category : 'init' }
ConwayCell >> initTenPercentDead [

	self random < 0.1
		ifTrue: [ self state: #dead ]
		ifFalse: [ self state: #alive ]
]

{ #category : 'control' }
ConwayCell >> newState [

	| numberOfAliveNeighbours |
	numberOfAliveNeighbours := self neighbourhood count: [ :arg1 | arg1 state = #alive ].
	
	(self state = #dead and: [ numberOfAliveNeighbours = 3 ])
		ifTrue: [ ^ self bufferState: #alive ].
		
	(self state = #alive and: [ #(2 3) includes: numberOfAliveNeighbours ])
		ifTrue: [ ^ self bufferState: #alive ].
		
	^ self bufferState: #dead
]

{ #category : 'pov' }
ConwayCell >> pov [
	<pov>

	^ self state = #alive
		ifTrue: [ Color white ]
		ifFalse: [ Color black ]
]
