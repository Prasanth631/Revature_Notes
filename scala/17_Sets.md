# Set

## What is a `Set`?

A set stores unique elements. Repeated values are kept only once. Use it when uniqueness matters more than position.

```scala
val skills = Set("Scala", "SQL", "Python", "Scala")
println(skills) // Scala appears once
```

The default `Set` is immutable. Adding an item returns a new set.

## Real-life uses

- Remove duplicate customer IDs from an import.
- Store user roles or permissions.
- Compare the skills required for a job with a candidate's skills.

## Complete runnable example: access control and event deduplication

Copy into `Sets.scala`.

```scala
// Sets.scala

@main
def sets(): Unit = {
  // Scenario 1: check roles with a Set.
  val allowedRoles = Set("ADMIN", "ANALYST", "ENGINEER")
  val userRoles = Set("EMPLOYEE", "ENGINEER")
  val canAccessDashboard = userRoles.intersect(allowedRoles).nonEmpty
  println(s"Dashboard access: $canAccessDashboard")

  // Scenario 2: remove duplicate event IDs from an imported batch.
  val rawEventIds = List("EVT-1", "EVT-2", "EVT-1", "EVT-3", "EVT-2")
  val uniqueEventIds = rawEventIds.toSet
  println(s"Raw event count: ${rawEventIds.size}")
  println(s"Unique event count: ${uniqueEventIds.size}")
  println("Unique IDs: " + uniqueEventIds)

  // Scenario 3: compare required and existing skills.
  val requiredSkills = Set("Scala", "SQL", "Spark")
  val candidateSkills = Set("Scala", "SQL", "Python")
  println("Matched skills: " + requiredSkills.intersect(candidateSkills))
  println("Skills to learn: " + requiredSkills.diff(candidateSkills))
}
```

## Set operations

| Operation | Syntax | Meaning |
|---|---|---|
| Union | `a union b` or `a ++ b` | everything from both sets |
| Intersection | `a intersect b` | elements in both sets |
| Difference | `a diff b` | elements in `a` but not `b` |
| Membership | `a.contains(x)` | whether `x` exists |

## Interview answer

**List versus Set?**  
A `List` is ordered and allows duplicates. A `Set` represents unique values and should be used when duplicate values must be removed or membership needs to be checked clearly.
