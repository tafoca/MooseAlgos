"
Copyright (c), 2004-2007 Adrian Kuhn. This class is part of Hapax. Hapax is distributed under BSD License, see package comment.
"
Class {
	#name : #MACamelcaseScannerTest,
	#superclass : #TestCase,
	#category : #'Moose-Algos-InformationRetrieval'
}

{ #category : #running }
MACamelcaseScannerTest >> testCompleteSentence [
	
	self
		assert:
			(MACamelcaseScanner scan: 'TheNextBIGThing isKindOf: Hype, VeryBIG BIG')
		equals:
			#('the' 'next' 'BIG' 'thing' 'is' 'kind' 'of' 'hype' 'very' 'BIG' 'BIG') asBag.
]

{ #category : #running }
MACamelcaseScannerTest >> testDanglingLetter [
	
	
		self
	assert: (MACamelcaseScanner scan: 'a')
	equals: #('a') asBag.
	
		self
	assert: (MACamelcaseScanner scan: 'A')
	equals: #('A') asBag.
	
		self
	assert: (MACamelcaseScanner scan: 'fooA')
	equals: #('foo' 'A') asBag
]

{ #category : #running }
MACamelcaseScannerTest >> testEmptyString [
	
	
		self assert: (MACamelcaseScanner scan: '') isEmpty.
	
		self assert: (MACamelcaseScanner scan: '     ') isEmpty
]

{ #category : #running }
MACamelcaseScannerTest >> testNonLetter [
	
	
		self assert: (MACamelcaseScanner scan: '123456') isEmpty.
	
		self
assert: (MACamelcaseScanner scan: 'abc123abc')
	equals: #('abc' 'abc') asBag
]

{ #category : #running }
MACamelcaseScannerTest >> testScanAcronymWords [
	
	
		self
assert: (MACamelcaseScanner scan: 'TheNextBIGThing')
equals: #('the' 'next' 'BIG' 'thing') asBag.
	
		self
assert: (MACamelcaseScanner scan: 'TheNextBIG')
equals: #('the' 'next' 'BIG') asBag.
	
		self
assert: (MACamelcaseScanner scan: 'BIGThing')
	equals: #('BIG' 'thing') asBag.
	
		self
assert: (MACamelcaseScanner scan: 'BIG')
		equals: #('BIG') asBag.
	
		self
assert: (MACamelcaseScanner scan: 'TheNextBIG Thing')
equals: #('the' 'next' 'BIG' 'thing') asBag.
]

{ #category : #running }
MACamelcaseScannerTest >> testScanWords [
	
	
		
		self
assert: (MACamelcaseScanner scan: 'foo')
	equals: #('foo') asBag.
	
		self
assert: (MACamelcaseScanner scan: 'fooBar')
	equals: #('foo' 'bar')asBag.
	
		self
assert: (MACamelcaseScanner scan: 'FooBar')
	equals: #('foo' 'bar') asBag.
	
		self
assert: (MACamelcaseScanner scan: 'FooBar ')
equals: #('foo' 'bar') asBag
]

{ #category : #running }
MACamelcaseScannerTest >> testWhiteSpaces [
	
	
		self
assert: (MACamelcaseScanner scan: 'foo')
	equals: #('foo') asBag.
	
		self
assert: (MACamelcaseScanner scan: 'fooBar')
equals: #('foo' 'bar') asBag.
	
		self
assert: (MACamelcaseScanner scan: 'FooBar')
	equals: #('foo' 'bar') asBag
]

{ #category : #running }
MACamelcaseScannerTest >> testZeroWordAreWhitespace [
	
	
		self
assert: (MACamelcaseScanner scan: 'foo100Bar')
equals: #('foo' 'bar') asBag.
	
		self
assert: (MACamelcaseScanner scan: 'foo10 0Bar')
	equals: #('foo') asBag.
	
		self
assert: (MACamelcaseScanner scan: '0xFFFF foo')
	equals: #('foo') asBag.
	
		self
assert: (MACamelcaseScanner scan: ' 0xFFFF foo')
equals: #('foo') asBag
]