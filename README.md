### Assignment: Caching the Inverse of a Matrix

This assignment is a pair of functions that
cache the inverse of a matrix.

I wrote the following functions:

1.  `makeCacheMatrix`: This function creates a special "matrix" object
    that can cache its inverse.
2.  `cacheSolve`: This function computes the inverse of the special
    "matrix" returned by `makeCacheMatrix` above. If the inverse has
    already been calculated (and the matrix has not changed), then
    `cacheSolve` should retrieve the inverse from the cache.

To test the work of a function you can use the following R code, 
which creates the test matrix and then applies the functions to them:

'
	x <- c(1,2,3,4,5,6,0,0,1)
	x <- as.matrix(x)
	dim(x) <- c(3,3)
'

then we have to make a special matrix with cache functions:

'
	y <- makeCacheMatrix(x)
'

now we can test the effect of cache on using the function "cacheSolve"
'
	cacheSolve(y)
'

When we run this function for the second time, the inverse matrix will not
be calculated, while it will be restored from cache. 
Screenshot of the process is in the attached file. 