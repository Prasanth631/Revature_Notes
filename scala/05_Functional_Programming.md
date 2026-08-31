# 05 — Functional Programming

Functional programming (FP) builds programs by composing functions and favoring immutable data. Scala supports FP alongside object-oriented programming.

## Pure and impure functions

A **pure function** has two properties:

1. Same input always gives the same output.
2. It has no observable side effects (it does not print, mutate external state, write a file, call a service, and so on).

```scala
def add(a: Int, b: Int): Int = a + b // pure
```

```scala
var bonus = 5000
def salaryWithBonus(salary: Int): Int = salary + bonus // impure: reads mutable external state

def greet(name: String): Unit = println(s"Hello, $name") // impure: prints
```

Pure functions are easier to test, reuse, cache, and run safely in parallel. Side effects are sometimes necessary; a common design is to isolate them at the edges of the program.

## Lambda functions

A lambda is an anonymous function:

```scala
val square: Int => Int = x => x * x
val add: (Int, Int) => Int = (a, b) => a + b
```

Function types use `=>`: `A => B` means a function accepting `A` and returning `B`.

## Higher-order functions

A higher-order function accepts a function, returns a function, or both.

```scala
def calculate(a: Int, b: Int, operation: (Int, Int) => Int): Int =
  operation(a, b)

calculate(10, 20, _ + _)
calculate(10, 20, (x, y) => x * y)
```

Returning a function creates a closure; it remembers values from its creation context:

```scala
def multiplier(factor: Int): Int => Int =
  number => factor * number

val double = multiplier(2)
double(10) // 20
```

## Essential collection transformations

```scala
val numbers = List(10, 15, 20, 25)

numbers.map(_ * 2)              // List(20, 30, 40, 50)
numbers.filter(_ % 2 == 0)      // List(10, 20)
numbers.foreach(println)        // action; returns Unit
numbers.reduce(_ + _)           // 70; requires non-empty collection
numbers.foldLeft(0)(_ + _)      // 70; safe on empty collection
```

`flatMap` maps each element and flattens one collection level:

```scala
val lines = List("scala spark", "sql")
lines.flatMap(_.split(" ")) // List("scala", "spark", "sql")
```

### Method reference versus lambda

```scala
def isEligible(age: Int): Boolean = age >= 18
val ages = List(16, 18, 25)

ages.filter(isEligible)
ages.filter(_ >= 18)
```

Both forms pass a function to `filter`. The underscore form is concise for a one-use expression.

## Data-engineering connection

Spark transformations read like Scala collection operations:

```scala
// Conceptual comparison: the same FP shape appears in Spark
val cleaned = records
  .filter(_.isValid)
  .map(_.normalized)
```

In Spark, transformations are evaluated lazily and distributed; ordinary Scala `List` transformations execute immediately in the current JVM.

## Interview prompts

1. **What is a higher-order function?** A function that takes another function as a parameter, returns one, or both.
2. **`map` vs `foreach`?** `map` returns a transformed collection; `foreach` is for side effects and returns `Unit`.
3. **`reduce` vs `foldLeft`?** `reduce` has no explicit initial value and fails on empty input; `foldLeft` has an initial accumulator and works on empty input.
4. **What is a closure?** A function that captures values from the surrounding lexical scope, such as `factor` in `multiplier`.
