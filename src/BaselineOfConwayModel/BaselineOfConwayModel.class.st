Class {
	#name : #BaselineOfConwayModel,
	#superclass : #BaselineOf,
	#category : #BaselineOfConwayModel
}

{ #category : #baselines }
BaselineOfConwayModel >> baseline: spec [

	<baseline>
	spec for: #common do: [
		"Dependencies"
		self loadCormas: spec.

		"Packages"
		spec
			package: 'Conway-Model' with: [ spec requires: #(Cormas) ];
			package: 'Conway-Model-Tests' with: [ spec requires: #( 'Conway-Model' ) ] ]
]

{ #category : #dependencies }
BaselineOfConwayModel >> loadCormas: spec [

	spec
		baseline: 'Cormas'
		with: [ spec loads: #(Core); repository: 'github://cormas/cormas' ]
]
