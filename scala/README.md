# Scala — Revature Interview Notes

Focused study notes for Scala 3, prepared from the `Scala_Training` exercises. Each guide explains the idea, shows idiomatic Scala, and calls out the related practice files.

## Study path

| Order | Guide | Topics |
|---:|---|---|
| 1 | [01 — Introduction and Setup](01_Introduction_and_Setup.md) | Scala/JVM overview, Scala 3 syntax, installing JDK + Scala CLI, sbt, IntelliJ, running a program |
| 2 | [02 — Core Language](02_Core_Language.md) | values and variables, data types, expressions vs statements, strings, functions |
| 3 | [03 — Control Flow and Collections](03_Control_Flow_and_Collections.md) | conditions, pattern matching, loops, tuples, lists, maps, sets |
| 4 | [04 — Classes and Objects](04_Classes_and_Objects.md) | class structure, constructors, objects, case classes, inheritance, traits, encapsulation |
| 5 | [05 — Functional Programming](05_Functional_Programming.md) | pure/impure functions, lambdas, higher-order functions, map/filter/reduce |
| 6 | [06 — Exceptions and Review](06_Exceptions_and_Review.md) | try/catch/finally, `Option`/`Either`, interview recap, practice questions |

## How this matches the training project

The examples were reviewed in `Scala_Training/src/main/scala`. Helpful starting points:

- `HelloWorld.scala`, `UserDefinedFunctions.scala`, `Strings.scala`
- `If_Else.scala`, `NestedIf.scala`, `ForLoopExample.scala`, `Match_Ex1.scala`
- `Tuple_Example.scala`, `List_Example.scala`, `MapExample.scala`, `Set_Example.scala`
- `Class_Ex_1.scala` through `Class_Ex_6_Encapsulation.scala`, `Trait_Example.scala`, `CaseClassExample.scala`
- `PureFunctions.scala`, `ImpureExample.scala`, `HigherOrderExample.scala`, `BuiltInHigherOrderFunctions.scala`

> Code samples use Scala 3 indentation/braces style compatible with the training project. `@main` defines a runnable entry point.

## Fast interview checklist

- Explain why `val` is preferred over `var`.
- Know the difference between an expression and a statement, and why `if` and `match` return values.
- Be able to use `map`, `filter`, `flatMap`, `foldLeft`, and `reduce` on a `List`.
- Contrast `class`, `object`, and `case class`.
- Define a pure function and identify side effects.
- Explain immutable versus mutable `List`, `Map`, and `Set`.
- Handle failures with `try`/`catch`, then explain when `Option` or `Either` is a better return type.
