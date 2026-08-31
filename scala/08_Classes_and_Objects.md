# Classes and Objects

## Class: the blueprint

A class defines data and behavior for an entity. An object is an instance created from that class.

```scala
class Customer(val name: String) {
  def greeting: String = s"Hello, $name"
}

val customer = new Customer("Asha")
println(customer.greeting)
```

## `object`: a singleton

An `object` is created once. Use it for utility functions, constants, application entry points, or shared stateless services.

```scala
object TaxCalculator {
  val gstRate = 0.18
  def gst(amount: Double): Double = amount * gstRate
}
```

## Complete runnable example: product objects and a utility object

Copy into `ClassesAndObjects.scala`.

```scala
// ClassesAndObjects.scala

class Product(val id: Int, val name: String, val price: BigDecimal) {
  def priceWithTax: BigDecimal = price + TaxCalculator.gst(price)

  def summary: String =
    s"Product $id: $name, base = Rs. $price, with tax = Rs. $priceWithTax"
}

object TaxCalculator {
  private val gstRate = BigDecimal("0.18")

  def gst(amount: BigDecimal): BigDecimal = amount * gstRate
}

@main
def classesAndObjects(): Unit = {
  val keyboard = new Product(101, "Keyboard", BigDecimal("1500"))
  val mouse = new Product(102, "Mouse", BigDecimal("800"))

  println(keyboard.summary)
  println(mouse.summary)
  println(s"GST on Rs. 1000: ${TaxCalculator.gst(BigDecimal(1000))}")
}
```

## Real-life modeling ideas

| Class | Fields | Methods |
|---|---|---|
| `Employee` | id, name, department | `transfer`, `display` |
| `BankAccount` | account number, balance | `deposit`, `withdraw` |
| `Order` | order id, items, status | `total`, `markShipped` |

## Interview answer

**Class versus object?**  
A class is a blueprint used to create many instances. An object is a singleton: one shared instance, often used for utilities or an application entry point.
