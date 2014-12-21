## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) 
{

    s <- NULL                                   # Initialise the cached value.
    
    set <- function(y)                          # Storring the value.
    {
            x <<- y                             # Store the original matrix's value.
            s <<- NULL                          # Initial the cached value when it is first time executing this function.
    }
    
    get <- function() x                         # Getting the matrix's value.
    setsolve <- function(solve) s <<- solve     # Storing the value in the cache storage.
    getsolve <- function() s                    # Getting the cached value.
    
    # A list containing a function to the following:  
    # set the value of the matrix.
    # get the value of the matrix.
    # set the value of the solution.
    # get the value of the solution.
    list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)

}


## Write a short comment describing this function


cacheSolve <- function(x, ...) 
{
    ## Return a matrix that is the inverse of 'x'
    
    s <- x$getsolve()                               # Getting the solution value.

    if(!is.null(s))                                 # Check the solution value is cached before.
    {
        # message("getting cached data")
        return(s)                                   # Return the cached solution value.
    }

    # Following codes is for first time calling the cacheSolve function on the new object of the type "list" of makeCacheMatrix function.
    data <- x$get()                                 # Getting the matrix's value.
    s <- solve(data, ...)                           # Calling "solve" function to find the inverse matrix. 
    x$setsolve(s)                                   # Storing the solution value in cache storage .
    s                                               # Return the solution value.
}


