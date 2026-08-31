# Exception Handling

## Why exceptions happen

External input is unreliable. A user may enter text where a number is expected, a file may not exist, or a network call may fail. Exception handling lets your application respond instead of terminating unexpectedly.

## `try`, `catch`, and `finally`

```scala
try {
  "abc".toInt
} catch {
  case _: NumberFormatException => 0
} finally {
  println("This always runs")
}
```

- **try:** code that might fail.
- **catch:** handles a known failure. Catch specific exception types first.
- **finally:** cleanup code that runs whether the operation succeeds or fails.

## Complete runnable example: safely importing a quantity

Copy into `ExceptionHandling.scala`.

```scala
// ExceptionHandling.scala

@main
def exceptionHandling(): Unit = {
  // Scenario 1: data from a CSV column is text and may be invalid.
  def readQuantity(text: String): Int = {
    try {
      val quantity = text.trim.toInt
      if quantity >= 0 then quantity else 0
    } catch {
      case _: NumberFormatException =>
        println(s"Invalid quantity '$text'; using 0")
        0
    }
  }

  List("12", " 8 ", "unknown", "-4").foreach { rawValue =>
    println(s"Imported '$rawValue' as ${readQuantity(rawValue)}")
  }

  // Scenario 2: safely divide an order amount among people.
  def amountPerPerson(total: Double, people: Int): Double = {
    try {
      if people == 0 then throw new ArithmeticException("Cannot divide by zero")
      total / people
    }
    catch {
      case _: ArithmeticException => 0.0
    }
  }

  println(s"Amount per person: ${amountPerPerson(1000.0, 4)}")
  println(s"No people fallback: ${amountPerPerson(1000.0, 0)}")
}
```

## Better modeling for expected outcomes: `Option` and `Either`

Do not use exceptions for every expected validation outcome.

```scala
def findEmail(userId: Int): Option[String] =
  if userId == 101 then Some("asha@example.com") else None

def safeDivide(a: Int, b: Int): Either[String, Int] =
  if b == 0 then Left("Cannot divide by zero") else Right(a / b)
```

Use `Option` for “a value may be absent” and `Either` when you need to explain why an operation failed.

## Interview answer

**Why should you avoid a broad `case _: Exception` catch?**  
It can hide programming bugs and failures you did not expect. Catch the most specific exception you can handle meaningfully; otherwise allow it to fail or report it clearly.
