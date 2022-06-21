Class {
	#name : #BaselineOfRustHashMap,
	#superclass : #BaselineOf,
	#category : #BaselineOfRustHashMap
}

{ #category : #baselines }
BaselineOfRustHashMap >> baseline: spec [

	<baseline>
	spec for: #common do: [ spec package: 'RustHashMap' ]
]
