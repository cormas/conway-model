Class {
	#name : #ConwayCellTest,
	#superclass : #TestCase,
	#category : #'Conway-Model-Tests'
}

{ #category : #tests }
ConwayCellTest >> testEntityName [

	self assert: ConwayCell entityName equals: 'Cell'
]
