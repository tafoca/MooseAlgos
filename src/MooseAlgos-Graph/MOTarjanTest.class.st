Class {
	#name : #MOTarjanTest,
	#superclass : #TestCase,
	#instVars : [
		'tarjan'
	],
	#category : #'MooseAlgos-Graph-Tests'
}

{ #category : #history }
MOTarjanTest class >> lastStoredRun [
	^ ((Dictionary new) add: (#passed->((Set new) add: #testNoCycle; add: #testComplexCycle; add: #testCycle; add: #testNestedCycle; yourself)); add: (#timeStamp->'6 July 2009 5:40:15 pm' asTimeStamp); add: (#failures->((Set new))); add: (#errors->((Set new))); yourself)
]

{ #category : #tests }
MOTarjanTest >> setUp [

	tarjan := MOTarjan new.

]

{ #category : #tests }
MOTarjanTest >> testComplexCycle [
	| a b c cycleNodesOfC d f e g h |

	MOGraphFixture complexCycleGraph: tarjan.
	tarjan run.
	a := tarjan findNode: $a.
	b := tarjan findNode: $b.
	c := tarjan findNode: $c.
	d := tarjan findNode: $d.
	e := tarjan findNode: $e.
	f := tarjan findNode: $f.
	g := tarjan findNode: $g.
	h := tarjan findNode: $h.
	cycleNodesOfC := Set 
		with: d
		with: f.
	self deny: a isInCycle.
	self deny: b isInCycle.
	self assert: c isInCycle.
	self assert: d isInCycle.
	self assert: f isInCycle.
	self deny: e isInCycle.
	self assert: g isInCycle.
	self assert: h isInCycle.
	self assert: (c cycleNodes includesAllOf: cycleNodesOfC).
	self assert: (cycleNodesOfC includesAllOf: c cycleNodes).
	self assert: (g cycleNodes hasEqualElements: (Array with: h)).
	self assert: (h cycleNodes hasEqualElements: (Array with: g))
]

{ #category : #tests }
MOTarjanTest >> testCycle [
	| a b c cycleNodesOfA |
	MOGraphFixture cycleGraph: tarjan.
	tarjan run.
	a := tarjan findNode: $a.
	b := tarjan findNode: $b.
	c := tarjan findNode: $c.
	cycleNodesOfA := Set 
		with: b
		with: c.
	self assert: a isInCycle.
	self assert: b isInCycle.
	self assert: c isInCycle.
	self deny: (tarjan findNode: $d) isInCycle.
	self assert: (a cycleNodes includesAllOf: cycleNodesOfA).
	self assert: (cycleNodesOfA includesAllOf: a cycleNodes)
]

{ #category : #tests }
MOTarjanTest >> testNestedCycle [
	| a b c cycleNodesOfC d f e g h cycleNodesOfI i |
	MOGraphFixture nestedCycleGraph: tarjan.
	tarjan run.
	a := tarjan findNode: $a.
	b := tarjan findNode: $b.
	c := tarjan findNode: $c.
	d := tarjan findNode: $d.
	e := tarjan findNode: $e.
	f := tarjan findNode: $f.
	g := tarjan findNode: $g.
	h := tarjan findNode: $h.
	i := tarjan findNode: $i.
	cycleNodesOfC := Set 
		with: a
		with: b
		with: d
		with: e.
	cycleNodesOfI := Set 
		with: f
		with: g
		with: h.
	tarjan nodes do: [ :n | self assert: n isInCycle ].
	self assert: (c cycleNodes includesAllOf: cycleNodesOfC).
	self assert: (cycleNodesOfC includesAllOf: c cycleNodes).
	self assert: (i cycleNodes includesAllOf: cycleNodesOfI).
	self assert: (cycleNodesOfI includesAllOf: i cycleNodes)
]

{ #category : #tests }
MOTarjanTest >> testNoCycle [

	MOGraphFixture simpleGraph: tarjan.
	tarjan run.
	tarjan nodes do: [ :n | self deny: n isInCycle ]
]