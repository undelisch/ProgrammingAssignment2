# How to use chachematrix.R 

*Part of the Coursera "Data Science" track. Programming Assignment 2.*

The exercise was to practise the application of lexical scoping in returning the inverse of a 2x2 matrix. The sourcefile contains two functions, `makeCacheMatrix()` and `cacheSolve`. Call the functions in the right order to calculate and cache the inverse of a given matrix. 

The matrix I want to invert is called `a` in this example.

## What do the functions do?

The first function produces a list of functions to be used on a matrix argument `x` and make assignments. 

```
makeCacheMatrix <- function(x = matrix()) {
      inv <- NULL
      set <- function(y) {
            x <<- y
            inv <<- NULL
      }
      get <- function() x
      
      setinv <- function(solved) inv <<- solved
      getinv <- function() inv
      
      list(set = set, get = get,
           setinv = setinv,
           getinv = getinv)
}
```

The second function calles that list and checks if there is already an inverse. If not, it uses the `solve` function to calculate one, stores it with `setinv()` and returns its content. 

```
cacheSolve <- function(x, ...) {
      
      inv <- x$getinv()
      if(!is.null(inv)) {
            message(".:. getting cached data .:.")
            return(inv)
      }
      
      data <- x$get()
      inv <- solve(data, ...)
      x$setinv(inv)
      inv
}
```

## Testing the functions

Just try this & you'll see: To test the source you may for example use the invertible matrix 

`a <- matrix(c(1,1,-1,1),ncol=2, byrow = TRUE)`

Note that more than a lot of matrices aren't even invertible... 

The inverse of `a` is: 

`a_inv <- matrix(0.5*c(1,-1,1,1),ncol=2, byrow = TRUE)`

Now use the caching functions: 

`b <- makeCacheMatrix(a)`
`cacheSolve(b) == a_inv`

Check the output:
```
> .:. getting cached data .:.
> [,1] [,2]
> [1,] TRUE TRUE
> [2,] TRUE TRUE
```
## Check some more matrices if you like &#10084;

Here are some examples: 

```
m1 <- matrix(c(1,0,0,1),nrow = 2, byrow = T) 
m2 <- matrix(c(1,2,2,-0.5),nrow = 2, byrow = T)
m3 <- matrix(c(1,-1,1,0),nrow = 2, byrow = T)
```
