# Test_Cases
|author|Léna|
|-|-|
|Created|11/27/2024|
|Finished|12/18/2024|

![-](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

you can see all bugs found on the file *bug_database.md*

## Priority
Test priorities are differentiated as such:
| Number | Priority |
| --- | --- |
| 1 | Low (If we can't test it on time, it's fine) |
| 2 | Medium (Important but not critical) |
| 3 | High (Critical, Should be tested) |

![-](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

## Test

|ID|Test Area|Description|Expected Test Result|Priority|Check|
|-|-|-|-|-|-|
|1|Player|Mouvement's Control|move forward when W is pressed|High|Done|
||||Move to the left when A is pressed|High|Done|
||||Move to the right when D is pressed|High|Done|
||||Move backward when S is pressed|High|Done|
||||Move backward when S is pressed|High|Done|
||||Jump when space bar pressed|High|Done|
||||Sprint when shift pressed|High|Done|
|2|Inventory|Use of inventory|When E pressed open or close the inventory|High|Done|
||||Left click  to select an object and see all the information about this object|High|Done|
|3|Interactions|Talk with png|When you press f you talk to the png.|High|Done|
||| Interacts with objects|When you press f the player grabs it and the object goes into the inventory.|High|Done|
|4|Quest|Quests are small objectives that the player completes during the game. The player has an interface interface so that he/she can see his/her quest progress (The player can only do 3 quests at the same time).|When you press C, the quest window opens or closes|High|Done|
||||pressing one of the quests selects it and displays its location on the map.|High|None|
|5|Teleportation| The bike allows the player to teleport to key points on the map|When f is pressed on a bike, the map shows up and displays the locations of the other bikes.|Medium|None|
||||If the player clicks on one of the bikes on the map, they are teleported to that location.|Medium|None|
||||If the player selects a bike but she/he is already at that location, a message will appear saying, ‘You are already at this location.’|Medium|None|
||||When esc pressed the map is close|Medium|None|
|6|Home Page|When the player opens the game, the first open window is the Home page below.| When the game is launched, several buttons and functions must be displayed|High|Done|
|||Setting, The player can modify some settings to adapt the game as he wants|Left click on Setting to display an interface and the player can change the sound volume, camera sensitivity, keys, and graphics.|Medium|Done|
|||New Game | Left-click on New Game to create a new game.|High|None|
|||Load|Left click on Load to load the player's last game.|High|None|
|||Quit| Left click on Quit to close the game.|High|Done|
|7|Menu|When the player launches his/her part, he/she can open the menu window. there are 3 buttons, Setting, Save, Quit|Menu open when esc pressed| High|Done|
|||Quit| Left-click on Quit to close the game.| High| Done|
|||Save|Left-click on Save to save the part.|High|None|
|||Setting|Left-click on the setting to the sound volume, camera sensitivity,and keys.|Medium|Done|
|8|collision|The player must not be able to cross the map model.| When the player encounters an obstacle (3D model) he/she must not pass through it.|low|Done|
