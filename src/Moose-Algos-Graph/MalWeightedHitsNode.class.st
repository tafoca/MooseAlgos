Class {
	#name : #MalWeightedHitsNode,
	#superclass : #MalHitsNode,
	#traits : 'MalTEdgeNode',
	#classTraits : 'MalTEdgeNode classTrait',
	#instVars : [
		'nextEdges',
		'previousEdges'
	],
	#category : #'Moose-Algos-Graph'
}

{ #category : #initialization }
MalWeightedHitsNode >> initialize [

	previousEdges := OrderedCollection new.
	nextEdges := OrderedCollection new.
]

{ #category : #printing }
MalWeightedHitsNode >> label [

	^ 'WH '
]

{ #category : #accessing }
MalWeightedHitsNode >> nextEdges [

	^ nextEdges
]

{ #category : #accessing }
MalWeightedHitsNode >> previousEdges [

	^ previousEdges
]