# Tuples

## What is a tuple?

A tuple is a fixed-size, ordered group of values. The values may have different types. Tuples are useful for small temporary results, such as `(productId, price)` or `(latitude, longitude)`.

```scala
val location = (17.3850, 78.4867)
println(location._1) // latitude
println(location._2) // longitude
```

Tuple positions start at `_1`, not `_0`.

## Destructuring

Destructuring gives names to tuple parts:

```scala
val (city, temperature) = ("Hyderabad", 32.5)
```

Prefer a `case class` when data has a long-lived meaning or more than a few fields. Named fields such as `employee.name` are clearer than `_1`.

## Complete runnable example: GPS readings and sales summary

Copy into `Tuples.scala`.

```scala
// Tuples.scala

@main
def tuples(): Unit = {
  // Scenario 1: a two-value GPS coordinate.
  val officeLocation = (17.3850, 78.4867)
  val (latitude, longitude) = officeLocation
  println(s"Office coordinate: latitude=$latitude, longitude=$longitude")

  // Scenario 2: return two related results from a function.
  def salesSummary(amounts: List[Double]): (Double, Double) = {
    val total = amounts.sum
    val average = if amounts.nonEmpty then total / amounts.size else 0.0
    (total, average)
  }

  val (totalSales, averageSale) = salesSummary(List(1200.0, 800.0, 1500.0))
  println(s"Total sales: Rs. $totalSales")
  println(s"Average sale: Rs. $averageSale")

  // Scenario 3: tuples are commonly used by Map entries.
  val prices = Map("Keyboard" -> 1500, "Mouse" -> 800)
  for (product, price) <- prices do println(s"$product costs Rs. $price")
}
```

## Interview answer

**Tuple versus case class?**  
Use a tuple for a small, temporary grouping of values. Use a case class when the data is an important domain entity and named fields improve readability, equality, copying, and pattern matching.
