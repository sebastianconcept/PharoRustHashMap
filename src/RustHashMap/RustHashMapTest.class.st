Class {
	#name : #RustHashMapTest,
	#superclass : #TestCase,
	#category : #'RustHashMap-Tests'
}

{ #category : #tests }
RustHashMapTest >> dummyValue [

	^ '{"ProtocolType":2,"RequestType":"Create Session Request"}'
]

{ #category : #tests }
RustHashMapTest >> setUp [

	RustHashMap reset
]

{ #category : #tests }
RustHashMapTest >> tearDown [

	RustHashMap reset
]

{ #category : #tests }
RustHashMapTest >> testIncludes [

	| key object |
	self assert: RustHashMap size equals: 0.
	1 to: 10 do: [ :i | 
		key := UUID new asString36.
		object := key -> (self dummyValue , i asString).
		RustHashMap set: object key with: object value.
		self assert: (RustHashMap includes: key) ].
	self assert: RustHashMap size equals: 10
]

{ #category : #tests }
RustHashMapTest >> testManyOfSetGet [

	| key object |
	self assert: RustHashMap size equals: 0.
	1 to: 1000 do: [ :i | 
		key := UUID new asString36.
		object := key -> (self dummyValue , i asString).
		RustHashMap set: object key with: object value.
		self
			assert: (RustHashMap get: key)
			equals: self dummyValue , i asString ].
	self assert: RustHashMap size equals: 1000
]

{ #category : #tests }
RustHashMapTest >> testRemove [

	| keys object firstKey lastKey|
	self assert: RustHashMap size equals: 0.
	keys := OrderedCollection new.
	1 to: 10 do: [ :i | 
		keys add: UUID new asString36.
		object := keys last -> (self dummyValue , i asString).
		RustHashMap set: object key with: object value.
		self
			assert: (RustHashMap get: keys last)
			equals: self dummyValue , i asString ].
	firstKey := keys first.
	lastKey := keys last.
	RustHashMap remove: firstKey.
	RustHashMap remove: lastKey.
	self assert: RustHashMap size equals: 8.
	self deny: (RustHashMap includes: firstKey).
	self deny: (RustHashMap includes: lastKey).
	self assert: (RustHashMap includes: keys allButFirst allButLast anyOne).
	
]

{ #category : #tests }
RustHashMapTest >> testReset [

	| key object |
	key := UUID new asString36.
	object := key -> self dummyValue.
	self assert: RustHashMap size equals: 0.
	RustHashMap set: object key with: object value.
	self assert: RustHashMap size equals: 1.
	self assert: (RustHashMap get: key) equals: self dummyValue.
	RustHashMap reset.
	self assert: RustHashMap size equals: 0.
	self assert: (RustHashMap get: key) equals: nil
]

{ #category : #tests }
RustHashMapTest >> testSetGet [

	| key object |
	key := UUID new asString36.
	object := key -> self dummyValue.
	self assert: RustHashMap size equals: 0.
	RustHashMap set: object key with: object value.
	self assert: RustHashMap size equals: 1.
	self assert: (RustHashMap get: key) equals: self dummyValue.
]

{ #category : #tests }
RustHashMapTest >> testSize [

	| key object |
	self assert: RustHashMap size equals: 0.
	1 to: 17 do: [ :i | 
		key := UUID new asString36.
		object := key -> (self dummyValue , i asString).
		RustHashMap set: object key with: object value.
		self
			assert: (RustHashMap get: key)
			equals: self dummyValue , i asString ].
	self assert: RustHashMap size equals: 17.
	1 to: 3 do: [ :i | 
		key := UUID new asString36.
		object := key -> (self dummyValue , i asString).
		RustHashMap set: object key with: object value.
		self
			assert: (RustHashMap get: key)
			equals: self dummyValue , i asString ].
	self assert: RustHashMap size equals: 20.	
	


]
