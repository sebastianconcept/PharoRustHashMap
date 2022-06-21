Class {
	#name : #RustHashMap,
	#superclass : #Object,
	#category : #'RustHashMap-Core'
}

{ #category : #accessing }
RustHashMap class >> concat: string with: anotherString [

	^ self ffiCall:
		  #( char * concat #( char * string , char * anotherString ) )
]

{ #category : #accessing }
RustHashMap class >> dummyGet: key [

	^ self ffiCall: #( char * dummyGet #( char * key ) )
]

{ #category : #accessing }
RustHashMap class >> echo: key [

	^ self ffiCall: #( char * echo #( char * key ) )
]

{ #category : #accessing }
RustHashMap class >> ffiLibrary [

	^ RustHashMapLibrary
]

{ #category : #accessing }
RustHashMap class >> freeOwnedCStr: aValueHolder [

	^ self ffiCall: #( void freeOwnedCStr #( char * aValueHolder ) )
]

{ #category : #accessing }
RustHashMap class >> get: key [

	^ self ffiCall: #( char * get #( char * key ) )
]

{ #category : #accessing }
RustHashMap class >> getCstr [

	^ self ffiCall: #( char * getCstr #(  ) )
]

{ #category : #accessing }
RustHashMap class >> getHelloFromRust [

	^ self ffiCall: #( char * get_hello #(  ) )
]

{ #category : #accessing }
RustHashMap class >> getOwnedCStr [

	^ self ffiCall: #( char * getOwnedCStr #(  ) )
]

{ #category : #accessing }
RustHashMap class >> includes: key [

	^ self ffiCall: #( bool includes #( char * key ) )
]

{ #category : #accessing }
RustHashMap class >> remove: key [

	^ self ffiCall: #( void remove #( char * key ) )
]

{ #category : #accessing }
RustHashMap class >> reset [

	^ self ffiCall: #( void reset #(  ) )
]

{ #category : #accessing }
RustHashMap class >> set: key with: value [

	^ self ffiCall: #( void set #( char * key , char * value ) )
]

{ #category : #accessing }
RustHashMap class >> setCstr: key value: value [

	^ self ffiCall: #( void setCstr #( char * key , char * value ) )
]

{ #category : #accessing }
RustHashMap class >> size [

	^ self ffiCall: #( int size #(  ) )
]
