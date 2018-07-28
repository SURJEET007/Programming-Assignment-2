
R version 3.5.0 (2018-04-23) -- "Joy in Playing"
Copyright (C) 2018 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> ## Caching the Inverse of a Matrix:
> ## Matrix inversion is usually a costly computation and there may be some 
> ## benefit to caching the inverse of a matrix rather than compute it repeatedly.
> ## Below are a pair of functions that are used to create a special object that 
> ## stores a matrix and caches its inverse.
> 
> ## This function creates a special "matrix" object that can cache its inverse.
> 
> makeCacheMatrix <- function(x = matrix()) {
+         inv <- NULL
+         set <- function(y) {
+                 x <<- y
+                 inv <<- NULL
+         }
+         get <- function() x
+         setInverse <- function(inverse) inv <<- inverse
+         getInverse <- function() inv
+         list(set = set,
+              get = get,
+              setInverse = setInverse,
+              getInverse = getInverse)
+ }
> 
> 
> ## This function computes the inverse of the special "matrix" created by 
> ## makeCacheMatrix above. If the inverse has already been calculated (and the 
> ## matrix has not changed), then it should retrieve the inverse from the cache.
> 
> cacheSolve <- function(x, ...) {
+         ## Return a matrix that is the inverse of 'x'
+         inv <- x$getInverse()
+         if (!is.null(inv)) {
+                 message("getting cached data")
+                 return(inv)
+         }
+         mat <- x$get()
+         inv <- solve(mat, ...)
+         x$setInverse(inv)
+         inv
+ }
