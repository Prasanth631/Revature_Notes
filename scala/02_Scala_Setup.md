# Scala Setup

## What you need

For a smooth local setup on Windows, install:

1. **JDK 17 or JDK 21** — Scala runs on the JVM.
2. **IntelliJ IDEA Community/Ultimate + Scala plugin** — best if your training uses IntelliJ.
3. **sbt** — Scala Build Tool, used by the training project.
4. Optional: **Scala CLI** — a simple command-line tool for one-file programs.

## Verify the installation

Open PowerShell and run:

```powershell
java -version
sbt --version
scala --version
```

`scala --version` is available when Scala CLI or a Scala distribution is installed. The training project uses Scala **3.8.4** and sbt **2.0.7**.

## Run a single Scala file with Scala CLI

1. Create a file named `HelloScala.scala`.
2. Paste the complete code below.
3. In that folder, run `scala run HelloScala.scala`.

```scala
// HelloScala.scala

@main
def helloScala(): Unit = {
  val traineeName = "Prasanth"
  val technology = "Scala"

  println(s"Hello, $traineeName!")
  println(s"You are ready to learn $technology.")
}
```

## Run an sbt project

An sbt project usually looks like this:

```text
project-root/
├── build.sbt
├── project/
│   └── build.properties
└── src/
    └── main/
        └── scala/
            └── HelloScala.scala
```

Minimal `build.sbt`:

```scala
scalaVersion := "3.8.4"
```

From the project root, run:

```powershell
sbt compile
sbt run
sbt test
```

If there are several `@main` methods, sbt asks which one to run. Choose the number matching your program.

## IntelliJ IDEA steps

1. Open IntelliJ → **Open** → select the folder containing `build.sbt`.
2. Let IntelliJ import the sbt project and download dependencies.
3. Put a Scala file in `src/main/scala`.
4. Click the green run icon beside an `@main` method, or right-click the file → **Run**.

## Troubleshooting

| Problem | Likely fix |
|---|---|
| `java` is not recognized | Install a JDK and add its `bin` directory to `PATH`. |
| Scala version is wrong | Check `scalaVersion` in `build.sbt`, then reload sbt in IntelliJ. |
| `sbt run` cannot choose a main method | Select the desired method from the prompt; this is normal when a project has many examples. |
| Syntax errors with `then` | Use Scala 3, not an older Scala 2 compiler. |

## Interview answer

**What are JDK, sbt, and Scala CLI?**  
The JDK provides the JVM that runs compiled Scala. sbt is a build tool for managing multi-file projects, dependencies, compilation, and tests. Scala CLI is a lightweight tool for compiling and running small Scala programs or scripts.
