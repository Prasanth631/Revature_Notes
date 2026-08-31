# Map

## What is a `Map`?

A map stores key-value pairs. Keys are unique; assigning the same key again replaces its associated value in the resulting map.

```scala
val productPrices = Map("Keyboard" -> 1500, "Mouse" -> 800)
```

Default Scala maps are immutable. `+`, `-`, and `updated` return new maps.

## Safely reading values

```scala
productPrices.get("Keyboard")          // Some(1500)
productPrices.get("Monitor")           // None
productPrices.getOrElse("Monitor", 0)  // 0
```

Avoid `productPrices("Monitor")` when the key may be missing: it throws `NoSuchElementException`.

## Complete runnable example: product catalog and employee lookup

Copy into `Maps.scala`.

```scala
// Maps.scala

@main
def maps(): Unit = {
  // Scenario 1: an e-commerce catalog maps SKU to price.
  val catalog = Map(
    "KB-101" -> BigDecimal("1500"),
    "MS-202" -> BigDecimal("800"),
    "HD-303" -> BigDecimal("2200")
  )

  val requestedSku = "MS-202"
  val price = catalog.getOrElse(requestedSku, BigDecimal(0))
  println(s"Price for $requestedSku: Rs. $price")

  // Scenario 2: create a new catalog with a price update; original catalog is unchanged.
  val saleCatalog = catalog.updated("KB-101", BigDecimal("1350")) + ("WB-404" -> BigDecimal("500"))
  println(s"Original keyboard price: ${catalog("KB-101")}")
  println(s"Sale keyboard price: ${saleCatalog("KB-101")}")

  // Scenario 3: map an employee ID to a department.
  val departments = Map(101 -> "Data Engineering", 102 -> "QA")
  departments.foreach { case (employeeId, department) =>
    println(s"Employee $employeeId works in $department")
  }
}
```

## Mutable map

Use a mutable map only when updates are needed in place:

```scala
import scala.collection.mutable.Map
val stock = Map("KB-101" -> 10)
stock("KB-101") = 9
```

Be explicit about the import so readers know mutation is possible.

## Interview answer

**What does `Map.get` return and why?**  
It returns `Option[V]`: `Some(value)` if the key exists and `None` otherwise. This makes the missing-key case explicit and helps avoid runtime errors.
