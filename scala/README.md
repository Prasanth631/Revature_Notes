# Scala for Beginners — Revature Interview Notes

These notes are written for someone starting Scala from zero. Every guide follows the same pattern:

1. Clear theory without assumed Scala knowledge.
2. Real-life reasons to use the feature.
3. A **complete Scala 3 program** you can copy into one file and run.
4. A short interview answer and common usage notes.

## Before you start

Read [Scala Setup](02_Scala_Setup.md) first. The examples use **Scala 3** and a runnable `@main` method. Save a code block as the file name shown in its comment, then run it with Scala CLI:

```powershell
scala run FileName.scala
```

Or put the file inside `src/main/scala` in an sbt/IntelliJ project and run the `@main` method.

## Complete learning path

| # | Topic | What you will learn | Standalone program |
|---:|---|---|---|
| 01 | [Introduction to Scala](01_Introduction_to_Scala.md) | Scala, JVM, OOP, FP, data-engineering relevance | Daily sales analysis |
| 02 | [Scala Setup](02_Scala_Setup.md) | JDK, Scala CLI, sbt, IntelliJ, project layout | Hello Scala |
| 03 | [Functional Programming](03_Functional_Programming.md) | immutable data, pipeline transformations | Transaction-cleaning pipeline |
| 04 | [Variables and Values](04_Variables_and_Values.md) | `val`, `var`, inference, annotations | Inventory and login state |
| 05 | [Data Types](05_Data_Types.md) | numbers, text, Booleans, `BigDecimal`, conversion | Employee record validation |
| 06 | [Conditions](06_Conditions.md) | `if`/`else`, `match`, guards, operators | Loan decision and ticket routing |
| 07 | [Loops](07_Loops.md) | `for`, ranges, guards, `while`, loops vs `map` | Warehouse processing and retries |
| 08 | [Classes and Objects](08_Classes_and_Objects.md) | instances, singletons, fields, methods | Product catalog and tax utility |
| 09 | [Structure of Classes](09_Structure_of_Classes.md) | constructors, fields, methods, `private`, traits | Safe bank account |
| 10 | [Expression vs. Statement](10_Expressions_vs_Statements.md) | returned values, blocks, `Unit`, side effects | Invoice and support ticket logic |
| 11 | [Tuples](11_Tuples.md) | grouping, `_1`, `_2`, destructuring | GPS and sales summary |
| 12 | [Pure vs. Impure Functions](12_Pure_vs_Impure_Functions.md) | determinism, side effects, testability | Invoice calculation and audit log |
| 13 | [Higher-Order Functions](13_Higher_Order_Functions.md) | lambdas, function types, closures | Configurable discount engine |
| 14 | [Exception Handling](14_Exception_Handling.md) | `try`, `catch`, `finally`, `Option`, `Either` | Safe CSV quantity import |
| 15 | [List](15_Lists.md) | immutable sequence, `map`, `filter`, `foldLeft` | Shopping cart and quality checks |
| 16 | [Map](16_Maps.md) | keys, values, safe lookup, immutable updates | Product catalog and employee lookup |
| 17 | [Set](17_Sets.md) | uniqueness, membership, set operations | Access control and deduplication |
| 18 | [Scala Review](18_Scala_Review.md) | all core topics together | End-to-end order-processing mini project |

## Recommended study order for this week

1. Complete guides 01–07 to build the syntax foundation.
2. Study guides 08–11 to understand Scala's object-oriented and expression-based design.
3. Spend extra time on guides 12–17. These functional and collection operations are especially important for Spark.
4. Type the final mini project from guide 18 yourself, then change the values and explain each line aloud.

## Source alignment

The theory was rebuilt around the reviewed `Scala_Training` practice files, including `HelloWorld.scala`, `UserDefinedFunctions.scala`, `ForLoopExample.scala`, `List_Example.scala`, `MapExample.scala`, `Set_Example.scala`, the class examples, and the higher-order-function exercises. The notes correct unsafe or incomplete patterns and present each idea as a standalone learning example.
