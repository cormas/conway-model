Class {
	#name : #ConwayModelTest,
	#superclass : #TestCase,
	#instVars : [
		'pWindow'
	],
	#category : #'Conway-Model-Tests'
}

{ #category : #tests }
ConwayModelTest >> testACellInConwayModelIsAtDistanceOneToAnotherCell [

	| randomEntity m |
	m := ConwayModel newWithActiveInit: #initSmallGrid.
	m initSimulation.
	randomEntity := (m allTheEntities: ConwayCell) atRandom.
	self
		assert: (randomEntity shortestDistanceToCellsVerifying: [ :arg1 | 
				 arg1 state = #dead | (arg1 state = #alive) ])
		equals: 1
]

{ #category : #tests }
ConwayModelTest >> testAfterInitializationAConwayModelHas10000Cells [

	| tmp1 tmp2 |
	tmp2 := ConwayModel.
	tmp2 initialize.
	tmp1 := tmp2 new.
	tmp1 initSimulation.
	self assert: (tmp1 allTheEntities: ConwayCell) size equals: 10000
]

{ #category : #tests }
ConwayModelTest >> testAfterInitializationAConwayModelHas10000Entities [

	| model modelClass |
	modelClass := ConwayModel.
	modelClass initialize.
	model := modelClass new.
	model initSimulation.
	self assert: model allTheEntities size equals: 10000
]

{ #category : #tests }
ConwayModelTest >> testConwayModelHasNoSocialEntityClass [

	self assert: ConwayModel socialClasses isEmpty
]

{ #category : #tests }
ConwayModelTest >> testConwayModelHasOnlyOneSpatialEntityClass [

	self assert: ConwayModel spatialClasses size equals: 1
]

{ #category : #tests }
ConwayModelTest >> testThereIsOneEntityClassInConwayModel [

	self assert: ConwayModel allEntityClasses size equals: 1
]

{ #category : #tests }
ConwayModelTest >> testThereIsTwoClassesInConwayPackage [

	self assert: ConwayModel allClassesInPackage size equals: 2
]

{ #category : #tests }
ConwayModelTest >> testWhenThereIsNoNearestCell [

	| m randomEntity |
	m := (ConwayModel newWithActiveInit: #initSmallGrid).
	m initSimulation.
	randomEntity := (m allTheEntities: ConwayCell) atRandom.
	self should: [ randomEntity shortestDistanceToCellsVerifying: [ :arg1 | arg1 state = #zork ] ] raise: Error
]
