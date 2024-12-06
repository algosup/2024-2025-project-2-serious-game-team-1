# Test_Cases
|author|Léna|
|-|-|
|Created|11/27/2024|
|Finished|12/06/2024|

![-](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)
## Priority
Test priorities are differenciated as such:
| Number | Priority |
| --- | --- |
| 1 | Low (If we can't test it on time, it's fine) |
| 2 | Medium (Important but not critical) |
| 3 | High (Critical, Should be tested) |
<hr>

## Test

|ID|Test Area|Description|Expected Test Result|Priority|Check|
|-|-|-|-|-|-|
|1|Player|Mouvement's Control|move forward when W is pressed|High|None|
||||Move to the left when A is pressed|High|None|
||||Move to the right when D is pressed|High|None|
||||Move backward when S is pressed|High|None|
||||Move backward when S is pressed|High|None|
||||Jump when space bar pressed|High|None|
||||Sprint when shift pressed|High|None|
|2|Inventory|Use of inventory|When E pressed open or close the inventory|High|None|
||||Left click  to select an object|High|None|
|3|Interactions| Interacts with objects/talk with png|When you press f you talk to the png, if it's an object the player grabs it and the object goes into the inventory.|High|None|
|4|Quest|Quests are small objectives that the player completes during the game. The player has an interface interface so that he/she can see his/her quest progress (The player can only do 3 quests at the same time).|When you press the tab, the quest window opens or closes, and pressing one of the quests selects it and displays its location on the map.|High|None|
|5|Teleportation| The bike allows the player to teleport to key points on the map|When f is pressed on a bike, the map shows up and displays the locations of the other bikes. If the player clicks on one of them, he/she is teleported to that location. If the player is already at that location, a message will appear saying, ‘You are already at this location.’|Medium|None|
||||When esc pressed the map is close|Medium|None|
|6|Interface, Home Page|When the player opens the game, the first open window is the Home page below.| When the game is launched, several buttons and functions must be displayed|High|None|
||Setting| The player can modify some settings to adapt the game as he wants|Left click on Setting to display an interface and the player can change the sound volume, camera sensitivity, keys, and graphics.|Medium|None|
||New Game/Load/Quit| Different buttons on the homepage| Left click on New Game to create a new game. Left click on Load to load the player's last game. Left click on Quit to close the game.|High|None|
|7|Menu|When the player launches his/her part, he/she can open the menu window.|Menu open when esc pressed| High|None|
|||In the Menu, there are 3 buttons, Setting, Save, Quit| Left click on Quit to close the game. Left-click on Save to save the part. Left-click on the setting to the sound volume, camera sensitivity, keys, and graphics.| Medium| None|
|8|collision|The player must not be able to cross the map model.| When the player encounters an obstacle (3D model) he/she must not pass through it.|low|None|
