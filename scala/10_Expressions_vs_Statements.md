# Expressions vs. Statements

## The core difference

An **expression** produces a value. A **statement** performs an action, usually for its side effect. Scala is expression-oriented: `if`, `match`, and a block `{ ... }` can return values.

```scala
val label = if score >= 50 then "Pass" else "Fail" // expression returns String
println(label)                                       // action; result type is Unit
```

The final expression in a block becomes the block's value:

```scala
val bill = {
  val amount = 1000
  val tax = amount * 0.18
  amount + tax // returned automatically
}
```

## Why this is useful

Instead of declaring a mutable variable and assigning it in each branch, create an immutable value from the branch result. This reduces accidental state changes.

## Complete runnable example: checkout pricing and ticket priority

Copy into `ExpressionsVsStatements.scala`.

```scala
// ExpressionsVsStatements.scala

@main
def expressionsVsStatements(): Unit = {
  // Scenario 1: a block expression calculates a final invoice value.
  val invoiceTotal = {
    val itemTotal = BigDecimal("1200")
    val discount = itemTotal * BigDecimal("0.10")
    val taxableAmount = itemTotal - discount
    val tax = taxableAmount * BigDecimal("0.18")
    taxableAmount + tax // last expression is the result
  }
  println(s"Invoice total: Rs. $invoiceTotal") // statement: prints a result

  // Scenario 2: if expression selects a ticket priority.
  val customerTier = "Gold"
  val priority = if customerTier == "Gold" then "High" else "Normal"
  println(s"Support priority: $priority")

  // Scenario 3: match expression converts a status into a message.
  val orderStatus = "SHIPPED"
  val message = orderStatus match {
    case "NEW"     => "Order received"
    case "SHIPPED" => "Order is on the way"
    case "DELIVERED" => "Order completed"
    case _         => "Status unavailable"
  }
  println(message)
}
```

## `Unit` and side effects

`println`, assigning a `var`, writing a database record, and sending an email are actions. Their result type is generally `Unit`, represented by `()`.

Side effects are not inherently bad—an application must eventually display, save, or send something. Keep them separate from core calculations when practical.

## Interview answer

**Is `if` a statement or an expression in Scala?**  
It is an expression because it returns a value. This allows `val result = if condition then value1 else value2`.
