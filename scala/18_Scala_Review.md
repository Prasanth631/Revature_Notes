# Scala Review — End-to-End Mini Project

## What this review combines

The program below uses the core weekly topics together:

- `case class` models an order.
- `List`, `Map`, and `Set` organize data.
- pure functions clean and calculate data.
- higher-order functions apply a promotion rule.
- `match` handles statuses.
- `try`/`catch` handles an invalid input value.

Copy the entire file into `ScalaReview.scala` and run it. It is intentionally small enough to understand but realistic enough for an interview explanation.

```scala
// ScalaReview.scala

case class Order(id: String, customer: String, amount: BigDecimal, status: String)

object OrderRules {
  // Pure function: same input always gives the same result, no side effects.
  def isValid(order: Order): Boolean = order.amount > 0

  def applyPromotion(order: Order, promotion: BigDecimal => BigDecimal): Order =
    order.copy(amount = promotion(order.amount))

  def statusMessage(status: String): String = status match {
    case "PAID"    => "Ready for dispatch"
    case "PENDING" => "Waiting for payment"
    case "FAILED"  => "Payment must be retried"
    case _          => "Unknown status"
  }

  def parseDiscount(text: String): BigDecimal = {
    try BigDecimal(text)
    catch {
      case _: NumberFormatException => BigDecimal(0)
    }
  }
}

@main
def scalaReview(): Unit = {
  val orders = List(
    Order("ORD-1", "Asha", BigDecimal("1500"), "PAID"),
    Order("ORD-2", "Ravi", BigDecimal("0"), "PENDING"),
    Order("ORD-3", "Asha", BigDecimal("2200"), "PAID")
  )

  // List: clean the incoming data without changing the original list.
  val validOrders = orders.filter(OrderRules.isValid)

  // Higher-order function: configure and pass a discount policy.
  val discountRate = OrderRules.parseDiscount("0.10")
  val tenPercentOff: BigDecimal => BigDecimal = amount => amount * (BigDecimal(1) - discountRate)
  val discountedOrders = validOrders.map(order => OrderRules.applyPromotion(order, tenPercentOff))

  // Map: group/order totals by customer.
  val totalByCustomer: Map[String, BigDecimal] = discountedOrders
    .groupBy(_.customer)
    .view
    .mapValues(customerOrders => customerOrders.map(_.amount).sum)
    .toMap

  // Set: find distinct customers.
  val customers: Set[String] = discountedOrders.map(_.customer).toSet

  println("Order statuses:")
  discountedOrders.foreach { order =>
    println(s"${order.id}: ${OrderRules.statusMessage(order.status)}; amount = Rs. ${order.amount}")
  }
  println("Customers: " + customers)
  println("Revenue by customer: " + totalByCustomer)
}
```

## Final interview checklist

| Question | Short answer |
|---|---|
| Why prefer `val`? | It prevents reassignment and makes data flow predictable. |
| What is a pure function? | Deterministic and free of observable side effects. |
| What is a higher-order function? | It accepts and/or returns a function. |
| `map` versus `filter`? | `map` transforms every item; `filter` keeps matching items. |
| `List` versus `Set`? | List is ordered and allows duplicates; Set stores unique values. |
| Why `Map.get`? | It returns `Option`, making a missing key explicit. |
| Case class benefit? | Concise data model with value equality, `copy`, and pattern matching. |
| `Option` versus `Either`? | Option represents absence; Either represents success or an explained failure. |

## Practice tasks

1. Add a `CANCELLED` status to `statusMessage`.
2. Add a second promotion for orders above Rs. 2000.
3. Change the invalid discount input from `"0.10"` to `"ten"` and observe the safe fallback.
4. Print only customers whose total spend exceeds Rs. 1000.
5. Explain which functions are pure and which statements cause side effects.
