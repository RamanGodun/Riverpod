/*
===============================

## Defining&Describing of SHELL-ROUTE

ShellRoute is a specialized route type in the GoRouter package that facilitates creating a persistent shared container for child routes. 
It preserves state and context when navigating between child routes. This makes it particularly useful for implementing navigation elements 
like BottomNavigationBar, Drawer, or a Persistent Tab Bar, which remain accessible regardless of the active child route.

! Key aspects of ShellRoute:

	1.	Persistent Container:
ShellRoute creates a widget that stays persistent across navigations between child routes. This avoids re-initializing components 
(e.g., navigation bars or shared elements) that should remain static when routes change.

	2.	Child Routes:
Child routes are defined inside the ShellRoute. They can access the shared context and state of the parent ShellRoute, 
enabling seamless interaction and efficient state management.

	3.	Application:
	•	Enables the creation of navigation components (e.g., TabBar, Drawer) that do not reload or reset when content changes.
	•	Simplifies the construction of multi-level routes with a clear and modular structure.

! How it works:

	1.	Container Creation:
ShellRoute creates a persistent container (e.g., MainShell), which houses shared UI elements such as BottomNavigationBar. 
This container remains static while the child (active child route) updates dynamically in Scaffold.body.

	2.	State Preservation:
When navigating between child routes (e.g., /home and /profile), the MainShell container does not reinitialize. 
This ensures state consistency and prevents unnecessary re-rendering.

	3.	RiverPod Integration:
	•	Shared State: Providers, like counterProvider, allow child routes to share and manage state seamlessly across the application.
	•	ProviderScope: If needed, child routes can use isolated state by defining local ProviderScope overrides.

! Benefits of using ShellRoute with RiverPod:

	•	Simplified State Management:
Centralized state handling makes it easier to manage complex navigation hierarchies.

	•	Efficient Resource Utilization:
Persistent containers (e.g., navigation bars) prevent redundant reinitializations, improving performance and user experience.

	•	State Flexibility:
Through ProviderScope, developers can choose between shared or isolated state management, depending on the specific use case.

===============================

===============================

## 


===============================

===============================

## 


===============================
 */

/*

 */
