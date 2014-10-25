## The functions bellow can be used to store a matrix and its inverse. 



## This function creates a special "matrix" object that can store a matrix and its inverse.

makeCacheMatrix <- function(x = matrix()) {
    ## The function creates a list with 4 functions that can me used like "methods" of the object:
    
        i <- NULL
        
        setMatrix <- function(y) {
            x <<- y
            i <<- NULL
        }
        
        getMatrix <- function() x
        getInverseMatrix <- function() i
        setInverseMatrix <- function(solve) i <<- solve
    
        list(setMatrix = setMatrix, 
             getMatrix = getMatrix,
             getInverseMatrix = getInverseMatrix,
             setInverseMatrix = setInverseMatrix)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getInverseMatrix()
        if(!is.null(i)) {
            message("getting cached matrix")
            return(i)
        }
        i <- solve(x$getMatrix(), ...)
        x$setInverseMatrix(i)
        i
}
