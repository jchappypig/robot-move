IRobot
===================

This is a simple robot game

#### What it looks like in console:
```
--------------- Welcome to iRobot --------------
-- Please place me somewhere on a 5 * 5 grid, --
-- so that I can move around                  --
--                                            --
-- Available commands:                        --
-- > PLACE X,Y,F                              --
-- > MOVE                                     --
-- > LEFT                                     --
-- > RIGHT                                    --
-- > REPORT                                   --
-- > EXIT                                     --
------------------------------------------------
Please give me a command:
```

#### How to play:

###### Get started

At terminal:

```
ruby main.rb
```

###### Available commands 
- **PLACE X,Y,F** - will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST
- **MOVE** - will move the toy robot one unit forward in the direction it is currently facing
- **LEFT** - will rotate the robot anti-clockwise 90 degrees in the specified direction without changing the position of the robot
- **RIGHT** - will rotate the robot clockwise 90 degrees in the specified direction without changing the position of the robot
- **REPORT** - will announce the X,Y and orientation of the robot
- **EXIT** - will exit the programme

###### Constrains
- Please **PLACE** robot first, or else all other commands will be ignore, except **EXIT**
- Cannot **PLACE**/**MOVE** robot out of grid. Any move that would cause the robot to out of grid will be ignored.
- The origin **(0,0)** can be considered to be the **SOUTH WEST** most corner.
 