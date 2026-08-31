# 01 — Introduction and Setup

## What is Scala?

Scala is a statically typed language that runs on the JVM. Its name comes from **scalable language**: the same language supports concise functional code and object-oriented design. Scala interoperates with Java, so Java classes and libraries can be used from Scala.

For data engineering, Scala is especially relevant because Apache Spark is implemented in Scala and its Scala API is expressive and strongly typed.

### Key characteristics

- **JVM language**: compiles to bytecode and uses the Java ecosystem.
- **Statically typed with type inference**: the compiler checks types, but many annotations are optional.
- **Object-oriented**: classes, objects, traits, inheritance, and encapsulation.
- **Functional**: functions are values; immutable collections and transformations are common.
- **Expression-oriented**: constructs such as `if` and `match` can produce values.

## Scala 3 program structure

```scala
@main
def helloScala(): Unit = {
  println("Hello, Scala!")
}
```

- `@main` marks a top-level method as an application entry point.
- `def` defines a method.
- `(): Unit` means no meaningful value is returned (similar to Java `void`).
- `println` is a side effect: it writes to the console.

Older Scala/Java-style entry points also work:

```scala
object HelloWorld {
  def main(args: Array[String]): Unit = {
    println("Hello, Scala!")
  }
}
```

## Local setup

1. Install a current LTS JDK (JDK 17 or 21 is a good choice).
2. Install either **Scala CLI** for small programs or **sbt** for projects.
3. Install IntelliJ IDEA with the Scala plugin, or VS Code with Metals.
4. Verify the installation:

```text
java -version
scala --version       # if using Scala CLI
sbt --version         # if using sbt
```

### Using Scala CLI

Create `Hello.scala` and run:

```bash
scala run Hello.scala
```

### Using sbt

An sbt project commonly has this structure:

```text
my-project/
├── build.sbt
├── project/
│   └── build.properties
└── src/
    ├── main/scala/
    └── test/scala/
```

Example `build.sbt`:

```scala
scalaVersion := "3.8.4"
```

Run from the project root:

```bash
sbt run
sbt compile
sbt test
```

The reviewed `Scala_Training` project uses Scala **3.8.4** and sbt **2.0.7**.

## Useful syntax facts

- Semicolons are normally omitted.
- Whitespace can define blocks in Scala 3, but braces remain valid.
- A line comment starts with `//`; a block comment uses `/* ... */`.
- A file can contain top-level definitions; a wrapping object is not required in Scala 3.

## Interview prompts

1. **Why is Scala useful in data engineering?** It has a strong Spark API, JVM performance and library access, and functional collection transformations that closely match distributed data processing.
2. **Is Scala interpreted or compiled?** It is compiled, normally to JVM bytecode; tools may compile and run it for you.
3. **What does `@main` do?** It creates an executable application entry point in Scala 3.
