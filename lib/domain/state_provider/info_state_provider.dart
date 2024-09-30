/*
<!--  -->
## StateProvider -- Use case --
in case when need to save state and make some changes in this state
!! No big Business logic (for that is NotifierProvider)
!! No code generation supporting
<!--  -->


<!--  -->
# Notifier property
provide an instance of object
<!--  -->

<!--  -->
# State controller VS State Notifier
StateController - is subClass of StateNotifier, that allows to modify its state from outside -- USED for SIMPLE CHANGING of STATE
StateNotifier can't change state from outside -- USED when handling logic is big and difficult
<!--  -->

<!--  -->
# NotifierProvider -- is improved version (recommended to use it) of StateNotifierProvider, and his simplified version is StateProvider
Provider which provides an instance of Notifier Class, so in this case we need to create a Notifier Class
<!--  -->

<!--  -->
### ABOUT REF.WATCH, REF.LISTEN and REF.READ INSIDE providers
if u want watch te state of another provider -- use REF.WATCH
if u want perform some action -- use RED.LISTEN
!!! Don't use REF.READ INSIDE PROVIDER (unpredictable behavior)
<!--  -->


<!--  -->
UseCASE:
one StateProvider ("keepAlive: true") depends on another,
every time as state of that another Provider CHANGES => depending Provider was disposed and creates a new one
<!--  -->


<!--  -->
<!--  -->



<!--  -->
<!--  -->


<!--  -->
<!--  -->


<!--  -->
<!--  -->


<!--  -->
<!--  -->


<!--  -->
<!--  -->


<!--  -->
<!--  -->

 */
