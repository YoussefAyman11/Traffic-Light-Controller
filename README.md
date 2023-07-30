# Traffic-Light-Controller
traffic light controller for the intersection of street "A" and street "B". Each street has traffic sensors, which detect the presence of vehicles approaching or stopped at the intersection.

If sensor A is asserted that means a vehicle is approaching on street "A" and If sensor B is asserted that means a vehicle is approaching on street "B".

Street "A" is a main street and has a green light for 60 seconds, if no cars are approaching street "B" then Street "A" extended for 10 additional seconds. if a car approaches on "B." Then the lights of "A" change to yellow for 5 seconds and then change again to red and lights of "B" change to green.

Street "B” stays at green light state for at least 50 seconds, the lights change back unless there is a car on street "B" and none on "A," in which case the "B" cycle is extended for 10 additional seconds. If cars continue to arrive on street "B" and no car appears on street "A", "B" continues to have a green light.

The controller has 6 outputs (Ga, Ya, and Ra) drive the green, yellow, and red lights on street "A", and (Gb, Yb, and Rb) drive the corresponding lights on street "B".
