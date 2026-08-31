# Higher-Order Functions

## Definition

A higher-order function does at least one of these:

- accepts another function as an argument;
- returns a function as its result.

Functions are values in Scala, so they can be stored in `val`s, passed to methods, and returned from methods.

```scala
def applyOperation(value: Int, operation: Int => Int): Int = operation(value)
val doubled = applyOperation(10, x => x * 2)
```

## Real-life uses

- Apply different discount policies without duplicating checkout code.
- Pass a validation rule into a generic data-cleaning function.
- Create reusable formatters or multipliers configured for a customer or region.

## Complete runnable example: configurable discount engine

Copy into `HigherOrderFunctions.scala`.

```scala
// HigherOrderFunctions.scala

@main
def higherOrderFunctions(): Unit = {
  // Receives a pricing rule as a function.
  def finalBill(amount: BigDecimal, discountRule: BigDecimal => BigDecimal): BigDecimal =
    discountRule(amount)

  val regularDiscount: BigDecimal => BigDecimal = amount => amount * BigDecimal("0.95")
  val festivalDiscount: BigDecimal => BigDecimal = amount => amount * BigDecimal("0.80")

  val cartTotal = BigDecimal("2500")
  println(s"Regular customer bill: Rs. ${finalBill(cartTotal, regularDiscount)}")
  println(s"Festival customer bill: Rs. ${finalBill(cartTotal, festivalDiscount)}")

  // Returns a function. The returned function remembers `rate` (a closure).
  def taxCalculator(rate: BigDecimal): BigDecimal => BigDecimal =
    amount => amount * rate

  val indiaGst = taxCalculator(BigDecimal("0.18"))
  val gst = indiaGst(cartTotal)
  println(s"GST on Rs. $cartTotal: Rs. $gst")
}
```

## Lambdas and function types

```scala
val square: Int => Int = x => x * x
val add: (Int, Int) => Int = (a, b) => a + b
```

`Int => Int` means “a function from `Int` to `Int`.” `(Int, Int) => Int` means “a function accepting two `Int`s and returning an `Int`.”

## Interview answer

**What is a closure?**  
A closure is a function that captures values from the surrounding scope. In `taxCalculator`, the returned function remembers the `rate` passed when it was created.
