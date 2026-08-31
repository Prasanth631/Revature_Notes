# Structure of Classes

## A class can contain

1. **Constructor parameters** — values supplied when the instance is created.
2. **Fields** — data kept by the object; mark constructor parameters `val`/`var` to expose them as fields.
3. **Methods** — behavior.
4. **Access modifiers** — `private` hides implementation details.
5. **Secondary constructors** — possible, but default parameters or companion objects are often simpler.

## Primary constructor and fields

```scala
class Employee(val id: Int, val name: String, var department: String) {
  def transfer(newDepartment: String): Unit =
    department = newDepartment
}
```

`id` and `name` are readable fields because they use `val`; `department` is readable and changeable because it uses `var`.

## Complete runnable example: safe bank account

Copy into `ClassStructure.scala`.

```scala
// ClassStructure.scala

class BankAccount(val accountNumber: String, owner: String, openingBalance: BigDecimal = 0) {
  // private means outside code cannot directly set a bad balance.
  private var balance: BigDecimal = openingBalance

  def deposit(amount: BigDecimal): String = {
    if amount > 0 then {
      balance += amount
      s"Deposited Rs. $amount. New balance: Rs. $balance"
    } else "Deposit amount must be positive"
  }

  def withdraw(amount: BigDecimal): String = {
    if amount <= 0 then "Withdrawal amount must be positive"
    else if amount > balance then "Insufficient balance"
    else {
      balance -= amount
      s"Withdrawn Rs. $amount. New balance: Rs. $balance"
    }
  }

  def accountSummary: String =
    s"Account $accountNumber belongs to $owner. Balance: Rs. $balance"
}

@main
def classStructure(): Unit = {
  val account = new BankAccount("ACC-5001", "Asha", BigDecimal("1000"))
  println(account.accountSummary)
  println(account.deposit(BigDecimal("500")))
  println(account.withdraw(BigDecimal("2000")))
  println(account.withdraw(BigDecimal("750")))
}
```

## Inheritance, overriding, and traits

```scala
class Notification {
  def send(message: String): String = s"Generic notification: $message"
}

class EmailNotification extends Notification {
  override def send(message: String): String = s"Email sent: $message"
}

trait Auditable {
  def auditMessage: String
}
```

Use `extends` to inherit from one class; a class can mix in multiple traits with `with`.

## Interview answer

**What is encapsulation?**  
Encapsulation hides internal state and exposes controlled operations. In the bank example, `balance` is private, so callers must use validated `deposit` and `withdraw` methods instead of setting an invalid balance directly.
