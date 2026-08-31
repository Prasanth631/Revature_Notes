# Conditions

## `if`, `else if`, and `else`

Conditions choose an outcome based on a Boolean expression. In Scala, `if` is an **expression**, so it can return a value directly.

```scala
val deliveryFee = if orderAmount >= 500 then 0 else 40
```

Use `else if` for multiple ranges. Always include a final `else` when you need a complete result.

## Pattern matching with `match`

Use `match` when a value has several known shapes or categories. It is often clearer than a long chain of `if` statements.

```scala
val message = paymentStatus match {
  case "PAID"    => "Send order to warehouse"
  case "PENDING" => "Wait for payment"
  case "FAILED"  => "Ask customer to retry"
  case _          => "Unknown status"
}
```

## Complete runnable example: loan decision and support ticket routing

Copy into `Conditions.scala`.

```scala
// Conditions.scala

@main
def conditions(): Unit = {
  // Scenario 1: decision based on more than one condition.
  val monthlyIncome = 75000
  val creditScore = 730
  val loanDecision =
    if monthlyIncome >= 50000 && creditScore >= 700 then "Approved"
    else if monthlyIncome >= 50000 then "Manual review"
    else "Rejected"
  println(s"Loan decision: $loanDecision")

  // Scenario 2: route a customer-support ticket by category.
  val issueType = "PAYMENT"
  val team = issueType match {
    case "PAYMENT"  => "Billing team"
    case "DELIVERY" => "Logistics team"
    case "ACCOUNT"  => "Account team"
    case _           => "General support team"
  }
  println(s"Route ticket to: $team")

  // A match guard handles numeric ranges.
  val temperature = 39
  val alert = temperature match {
    case t if t >= 40 => "Critical alert"
    case t if t >= 38 => "High fever alert"
    case _            => "Normal monitoring"
  }
  println(alert)
}
```

## Operators used in conditions

- Comparison: `==`, `!=`, `>`, `<`, `>=`, `<=`
- Logical AND: `&&`
- Logical OR: `||`
- Logical NOT: `!`

## Interview answer

**Why is Scala's `if` useful as an expression?**  
It returns a value, so you can assign the result directly to a `val`. This avoids manually declaring a variable and changing it in separate branches.
