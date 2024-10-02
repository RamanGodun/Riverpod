/*
===============================
===============================


===============================
## About StateNotifierProvider (state_notifier package) and ChangeNotifierProvider
- Allows to expose and listen StateNotifier subclass
- No code generation supports for StateNotifierProvider or ChangeNotifierProvider
- ChangeNotifier class allows to centralize and handle complicated business logic
- NotifierProvider and AsyncNotifierProvider also centralize BL, but they are immutable
- Remi (author) recommends to use NotifierProvider instead of StateNotifierProvider,
which is a legacy (as ChangeNotifierProvider and ChangeNotifier), in fact
- ChangeNotifierProvider is for cases, where mutable state (models) is preferred
- In ChangeNotifier class syntax is similar as used in Provider package (also Remi author)

===============================


===============================
## R when <R>({})
`when` is a method on `AsyncValue` that allows you to handle different states (data, error, loading) in a declarative way.
Arguments:
- `data`: Called when the future completes successfully. It provides the resulting data.
- `loading`: Called when the future is still running. Often used to show a loading spinner.
- `error`: Called when the future fails. It provides the error object and a stack trace for debugging.

- This syntax is an alternative to `switch` for handling async states, making the code cleaner and more declarative.
===============================


===============================
## USE-CASEs
- `FutureProvider` doesn't allow direct modification of the ongoing computation after a user interaction.
- It is designed for simple async use-cases like fetching data from an API. For more complex scenarios, use `AsyncNotifierProvider` or `StateNotifierProvider`.
- You can `ref.watch` other providers inside a `FutureProvider`, and when their state changes, the `FutureProvider` automatically rebuilds with the new data.
===============================


===============================
## Main benefit of FUTURE Provider
With `FutureProvider`, imperative code (like calling an API in `initState` and handling loading/data/error states) becomes **declarative**.
- You simply watch the state of the provider and declaratively specify what should happen when the state changes.
- It removes the need for manually managing state transitions, focusing instead on how to render the UI based on the current state.
===============================


===============================
## Future Provider has INVALIDATE and REFRESH methods
- `invalidate`: Causes the provider to be disposed and rebuild when it is next accessed (next frame).
- `refresh`: Immediately triggers a re-execution of the provider's computation and returns the new result.

Key Differences:
- `invalidate` waits until the next frame to trigger the rebuild, ensuring it happens only once, even if `invalidate` is called multiple times.
- `refresh` is synchronous and immediately starts re-computing the provider's result.
- `invalidate` is generally safer in fast sessions to avoid unnecessary multiple rebuilds.

These methods are useful for features like:
- **Pull to refresh**
- **Retry on error**
- **Restart a specific provider** to fetch fresh data or reset the computation.
===============================


===============================
## OTHER IMPORTANT info
- `FutureProvider` is immutable and declarative, meaning you can't directly modify the state once it's computed, only refresh or invalidate it.
- Avoid overusing `invalidate` unless you specifically need to reset the provider's state.
===============================

*/
