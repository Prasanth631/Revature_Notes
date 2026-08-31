# Data Types

## Why types matter

A type tells the compiler what kind of value is stored and which operations are valid. Static typing catches errors early: Scala will reject adding a number to a `Boolean`, for example.

## Common Scala types

| Type | Example | Real-life use |
|---|---|---|
| `Int` | `42` | item count, age, record count |
| `Long` | `9000000000L` | large IDs, event timestamps |
| `Double` | `98.5` | measurements, percentages |
| `BigDecimal` | `BigDecimal("499.99")` | money; avoid rounding errors |
| `Boolean` | `true` | active/inactive, paid/unpaid |
| `Char` | `'A'` | grade, first character |
| `String` | `"Scala"` | names, cities, JSON fields |
| `Unit` | `()` | a method that performs an action but returns no business value |

`String` is immutable. You can read it and create a new modified string, but you cannot alter the original characters.

## Complete runnable example: employee record validation

Copy into `DataTypes.scala`.

```scala
// DataTypes.scala

@main
def dataTypes(): Unit = {
  val employeeId: Long = 9000000123L
  val employeeName: String = "Ananya"
  val rating: Double = 4.6
  val grade: Char = 'A'
  val isActive: Boolean = true
  val monthlySalary: BigDecimal = BigDecimal("72500.50")

  println(s"Employee: $employeeName (ID: $employeeId)")
  println(s"Rating: $rating, Grade: $grade, Active: $isActive")
  println(s"Salary: Rs. $monthlySalary")

  // String operations are useful for cleaning text data.
  val rawDepartment = "  data engineering  "
  val cleanDepartment = rawDepartment.trim.toUpperCase
  println(s"Clean department: $cleanDepartment")

  // A Boolean often drives a decision.
  val accessMessage = if isActive then "System access granted" else "System access denied"
  println(accessMessage)
}
```

## Type conversion

Convert deliberately when data arrives as text, such as from a CSV or user input:

```scala
val quantityText = "12"
val quantity: Int = quantityText.toInt
val average = 10.0 / 3        // 3.333...
```

`20 / 3` evaluates to `6` because both values are `Int`. Use `20.0 / 3` when a decimal result is needed.

## Interview answer

**Why use `BigDecimal` for money instead of `Double`?**  
`Double` stores many decimal values as approximate binary floating-point values, so repeated calculations can introduce small rounding errors. `BigDecimal` represents decimal values more accurately for financial calculations.
