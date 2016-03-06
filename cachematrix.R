## The first function creates a vector of functions needed to solve
## the inverse matrix and cache it.
## makeCacheMatrix is containing a list of functions, to:
##     1. Set matrix
##     2. Get matrix
##     3. Set the inverse matrix values
##     4. Get the inverse matrix values

makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y) {
      	x <<- y
		m <<- NULL
	}
	get <- function() x	#this function returns the stored 'x' matrix to outer environment
	setInverse <- function(inverseMatrix) m <<- inverseMatrix	#this function stores in cache values of inverse matrix, provided by the outer environment
	getInverse <- function() m	#this function calls the cached values of inverse matrix and returns it in outer enveironment
	list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)	#returns all previous functions for use in outer environment
}


## The second function calculates the inverse of matrix. If inverse matrix had already been calculated,
## and source matrix had not been changed, the function returns the cached value. Otherwise, it calculates 
## inverse matrix and stores it in the cache

cacheSolve <- function(x, ...) {
	## Return a matrix that is the inverse of 'x'
	m <- x$getInverse()	#this functions tries to get cached inverse matrix, instead of calculating it again
	if(!is.null(m)) {		#we check if there is a data in cache
			message("getting cached data")
			return(m)	#if matrix was being cached, function returns cached values
	}
	data <- x$get()		#this function gets the original values of matrix 'x', stored inside the function-matrix 'x'
	m <- solve(data, ...)	#this function calculates the inverse matrix from the original 'x' matrix values
	x$setInverse(m)		#this function stores the values of inverse matrix for further use
	m				#returns inverse matrix to home environment
}
