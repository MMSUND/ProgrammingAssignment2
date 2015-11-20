## ABOUT FUNCTION
## This specific function will calculate the inverse of a matrix, While computation will take long time to calculate the inverse
## matrix repeatedly . As the matrix value is not changing in this function,hence we preferred to cache the inverse matrix 
##and use it when required again rather computing it again . 

## In this function we have used <<- operator which is used to assign the matrix value to an object into a object 
## that is different from current environment.Below code will create a matrix "MakeCacheMatrix" to SET the value of the matrix
## , SET inverse of the martix and GET the inverse too.

makeCacheMatrix <- function(x = numeric()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}


## This function computes inverse of the special "matrix" retuned by 
## makecacheMatrix above.If the inverse has already been calculated 
## (and the matrix is already created the it will return to NULL by skipping the computation otherwise)
## it will inverse the Matrix and stores the value in the cache via the Setsolve function.

cacheSolve <- function(x, ...) 
{
        ## Rget inverse of a matrix
        m <- x$getsolve()
        # Returns the inverse if the inverse is already calculated
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        #computes inverses of a matrix if it is a new matrix
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
}


y
T <- makeCacheMatrix(y)
cacheSolve(T)
