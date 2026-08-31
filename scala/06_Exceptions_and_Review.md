# 06 — Exception Handling and Scala Review

## Exceptions

Use `try`/`catch`/`finally` for operations that can throw, such as converting user input or reading external resources.

```scala
def parseAge(text: String): Int =
  try text.trim.toInt
  catch {
    case _: NumberFormatException => 0
```

`finally` always runs, normally for cleanup:

```scala
try {
  println("Do work")
} catch {
  case error: Exception => println(s"Failed: ${error.getMessage}")
} finally {
  println("Cleanup runs")
}
```

Catch the most specific exception possible. Do not silently swallow an exception: recover intentionally, log/report it, or let it propagate.

## Prefer typed results for expected failures

Exceptions are suitable for exceptional failures. For an expected absence or validation failure, model it in the return type.

### `Option`

`Option[A]` is either `Some(value)` or `None`.

```scala
val score: Option[Int] = Map("Asha" -> 92).get("Asha")
val result = score.getOrElse(0)
```

Avoid calling `.get` on an `Option`; it throws for `None`. Use `getOrElse`, `map`, `fold`, or pattern matching.

### `Either`

`Either[ErrorType, SuccessType]` expresses a result or a reason for failure. By convention, `Left` is failure and `Right` is success.

```scala
def safeDivide(a: Int, b: Int): Either[String, Int] =
  if b == 0 then Left("Cannot divide by zero")
  else Right(a / b)
```

## Common corrections from the reviewed exercises

- `20 / 3` is integer division because both operands are `Int`; use `20.0 / 3` for a decimal result.
- Prefer `val` for collections that are never reassigned; collection transformations already return new values.
- Use `BigDecimal` for currency rather than `Double`.
- `list.head`, `reduce`, and `map(key)` can throw on missing/empty input. Use safe alternatives when input may be absent.
- `case` guards should cover every possibility, typically with a final `case _` if appropriate.

## One-minute interview review

| Topic | Answer to remember |
|---|---|
| Scala | Statically typed JVM language combining OOP and FP. |
| `val` / `var` | `val` cannot be reassigned; `var` can. Prefer `val`. |
| Expression | Produces a value; Scala's `if` and `match` are expressions. |
| Tuple | Fixed-size ordered grouping, accessed by `_1`, `_2`, or destructured. |
| List | Immutable ordered sequence; duplicates allowed. |
| Map | Key-value collection; `get` returns `Option`. |
| Set | Collection of unique elements. |
| Case class | Data-focused class with equality, `copy`, and pattern matching support. |
| Pure function | Deterministic and free of side effects. |
| Higher-order function | Takes and/or returns functions. |
| `map` / `filter` | Transform each item / retain matching items. |
| Exception handling | `try`/`catch`/`finally`; use `Option`/`Either` for expected outcomes. |

## Practice prompts

1. Write `grade(score: Int): String` using `if` or `match` guards.
2. Given `List(1, 2, 2, 3, 4, 4)`, produce its unique even values without mutating the original list.
3. Write `wordLengths(words: List[String]): List[(String, Int)]`.
4. Create a `case class Employee(id, name, department)` and use `copy` to change its department.
5. Write a pure `tax(salary: BigDecimal): BigDecimal` function.
6. Write `parsePositiveInt(text: String): Either[String, Int]`.
7. Explain what `numbers.filter(_ % 2 == 0).map(_ * 2)` does and why its order matters.

## Suggested answer: safe positive integer parser

```scala
def parsePositiveInt(text: String): Either[String, Int] =
  try {
    val value = text.trim.toInt
    if value > 0 then Right(value)
    else Left("Value must be positive")
  } catch {
    case _: NumberFormatException => Left("Enter a whole number")
  }
```

This keeps expected validation feedback in an `Either`, while still safely converting the Java/Scala parsing exception.
