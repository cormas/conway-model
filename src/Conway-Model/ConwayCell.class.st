"
I'm a cell of a Conway's Game of Life.
"
Class {
	#name : 'ConwayCell',
	#superclass : 'CMCell',
	#traits : 'TCMCellularAutomaton',
	#classTraits : 'TCMCellularAutomaton classTrait',
	#category : 'Conway-Model',
	#package : 'Conway-Model'
}

{ #category : 'as yet unclassified' }
ConwayCell >> beAlive [
	<action>
	self state: #alive
]

{ #category : 'as yet unclassified' }
ConwayCell >> beDead [
	<action>
	self state: #dead
]

{ #category : 'init' }
ConwayCell >> initRandomly [

	self random < 0.5
		ifTrue: [ self beDead ]
		ifFalse: [ self beAlive ]
]

{ #category : 'control' }
ConwayCell >> newState [

	| numberOfAliveNeighbours |
	numberOfAliveNeighbours := self neighbourhood count: [ :each | each state = #alive ].
	
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
		ifTrue: [ CMPointOfView color: Color white ]
		ifFalse: [ CMPointOfView color: Color black ]
]
