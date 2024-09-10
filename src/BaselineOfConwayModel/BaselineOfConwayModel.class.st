Class {
	#name : 'BaselineOfConwayModel',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfConwayModel',
	#package : 'BaselineOfConwayModel'
}

{ #category : 'baselines' }
BaselineOfConwayModel >> baseline: spec [

	<baseline>
	spec for: #common do: [

		"Packages"
		spec
			package: 'Conway-Model';
			package: 'Conway-Model-Tests' with: [ spec requires: #( 'Conway-Model' ) ] ]
]
