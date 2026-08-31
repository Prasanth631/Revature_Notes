# Variables and Values

## `val` and `var`

Scala has two common ways to bind a name to a value:

| Keyword | Can the name be reassigned? | Recommended use |
|---|---:|---|
| `val` | No | Default choice for stable data |
| `var` | Yes | State that truly changes, such as a retry counter |

```scala
val employeeId = 101     // employeeId cannot be assigned another value
var loginAttempts = 0    // loginAttempts may change
loginAttempts = 1
```

Prefer `val`: it makes code easier to understand because a name always refers to the same value. This is important when multiple Spark tasks work in parallel.

## Type inference and annotations

Scala infers types from the right side:

```scala
val city = "Hyderabad"  // inferred as String
val count = 25           // inferred as Int
```

Add a type annotation when it clarifies an API or the compiler needs help:

```scala
val taxRate: Double = 0.18
```

## Complete runnable example: inventory and login state

Copy into `VariablesAndValues.scala`.

```scala
// VariablesAndValues.scala

@main
def variablesAndValues(): Unit = {
  // Scenario 1: product details should not be accidentally reassigned.
  val productName = "Wireless Keyboard"
  val unitPrice: Double = 1499.0
  val quantity = 3
  val orderAmount = unitPrice * quantity

  println(s"Order: $quantity x $productName")
  println(s"Amount: Rs. $orderAmount")

  // Scenario 2: a login retry count is genuine changing state, so var is appropriate.
  var failedAttempts = 0
  failedAttempts += 1
  failedAttempts += 1

  val accountStatus = if failedAttempts >= 3 then "Locked" else "Active"
  println(s"Failed attempts: $failedAttempts, account: $accountStatus")
}
```

## Important distinction

`val` prevents **reassignment**, not necessarily mutation of an object. For example, a `val` can point to a mutable collection whose contents still change. Prefer immutable collections such as the default `List`, `Map`, and `Set` whenever possible.

## Interview answer

**What is the difference between `val` and `var`?**  
`val` is immutable as a binding: it cannot be reassigned. `var` can be reassigned. Scala developers prefer `val` because it makes code more predictable and safer for concurrent processing.
