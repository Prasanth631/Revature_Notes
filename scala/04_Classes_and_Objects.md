# 04 — Classes, Objects, and Structure

## Basic class structure

```scala
class Student(val name: String, var age: Int) {
  def introduce(): String =
    s"$name is $age years old"
}

val student = new Student("Rahul", 25)
student.age = 26
```

The parameter list after the class name is the **primary constructor**. Prefixing a parameter with `val` or `var` makes it a field accessible on instances. A plain constructor parameter is only available within the class body.

## Objects

An `object` is a singleton: exactly one instance exists. Use it for utility methods, constants, or a companion object.

```scala
object IdGenerator {
  private var nextId = 1
  def newId(): Int = {
    val id = nextId
    nextId += 1
    id
  }
}
```

`object Student` paired with `class Student` is its **companion object**; the pair can access each other's private members.

## Encapsulation

Keep invalid state changes from outside the class using `private` data and public methods:

```scala
class BankAccount(private var balance: BigDecimal = 0) {
  def deposit(amount: BigDecimal): Unit =
    if amount > 0 then balance += amount

  def withdraw(amount: BigDecimal): Boolean =
    if amount > 0 && amount <= balance then {
      balance -= amount
      true
    } else false

  def currentBalance: BigDecimal = balance
}
```

For money, use `BigDecimal` instead of `Double` to avoid binary floating-point rounding issues.

## Inheritance and overriding

```scala
class Animal {
  def sound(): String = "generic sound"
}

class Dog extends Animal {
  override def sound(): String = "woof"
}
```

`extends` inherits from a parent class. The `override` keyword is required when replacing a concrete inherited method, making accidental method-name collisions visible.

## Traits

A trait defines a reusable contract and may contain implemented methods. A class can mix in multiple traits.

```scala
trait Payment {
  def pay(amount: BigDecimal): String
}

class UpiPayment extends Payment {
  def pay(amount: BigDecimal): String = s"Paid $amount using UPI"
}
```

## Case classes

Use a `case class` for data models. It automatically supplies useful behavior: public `val` fields, readable `toString`, value-based `equals`/`hashCode`, `copy`, and pattern matching support.

```scala
case class Employee(id: Int, name: String, salary: BigDecimal)

val employee = Employee(101, "Rahul", 50000)
val promoted = employee.copy(salary = 60000)

employee match {
  case Employee(id, name, _) => println(s"$id: $name")
}
```

## Overloading

Method overloading means methods share a name but have different parameter lists:

```scala
class Calculator {
  def add(a: Int, b: Int): Int = a + b
  def add(a: Int, b: Int, c: Int): Int = a + b + c
}
```

## Interview prompts

1. **Class vs object?** A class is a blueprint used to create instances; an object is a singleton instance.
2. **Why use a case class?** It is concise for immutable data and provides `copy`, equality, destructuring, and a companion object automatically.
3. **Trait vs abstract class?** A class can mix in multiple traits but extend only one class. Traits model capabilities/contracts; abstract classes are useful when sharing class state or constructor parameters.
4. **What is encapsulation?** Hiding internal data and exposing controlled operations that preserve valid state.
