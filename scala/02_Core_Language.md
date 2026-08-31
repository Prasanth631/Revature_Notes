# 02 — Core Language: Values, Types, Expressions, and Functions

## `val` versus `var`

Use `val` for a binding that cannot be reassigned. Use `var` only when the binding genuinely needs to change.

```scala
val employeeId = 101       // cannot be reassigned
var status = "new"         // can be reassigned
status = "processed"
```

`val` does not make the referenced object automatically immutable; it prevents reassignment of the name. Immutable data plus `val` makes code easier to reason about and safer in concurrent programs.

Type inference usually finds the type:

```scala
val name = "Prasanth"     // String
val score = 98             // Int
val active = true          // Boolean
val rate: Double = 3.14    // explicit annotation when useful
```

## Common data types

| Type | Example | Notes |
|---|---|---|
| `Byte`, `Short`, `Int`, `Long` | `42`, `42L` | integral numbers |
| `Float`, `Double` | `3.14f`, `3.14` | decimal numbers; `Double` is default |
| `Boolean` | `true` | logical values |
| `Char` | `'A'` | one Unicode character |
| `String` | `"Scala"` | immutable text |
| `Unit` | `()` | no meaningful result |
| `Any` | `val x: Any = 1` | common supertype; avoid unless necessary |

### Strings and interpolation

```scala
val language = "Scala"
val years = 2
println(s"Learning $language for $years years")
println(s"Next year: ${years + 1}")
println(raw"A literal \n is not a new line")
```

Useful methods include `length`, `toUpperCase`, `toLowerCase`, `substring`, `split`, `replace`, and `slice`. Strings are indexed from zero: `"Scala"(0)` is `'S'`.

## Expression versus statement

An **expression** evaluates to a value. A **statement** mainly performs an action; in Scala, many familiar constructs are expressions.

```scala
val result = if 10 > 5 then "yes" else "no" // expression: evaluates to String
println(result)                                // side effect; result type is Unit
```

The last expression in a block becomes that block's value:

```scala
val total = {
  val subtotal = 100
  subtotal + 18
}
```

## Functions

```scala
def add(a: Int, b: Int): Int = a + b

def greet(name: String): Unit = {
  println(s"Hello, $name")
}
```

- Parameters are named values available inside the function.
- The return type follows `:`. Declare public method return types; inference is fine for local values.
- The final expression is returned; `return` is usually unnecessary.

### Default, named, and repeated parameters

```scala
def welcome(name: String, greeting: String = "Hello"): String =
  s"$greeting, $name"

welcome("Ram")
welcome(name = "Ram", greeting = "Hi")

def sumAll(numbers: Int*): Int = numbers.sum
sumAll(10, 20, 30)
```

## Interview prompts

1. **Why prefer `val`?** It prevents reassignment and supports immutable, predictable code.
2. **What is `Unit`?** The result type for code whose useful effect is an action, such as printing; its only value is `()`.
3. **Does Scala require `return`?** No. The last expression in a method or block is returned.
4. **What is type inference?** The compiler derives a type from an expression, such as inferring `Int` for `val count = 5`.
