# Binarian Problem

## Problem Definition

A non-empty zero-indexed array A consisting of N non-negative integers is given. Its binarian is defined as;  

* binarian(A) = pow2(A[0]) + pow2(A[1]) + ... + pow2(A[N-1]) + pow2(A[N])

For example, the binarian of array A such that;  

* A[0] = 1  
* A[1] = 5
* A[2] = 4  

equals 50;

* binarian(A) = pow2(A[0]) + pow2(A[1]) + pow2(A[2]) = 2 + 32 + 16 = 50

that, given an array A consisting of N non-negative integers, returns the length of the shortest array that has the same binarian as array A.

For example, given array A such that:

* A[0] = 1
* A[1] = 0
* A[2] = 2
* A[3] = 0
* A[4] = 0
* A[5] = 2

the function should return 3 becuase;

* the binarian of A is 13.
* array B such that B[0]=3, B[1]=2, B[2]=0 also has a binarian of 13.
* there is no shorter array with a binarian of 13.

Complexity constraints;

* expected worst-case time complexity is O(NlogN).
* expected worst-case space complexity is O(N).


## How it works

This problem is almost simialar as Pibonacci number problem, using chache storage and recursively runnable method.  


## Behind Stroy

This problem was the on-line coding test question that needed to be solved during 60 min.  
