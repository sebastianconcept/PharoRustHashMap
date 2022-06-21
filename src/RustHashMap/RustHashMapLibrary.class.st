Class {
	#name : #RustHashMapLibrary,
	#superclass : #FFILibrary,
	#category : #'RustHashMap-Core'
}

{ #category : #'accessing - platform' }
RustHashMapLibrary >> macModuleName [
	^ 'librusthashmap.dylib'
]
