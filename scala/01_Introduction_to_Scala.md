# Introduction to Scala

## What is Scala?

Scala is a **statically typed** programming language that runs on the Java Virtual Machine (JVM). It combines two programming styles:

- **Object-oriented programming (OOP):** model real entities with classes and objects.
- **Functional programming (FP):** transform data with functions and immutable values.

Scala can use Java libraries, and Java can use Scala-compiled code. It is popular in data engineering because Apache Spark is written in Scala and its APIs use Scala's collection and functional-programming ideas.

## Where Scala is useful

| Real-life need | Why Scala fits |
|---|---|
| Process millions of clickstream records | Spark + Scala can distribute the work across machines. |
| Build a payment or inventory service | Strong types catch many mistakes before deployment. |
| Transform CSV/API data | `map`, `filter`, and immutable collections express data pipelines clearly. |

## Your first program

Copy this entire program into a file named `IntroductionToScala.scala`. It models a small data-engineering job: receiving daily sales records and calculating total revenue.

```scala
// IntroductionToScala.scala

@main
def introductionToScala(): Unit = {
  // A value is a named piece of data. Scala infers that dailySales is a List[Int].
  val dailySales = List(1200, 1800, 950, 2100)

  // A function turns input into output.
  def totalRevenue(sales: List[Int]): Int = sales.sum

  val revenue = totalRevenue(dailySales)

  println("Daily sales records: " + dailySales)
  println("Total revenue: Rs. " + revenue)

  // `if` produces a value in Scala.
  val status = if revenue >= 5000 then "Target achieved" else "Target not achieved"
  println(status)
}
```

Expected output:

```text
Daily sales records: List(1200, 1800, 950, 2100)
Total revenue: Rs. 6050
Target achieved
```

## Important words

- **Compiler:** converts Scala source code into JVM bytecode.
- **JVM:** runtime used by Java and Scala programs.
- **Type:** the kind of value, such as `Int`, `String`, or `Boolean`.
- **Immutable:** cannot be changed after creation; Scala encourages this style.
- **Expression:** code that produces a value. Most Scala constructs are expressions.

## Interview answer

**What is Scala, and why is it used in data engineering?**  
Scala is a JVM language that combines object-oriented and functional programming. Its concise collection operations, strong static typing, Java interoperability, and first-class Apache Spark support make it useful for building reliable data pipelines.

## Common beginner mistake

Do not confuse Scala with Java. Scala can use Java libraries, but its syntax and style are different. For example, Scala normally does not need semicolons, and it often returns the last expression from a function automatically.
