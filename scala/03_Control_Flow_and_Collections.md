# 03 — Control Flow, Tuples, and Collections

## Conditions

`if`/`else` is an expression, so assign its result directly when possible:

```scala
def category(salary: Int): String =
  if salary >= 100000 then "excellent"
  else if salary >= 75000 then "good"
  else "developing"
```

Nested `if` works, but named boolean conditions are often clearer:

```scala
val eligible = age >= 18 && isCitizen
if eligible then "Eligible to vote" else "Not eligible"
```

### Pattern matching

`match` is Scala's powerful alternative to a long conditional chain.

```scala
def dayType(day: Int): String = day match {
  case 1 | 2 | 3 | 4 | 5 => "Weekday"
  case 6 | 7             => "Weekend"
  case _                 => "Invalid"
}

def lifeStage(age: Int): String = age match {
  case n if n < 18  => "Minor" // guard
  case n if n < 60  => "Adult"
  case _            => "Senior citizen"
}
```

`_` is the default/wildcard pattern. A guard adds an `if` condition to a case.

## Loops

```scala
for i <- 1 to 5 do println(i)    // includes 5
for i <- 1 until 5 do println(i) // excludes 5

for {
  i <- 1 to 3
  if i % 2 != 0
} println(i)

var n = 3
while n > 0 do {
  println(n)
  n -= 1
}
```

In functional Scala, prefer transformations such as `map` and `filter` when producing a new collection. Reserve `while` and mutable state for cases where they are genuinely clearer or required.

## Tuples

A tuple groups a fixed number of values, potentially of different types.

```scala
val person = ("Alice", 30, "Engineer")
println(person._1) // Alice
println(person._2) // 30

val (name, age, role) = person // destructuring
```

Tuples are useful for small, temporary groupings. Prefer a case class when the fields need meaningful names.

## Lists

`List` is an immutable, ordered collection. Operations return a new list.

```scala
val fruits = List("apple", "mango", "orange")
val withFig = fruits :+ "fig"              // append
val withPear = "pear" :: fruits             // prepend (efficient)
val longNames = fruits.filter(_.length > 5)
val pairs = fruits.map(fruit => (fruit, fruit.length))
```

| Operation | Meaning |
|---|---|
| `list(i)` | access by zero-based index |
| `head`, `tail` | first element / all except first; unsafe on empty list |
| `map(f)` | transform every element |
| `filter(p)` | retain elements satisfying predicate |
| `foreach(f)` | perform an action for each item |
| `foldLeft(initial)(f)` | safe aggregation with explicit starting value |
| `reduce(f)` | combine elements; throws on empty list |

## Maps

A `Map[K, V]` associates unique keys with values. Immutable maps are the default.

```scala
val scores = Map("Asha" -> 92, "Ravi" -> 88)
scores("Asha")                 // 92; throws if missing
scores.get("Meera")            // Option[Int]
scores.getOrElse("Meera", 0)   // 0

val updated = scores.updated("Asha", 95)
val expanded = scores + ("Meera" -> 90)
```

For a mutable map, explicitly import `scala.collection.mutable.Map`; then `map(key) = value` updates it.

## Sets

A `Set` contains unique values and has no guaranteed meaningful positional order.

```scala
val left = Set(1, 2, 3, 4)
val right = Set(3, 4, 5, 6)

left union right       // Set(1, 2, 3, 4, 5, 6), also `left | right`
left intersect right   // Set(3, 4), also `left & right`
left diff right        // Set(1, 2), also `left -- right`
```

## Interview prompts

1. **`to` versus `until`?** `to` includes the end; `until` excludes it.
2. **Why is `List` called immutable?** You cannot change an existing list; adding/removing produces another list.
3. **What does `Map.get` return?** `Option[V]`: `Some(value)` when present or `None` when absent.
4. **List vs Set?** A list is ordered and permits duplicates; a set keeps unique elements.
