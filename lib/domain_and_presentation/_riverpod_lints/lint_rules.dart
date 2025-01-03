/*
===============================
## Lint rules, remember next:

1. Generated providers should only depend on other generated providers. 
Failing to do so may break rules such as "provider_dependencies".

2. Notifiers should not have public properties/getters.
Instead, all their public API should be exposed through the `state` property.

3. Providers parameters should have a consistent ==. 
Meaning either the values should be cached, or the parameters should override ==
(?? so have to use const objects or objects with same hash code??)




===============================


===============================
## ! Influence of using "parent" parameter:
When calling showDialog or navigation methods in the HomePage4OverlayOptimization widget:
	1.	Without the parent parameter:
	•	Even if the parent widget MyHomePage overrides the provider using:
          ProviderScope(
            overrides: [
                 overlay_counter.counterProvider.overrideWith(
                 () => Counter100(),
                    )
                    ],
                    child: const HomePage4OverlayOptimization(),
                )

	•	The global context (from the ProviderScope in main.dart) is used.
	•	For example, the counterProvider value will be "0" (default value in the global context).

	2.	With the parent parameter in ProviderScope:
	•	The nearest local context (from the parent ProviderScope) is inherited.
	•	In this case:
	•	The counterProvider value will be "100", as overridden in MyHomePage.


===============================

===============================
## SUBTREE SCOPING

at first, look opportunity to avoid using it, by using separate provider or family provider(because subtree scoping is difficult)

===============================
 */
