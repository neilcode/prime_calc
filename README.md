# prime_calc
An app that prints a multiplication table of the first 10 prime numbers to STDOUT

**Note:** A simple solution that does not contain multiple Primality tests, benchmark mode, etc. exists on a separate branch called `simple`. Execute it the same way, by running `app/run.rb` from console.

### Summary
In designing this program, I was asked to consider the following: 
* Complexity: How fast does your code run? Does it scale?
* What if we want N primes?
* Write tests. Try to demonstrate TDD/BDD.
---

### Dependencies
* rspec

### How To Run
* Clone the repo to your local machine. 
* execute `./app/run.rb` from the console to observe the normal output of the program
  * Optionally, here are a few command line options you can use:
  * `-range:N` or `-range:N-M` will generate primes up to the Nth prime or display only the Nth to Mth primes.
  * `-benchmark` runs a benchmark of the 3 different tests for primality included in the app. The benchmark demonstrates the speed of each algorithm in milliseconds when run against odd numbers from 3 to 10000.
  * `-bf` generates primes with a brute force recursive algorithm to test primality.
  * `-k`  generates primes with the `6k +- 1` aka SixK algorithm to test primality.
  * `-f`  generates primes with Fermat's Little Theorem, a probabilistic primality test.

---

### Findings
My first thought in solving this challenge was to use the [Sieve of Eratosthenes](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes). However, I soon realized that the Sieve is useful when you want to find all primes in a given set of numbers. Since we might want to endlessly generate primes until the Nth prime, the Sieve is not ideal. Next, I went for a simple brute force approach with trial division:

Given an odd integer `p`, recursively check if `p` is divisible by any integer from `p/2` down to `2`. If a divisor is found, `p` is not prime. Move to the next odd integer, stopping when the desired number of primes have been found. 
*Unfortunately, this approach has some significant downsides.* For starters, it's not particularly fast, with speed approaching O(N^2). Secondly, it can't check very large primes without running out of stack space.

Once I had a brute force approach working, I set out to research other ways to test primality. I came across a simple [formula](https://primes.utm.edu/notes/faq/six.html) for testing primality. This formula, also known as the "6k plus/minus 1" is fast and it works for all prime numbers from 5 to at least 100,000 or so. I also came across another interesting formula, [Fermat's Little Theorem](https://en.wikipedia.org/wiki/Primality_test#Fermat_primality_test). 

I wanted to test all 3 of these solutions implemented in Ruby. I wrote each formula as a Ruby class and ran a benchmark. These are the results of running each formula on my machine:

```
Testing SixK:
Time elapsed 3.2230000000000003 milliseconds
Testing BruteForce:
Time elapsed 892.418 milliseconds
Testing Fermat:
Time elapsed 3734.82 milliseconds
```

### Conclusion
Fermat's terrible benchmark is likely due in part to my implementation: Since it is a probabalistic test, I chose to run it more than once for every prime number. However, even dropping the number of times the test runs to just 2 per number, the speed is still north of 2 seconds in my benchmark.

My recursive approach isn't surprising. Recursion is simply not a good approach to testing primality due to memory constraints on large numbers.

I *was* surprised at just how much faster SixK was compared to Fermat. It scales much better than the other two methods and its relatively simple to implement. 

**Therefore, in satisfying the initial request in this code challenge, considering complexity and scalability, I would recommend the SixK method. I have made it the default algorithm used when running the application.**

