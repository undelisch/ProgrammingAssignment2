## application of lexical scoping in returning the inverse of a 2x2 matrix

## create a list of functions so they may later be applied to a matrix

makeCacheMatrix <- function(x = matrix()) {
      
      # NULL the content of "inv"
      inv <- NULL
      
      # assign to x the value fed to "set()" & NULL the content of "inv"
      set <- function(y) {
            x <<- y
            inv <<- NULL
      }
      
      # read the value of x into a function called "get()"
      get <- function() x
      
      # define a function that assigns to "inv" the value of "solved"
      setinv <- function(solved) inv <<- solved
      
      # read the value of "inv" into a function called "getinv()"
      getinv <- function() inv
      list(set = set, get = get,
           setinv = setinv,
           getinv = getinv)
}

## call cache and solve

cacheSolve <- function(x, ...) {
      
      # read the value of "inv"
      inv <- x$getinv()
      
      # check whether inverse "inv" already exists (i.e. is not NULL)
      if(!is.null(inv)) {
            message(".:. getting cached data .:.")
            return(inv)
      }
      
      # otherwise move on and store tha value of the original matrix in "data"
      data <- x$get()
      
      # calculate the inverse of "data" 
      inv <- solve(data, ...)
      
      # call the caching function to assign the result to "inv" & return it
      x$setinv(inv)
      inv
}

## How to use this function? Just try this & you'll see:

## to test this function you may for example use the invertible
## matrix a = matrix(c(1,1,-1,1),ncol=2, byrow = TRUE) - note that
## more than a lot of matrices aren't even invertible... 

# a <- matrix(c(1,1,-1,1),ncol=2, byrow = TRUE)

## the inverse of a is: 
# a_inv <- matrix(0.5*c(1,-1,1,1),ncol=2, byrow = TRUE)

# b <- makeCacheMatrix(a)
# cacheSolve(b) == a_inv

## check output:
## .:. getting cached data .:.
## [,1] [,2]
## [1,] TRUE TRUE
## [2,] TRUE TRUE

## check some more matrices if you like <3