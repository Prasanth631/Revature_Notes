# Pure vs. Impure Functions

## Pure function

A function is pure when:

1. The same inputs always produce the same output.
2. It has no observable side effects.

```scala
def calculateTax(amount: BigDecimal, rate: BigDecimal): BigDecimal = amount * rate
```

This is pure: it depends only on its parameters and returns a predictable value.

## Impure function

An impure function reads or changes external state, prints, writes to a database/file, calls an API, or depends on time/randomness.

```scala
var processedCount = 0
def recordProcessed(): Unit = {
  processedCount += 1 // changes external state
  println(s"Processed: $processedCount")
}
```

Impure functions are necessary for real applications, but keep them at the edges. Let pure functions perform calculations and let a small outer layer print, save, or send results.

## Complete runnable example: invoice calculation and audit logging

Copy into `PureAndImpure.scala`.

```scala
// PureAndImpure.scala

object AuditLog {
  private var eventCount = 0

  // Impure: changes shared state and prints to the console.
  def record(message: String): Unit = {
    eventCount += 1
    println(s"AUDIT #$eventCount: $message")
  }
}

@main
def pureAndImpure(): Unit = {
  // Pure: all information comes from parameters; no external data changes.
  def discountedPrice(price: BigDecimal, discountRate: BigDecimal): BigDecimal =
    price - (price * discountRate)

  def finalPrice(price: BigDecimal, discountRate: BigDecimal, taxRate: BigDecimal): BigDecimal = {
    val afterDiscount = discountedPrice(price, discountRate)
    afterDiscount + (afterDiscount * taxRate)
  }

  val payable = finalPrice(BigDecimal("2000"), BigDecimal("0.10"), BigDecimal("0.18"))
  AuditLog.record(s"Invoice calculated. Payable amount: Rs. $payable")
  AuditLog.record("Payment confirmation email requested")
}
```

## Why purity matters in data engineering

Pure transformations are easy to test with sample records and safe to retry. If a Spark task retries a pure transformation, it produces the same result. External writes must be handled carefully to avoid duplicates.

## Interview answer

**Give one pure and one impure function.**  
`def square(x: Int): Int = x * x` is pure. A function that increments a global counter or prints a message is impure because it changes or observes the world outside its parameters and return value.
