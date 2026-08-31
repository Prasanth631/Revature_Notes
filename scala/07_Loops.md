# Loops

## When to use loops

Loops repeat work. Scala supports familiar `for` and `while` loops, but collection methods such as `map` and `filter` are often better when the goal is to create transformed data.

## `for` loop ranges

```scala
for day <- 1 to 7 do println(day)     // includes 7
for index <- 0 until 7 do println(index) // stops at 6
```

Use a **for-comprehension** to loop over a collection and add conditions:

```scala
for order <- orders if order.amount > 1000 do println(order)
```

## `while` loop

Use `while` when repetition depends on a condition that changes, such as polling a service or allowing a limited number of attempts. Be sure the condition can eventually become false.

## Complete runnable example: warehouse batches and retry attempts

Copy into `Loops.scala`.

```scala
// Loops.scala

@main
def loops(): Unit = {
  // Scenario 1: process only high-value warehouse orders.
  val orders = List(("ORD-101", 450), ("ORD-102", 1500), ("ORD-103", 2200))
  for (orderId, amount) <- orders if amount >= 1000 do {
    println(s"Priority packing for $orderId: Rs. $amount")
  }

  // Scenario 2: run a report for each day of a work week.
  for day <- 1 to 5 do {
    println(s"Generating report for workday $day")
  }

  // Scenario 3: retry a temporary connection no more than three times.
  var attempts = 0
  var connected = false
  while !connected && attempts < 3 do {
    attempts += 1
    println(s"Connection attempt $attempts")
    if attempts == 2 then connected = true // pretend the second attempt succeeds
  }
  println(s"Connected: $connected")
}
```

## Loop versus `map`

```scala
val amounts = List(100, 200, 300)
for amount <- amounts do println(amount * 1.18) // action: prints

val withTax = amounts.map(_ * 1.18)             // transformation: returns List[Double]
```

Use `foreach` or a loop for side effects like printing. Use `map` when creating a new collection.

## Interview answer

**What is the difference between `to` and `until`?**  
`to` includes the end value, while `until` excludes it. For example, `1 to 3` yields 1, 2, 3; `1 until 3` yields 1, 2.
