## StateProvider -- Use case --

in case when need to save state and make some changes in this state

!! No big Business logic (for that is NotifierProvider)
!! No code generation supporting

# Notifier property

provide an instance of object

<!--  -->

# State controller VS State Notifier

StateController - is subClass of StateNotifier, that allows to modify its state from outside -- USED for SIMPLE CHANGING of STATE

StateNotifier can't change state from outside -- USED when handling logic is big and difficult

# NotifierProvider -- is improved version (recommended to use it) of StateNotifierProvider, and his simplified version is StateProvider

Provider which provides an instance of Notifier Class, so in this case we need to create a Notifier Class
