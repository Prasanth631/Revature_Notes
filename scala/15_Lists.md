# List

## What is a `List`?

`List` is Scala's standard immutable ordered collection. It can contain duplicates. Adding or removing elements creates a new list; the original remains unchanged.

```scala
val tasks = List("Extract", "Transform", "Load")
val withValidate = tasks :+ "Validate" // new list
```

Prepending with `::` is efficient because a Scala list is linked from the front:

```scala
val urgentTasks = "Alert" :: tasks
```

## Everyday uses

- A day's purchase records.
- A batch of employee records from a CSV file.
- Items in an order.

## Complete runnable example: shopping cart and data-quality filter

Copy into `Lists.scala`.

```scala
// Lists.scala

case class CartItem(name: String, price: BigDecimal, quantity: Int)

@main
def lists(): Unit = {
  val cart = List(
    CartItem("Keyboard", BigDecimal("1500"), 1),
    CartItem("Mouse", BigDecimal("800"), 2),
    CartItem("Cable", BigDecimal("-50"), 1) // invalid source record
  )

  // Scenario 1: retain valid items and calculate line totals.
  val validItems = cart.filter(item => item.price > 0 && item.quantity > 0)
  val lineTotals = validItems.map(item => (item.name, item.price * item.quantity))
  val cartTotal = lineTotals.map(_._2).foldLeft(BigDecimal(0))(_ + _)

  println("Line totals: " + lineTotals)
  println(s"Cart total: Rs. $cartTotal")

  // Scenario 2: immutable updates create a separate list.
  val cartWithHeadphones = validItems :+ CartItem("Headphones", BigDecimal("2200"), 1)
  println(s"Original valid item count: ${validItems.size}")
  println(s"Updated cart item count: ${cartWithHeadphones.size}")
}
```

## Essential methods

| Method | Meaning |
|---|---|
| `map` | transform every element |
| `filter` | keep matching elements |
| `find` | return first matching element as `Option` |
| `exists` | test whether at least one matches |
| `forall` | test whether all match |
| `foldLeft` | combine safely with an initial value |
| `sortBy` | return a sorted list by a key |

## Interview answer

**Why is `foldLeft` usually safer than `reduce`?**  
`foldLeft` takes an initial value and therefore works on an empty list. `reduce` needs at least one element and throws an exception for an empty list.
