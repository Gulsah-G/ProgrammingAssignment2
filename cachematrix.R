
#Programming Assignment 2: Lexical Scoping.

## In this assignment, two functions are created to cache the inverse of 
## a matrix. The first function helps to create a matrix in the form of a list 
## and the second function uses the first function to cache the inverse of
## a matrix when it is created in this form. Therefore, when an inverse of 
## a matrix is already calculated, it will return the cached data instead of
## calculating the inverse again.


## First, makeCacheMatrix function creates a matrix which is in fact a list 
## containing a function to:
## 1. sets the matrix
## 2. gets the matrix
## 3. sets the inverse of the matrix
## 4. gets the inverse of the matrix.

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) inv <<- inverse
        getinverse <- function() inv
        list(set = set, get = get, 
             setinverse = setinverse, 
             getinverse = getinverse)
}


## Then, this following function calculates the inverse of the matrix which is 
## created by the previous function so that it first checks to see if the inverse
## has already been calculated. If so, it recalls the cached data and skips 
## the computation. Otherwise, it calculates the inverse of the function and 
## sets it in the cache.

cacheSolve <- function(x, ...) {
        inv <- x$getinverse()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data)
        x$setinverse(inv)
        inv
}


## Example:
m <- matrix(c(1, 2, 3, 1), nrow = 2, ncol = 2)
M <- makeCacheMatrix(m)
M$get() ##Shows the matrix.
cacheSolve(M) ## Calculates for the first time and sets it in the cache.
cacheSolve(M) ## Retrieves from the cache in the second run.

