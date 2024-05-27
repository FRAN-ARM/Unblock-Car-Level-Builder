This is a simple level generator, made for an Artificial Intelligence class project.

The project consists of making a car game, in which we must make the blocked car move forward. The game in question is made with Python, but the level generator I made is made with GML.

Another detail is that the project must be done on console, so I made this level generator to make the construction of those levels easier.

In the Python code, the levels are generated in a 14 x 8 array.

In the builder, there is an object that iterates through each grid and determines if there is a wall, our car, another car or if there is an available space, and based on all that it accumulates the data and forms the array.
