/*
===============================
## About AsyncValue
here must be main important info about AsyncValue...
- With AsyncValue I never fail handle loading or error state  of async operations,
-Also exposes utilities tyo nicely converting an AsyncValue to a different objects,
- plus result let handle async values synchronously (in any moment provides value synchronously)
-  this is sealed and immutable class (what is this?)
===============================

===============================
## R when <R>({})
Has these arguments: data, error, loading, (specify others and what they do and when are used).
is a alternative syntax to "switch"
===============================

// ===============================
// ## StateController vs StateNotifier
// - StateController: A subclass of StateNotifier that allows external modifications of its state. Use it for simple state changes.
// - StateNotifier: Doesn't allow external state modifications. It’s better suited for complex logic handling.
// ===============================

// ===============================
// ## NotifierProvider
// NotifierProvider is an enhanced version (recommended for use) of StateNotifierProvider
// Its simplified alternative is StateProvider.
// - NotifierProvider provides an instance of a Notifier class, so you need to create a Notifier class to handle the logic.
// ===============================

// ===============================
// ## Working with ref.watch, ref.listen, and ref.read inside providers
// - Use ref.watch when you want to observe another provider's state.
// - Use ref.listen for performing actions in response to state changes.
// - Avoid using ref.read inside providers as it may lead to unpredictable behavior.
// ===============================

// ===============================
// ## Use Case Example
// One StateProvider ("keepAlive: true") depends on another provider.
// Each time the state of the dependent provider changes, the first provider is disposed and recreated.
// ===============================

// ===============================
// ## Family Provider
// The Family provider allows for more reusable and dynamic code by treating the provider like a function.
// ===============================

*/
