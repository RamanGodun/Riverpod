/*
===============================
## Optimization:

1. By using ProviderScope

Scopes – usages

1. Widget rebuild optimization
   - by removing parameters from Widget constructors ➔ const constructors 
?"by creating within ProviderScope the local state (provider)  for each item in itemList, which before was given in constructor of ListView.builder list"
local providers ensure "state isolation", that allows to work with each element independently 

2. Creating synchronous providers for normally async APIs (Firebase, SharedPreferences, etc)
   - by replacing the value that the synchronous providers return

3. Allowing Dialogs and Overlays to inherit the state of providers from the widget subtree that causes them to be shown
   - Riverpod allows you to create a ProviderScope that can access the state of all providers in a parent scope

4. Override the state of providers for a specific subtree (In majority cases can be replaced by family provider)
   - Use subtree scoping to make providers behave independently or differently in specific widget subtrees



===============================


===============================
## Other Important Concepts:


===============================

 */
