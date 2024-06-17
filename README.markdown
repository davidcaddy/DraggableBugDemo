# Draggable Views with Child Drop Destination Elements not Draggable in iOS 18 (FB13938163)

This demo app shows four cards within a `LazyVStack' and `ScrollView`. Each of these card elements has been implemented with the `.draggable(...)` view modifier and _should_ be able to be dragged around the interface and dropped in any of the drop zones that correspond with the backing tranferable type of the given element.

This set up works as expected in iOS 17.x but not in iOS 18 seed 1. In iOS 18 Seed 1, a long press on the cards that contain multiple drop zones does NOT "pick up" the element and start the drag operation, suggesting `.dropDestination(...)` is now somehow interfereing with `.draggable(...)`.  

*YouTube video of showing different behaviour in iOS 17.4 vs iOS 18 Seed 1:*
[![Draggable Test](http://img.youtube.com/vi/AQidUHecIEA/0.jpg)](https://youtu.be/AQidUHecIEA)
