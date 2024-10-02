/*
===============================
===============================


===============================
## About AsyncValue
`AsyncValue` is a sealed and immutable class designed for handling the state of asynchronous operations (loading, data, error).
- It ensures that loading and error states are always handled properly, providing a consistent API for async operations.
- `AsyncValue` exposes utilities to easily convert its state (data, loading, error) into other objects or widgets, making it declarative.
- It allows you to access the result of async operations synchronously at any time without having to await future results.
- Being sealed and immutable means that `AsyncValue` cannot be subclassed or modified, ensuring consistency and predictability.
===============================


===============================
## ## Stream provider
- Stream provider works similar (use AsyncValue) fo future provider as stream is "set of futures"
- use-case: constantly read/write data from/to source/storage, which vale change with time
===============================


===============================
## USE-CASEs
-
===============================


// ===============================
// ## Main benefit of FUTURE Provider
// With `FutureProvider`, imperative code (like calling an API in `initState` and handling loading/data/error states) becomes **declarative**.
// - You simply watch the state of the provider and declaratively specify what should happen when the state changes.
// - It removes the need for manually managing state transitions, focusing instead on how to render the UI based on the current state.
// ===============================


// ===============================
// ## Future Provider has INVALIDATE and REFRESH methods
// - `invalidate`: Causes the provider to be disposed and rebuild when it is next accessed (next frame).
// - `refresh`: Immediately triggers a re-execution of the provider's computation and returns the new result.

// Key Differences:
// - `invalidate` waits until the next frame to trigger the rebuild, ensuring it happens only once, even if `invalidate` is called multiple times.
// - `refresh` is synchronous and immediately starts re-computing the provider's result.
// - `invalidate` is generally safer in fast sessions to avoid unnecessary multiple rebuilds.

// These methods are useful for features like:
// - **Pull to refresh**
// - **Retry on error**
// - **Restart a specific provider** to fetch fresh data or reset the computation.
// ===============================


// ===============================
// ## OTHER IMPORTANT info
// - `FutureProvider` is immutable and declarative, meaning you can't directly modify the state once it's computed, only refresh or invalidate it.
// - Avoid overusing `invalidate` unless you specifically need to reset the provider's state.
// ===============================

*/
