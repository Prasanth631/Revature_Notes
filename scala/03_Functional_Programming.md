# Functional Programming

## The idea

Functional programming (FP) treats computation as the evaluation and composition of functions. In Scala, the most useful FP habits are:

- Prefer immutable data (`val`) over changing data (`var`).
- Write small functions that receive input and return output.
- Transform collections with `map`, `filter`, and `foldLeft`.
- Avoid hidden side effects where possible.

This style matches data engineering well: a pipeline takes raw records, filters bad records, transforms valid records, and aggregates results.

## Real-life examples

- **ETL:** Convert raw purchase amounts from paise to rupees, discard invalid transactions, and total the result.
- **HR analytics:** Filter active employees and transform their records into a report.
- **Recommendation system:** Convert user events into scores without changing the original events.

## Complete runnable example: sales pipeline

Copy into `FunctionalProgramming.scala` and run it with Scala 3.

```scala
// FunctionalProgramming.scala

case class Transaction(customer: String, amount: Double, successful: Boolean)

@main
def functionalProgramming(): Unit = {
  val transactions = List(
    Transaction("Asha", 1200.0, true),
    Transaction("Ravi", -50.0, true),
    Transaction("Meera", 800.0, false),
    Transaction("John", 1500.0, true)
  )

  // Each step returns a NEW collection; transactions is never changed.
  val validTransactions = transactions.filter(t => t.successful && t.amount > 0)
  val customerAmounts = validTransactions.map(t => (t.customer, t.amount))
  val totalRevenue = validTransactions.map(_.amount).foldLeft(0.0)(_ + _)

  println("Valid customer amounts: " + customerAmounts)
  println("Total revenue: Rs. " + totalRevenue)
  println("Original records still available: " + transactions.size)
}
```

## Imperative versus functional thinking

```scala
// Imperative: manually change a variable
var total = 0
for amount <- List(10, 20, 30) do total += amount

// Functional: describe the result without changing a variable
val functionalTotal = List(10, 20, 30).foldLeft(0)(_ + _)
```

Both are valid Scala. The functional version is usually easier to test and safer in parallel data processing.

## Interview answer

**What is functional programming in Scala?**  
It is a style that emphasizes functions, immutable values, and transformations rather than changing shared state. It makes data flow clearer and reduces errors caused by unexpected mutation.
