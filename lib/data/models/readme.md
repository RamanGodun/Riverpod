## Code optimization with correct models

Even objects with the same simple arguments can have different hash codes,
which makes them different instances in memory. This can lead to unnecessary
object duplication and reduced performance.

To optimize performance and ensure that objects with identical data are treated
as the same, we can override `hashCode` and the equality operator (`==`). This
can be done more efficiently by using:

- `freezed`: Automatically generates immutable data classes with proper `hashCode`
  and equality implementations.

- `equatable`: Simplifies equality comparison by only comparing relevant fields
  and provides a straightforward way to define `==` and `hashCode`.

- `tuple`: A lightweight package for creating simple value classes with built-in
  `hashCode` and `==` handling.

By using these libraries, we ensure that objects with the same data are treated
as equal, which improves performance and reduces memory usage.
