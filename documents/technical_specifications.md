#  **Technical Specifications - 2024-2025-project-2-serious-game-team-1**

---

| Role | Name | Profiles
|---|---|---|
| Project Manager | Grégory PAGNOUX | [GitHub](https://github.com/Gregory-Pagnoux) \| [LinkedIn](https://www.linkedin.com/in/grégory-pagnoux-313b3a251/) | 
| Program Manager | Mathis LEBEL |[GitHub](https://github.com/mathislebel) \| [LinkedIn](https://www.linkedin.com/in/mathis-lebel-429114293/) |
| Tech Lead | Robin GOUMY |[GitHub](https://github.com/RobinGOUMY) \| [LinkedIn](https://www.linkedin.com/in/robin-goumy-66452832a/) |
| Software Developer | Mattéo LEFIN |[GitHub](https://github.com/Mattstar64) \| [LinkedIn](https://www.linkedin.com/in/matt%C3%A9o-lefin-380272293/) |
| Software Developer | Alexis SANTOS |[GitHub](https://github.com/Mamoru-fr) \| [LinkedIn](https://www.linkedin.com/in/alexis-santos-83481031b/) | 
| Quality Assurance | Lena DE GERMAIN |[GitHub](https://github.com/lenadg18) \| [LinkedIn](https://www.linkedin.com/in/lena-degermain-5535a032a/) |
| Technical Writer | Guillaume DESPAUX |[GitHub](https://github.com/GuillaumeDespaux) \| [LinkedIn](https://www.linkedin.com/in/guillaume-despaux/) |

---

### *Last Update on November 29th, 2024*

![alt text](./images/Godot_Logo-1.png)

<details>

<summary>Table of Contents</summary>

- [**Technical Specifications - 2024-2025-project-2-serious-game-team-1**](#technical-specifications---2024-2025-project-2-serious-game-team-1)
    - [*Last Update on November 29th, 2024*](#last-update-on-november-29th-2024)
- [Introduction](#introduction)
  - [Audience](#audience)
  - [Overview](#overview)
  - [Glossary](#glossary)
  - [Client Requirements](#client-requirements)
    - [Objective :](#objective-)
    - [Game Engine :](#game-engine-)
    - [Game theme :](#game-theme-)
    - [Game Quality :](#game-quality-)
    - [Deliverable Requirements :](#deliverable-requirements-)
- [Work Environement](#work-environement)
  - [Github Conventions](#github-conventions)
    - [1. Branch](#1-branch)
    - [2. Commit](#2-commit)
    - [3. Pull Request](#3-pull-request)
    - [4. Issue](#4-issue)
  - [Code Conventions](#code-conventions)
    - [Naming](#naming)
    - [Comments](#comments)
    - [Repository architecture](#repository-architecture)
  - [Source Folder](#source-folder)
    - [Assets](#assets)
      - [Characters](#characters)
      - [Sounds](#sounds)
      - [Fonts](#fonts)
      - [Music](#music)
      - [Texture](#texture)
      - [Object](#object)
      - [Dialogue](#dialogue)
    - [Script](#script)
    - [Interfaces](#interfaces)
  - [System :](#system-)
      - [Desktop or laptop PC - Recommended (More here)](#desktop-or-laptop-pc---recommended-more-here)
- [Introduction to GODOT](#introduction-to-godot)
  - [About Godot Engine](#about-godot-engine)
    - [Node](#node)
  - [Scene](#scene)
  - [3D](#3d)
    - [3D tools](#3d-tools)
    - [3D geometry helper class.](#3d-geometry-helper-class)
    - [3D physics](#3d-physics)
      - [Physics bodies:](#physics-bodies)
      - [Collision detection:](#collision-detection)
  - [Scripting](#scripting)
    - [GDScript:](#gdscript)
      - [Methods](#methods)
      - [Annotations](#annotations)
- [Development Steps](#development-steps)
  - [1. Environement setup](#1-environement-setup)
    - [Godot architecture](#godot-architecture)
    - [Perspective](#perspective)
    - [Game aspects](#game-aspects)
      - [Movements](#movements)
  - [2. Development of the Map](#2-development-of-the-map)
    - [Map Foundation](#map-foundation)
    - [Zone Texture](#zone-texture)
    - [Zone Delimitation](#zone-delimitation)
    - [Add Assets](#add-assets)
  - [3. Game mechanics integration](#3-game-mechanics-integration)
    - [User Interface](#user-interface)
      - [Main Menu](#main-menu)
      - [Inventory](#inventory)
      - [HUD](#hud)
        - [Mini Maps](#mini-maps)
        - [Time](#time)
        - [Reputation](#reputation)
        - [Quests Panel](#quests-panel)
  - [4. Others features](#4-others-features)
    - [Audio](#audio)
    - [Dialogue](#dialogue-1)
    - [Interaction Quest \& Player](#interaction-quest--player)
  - [5. Gameplay testing](#5-gameplay-testing)
  - [6. Final phase and launch](#6-final-phase-and-launch)

</details>


--- 

# Introduction

The goal of this document is to define the technical specifications of the project.
It will be used to define the technical requirements and conventions of the project, as well as the tools we will be using.

## Audience 

This document intended for all the team:

Main audiences

- Software engineers: to help them grasp user and technical requirements and support informed decision-making during project planning. It provides insights into client expectations, potential risks and challenges, as well as the technical choices made.
  
Secondary audiences

- Project manager: to pinpoint risks and help him to take decision.

- Program lead: to verify alignment with the functional specifications and ensure the project meets client expectations.
  
- Quality Assurance : to assist in preparing the testing strategy and using it as a reference to identify and validate issues.

  
## Overview

ALGOSUP's school commissioned us to create a serious game on GODOT Game Engine. 


## Glossary

| Term           | Definition  |
|----------------|-------------|
| **.glTF**      | The .glTF format is an open, standardized file format designed for the efficient and compact exchange of 3D models. |
| **.json**      | A .json file is a lightweight, human-readable data format used to store and exchange information. |
| **AI**         | Artificial Intelligence, used to simulate human-like behavior in games or applications. |
| **Animation**  | A file used to define the movement of 3D objects in Unreal Engine. |
| **Asset**      | A file that can be imported into Godot Engine. |
| **Collision Shape** | A geometric shape used to define the area for detecting collisions in a game engine. |
| **CSG**        | Constructive Solid Geometry, a method for creating complex 3D shapes by combining or subtracting simpler ones. |
| **Dialogue**   | Text that appears on the screen, often as part of a character interaction or storytelling. |
| **FPS**        | First-Person Shooter or First-Person View. |
| **Game Engine**| Software that provides the tools needed to create video games, such as graphics, physics, audio, and interaction management. |
| **GitHub**     | A version control platform used to host, review, and manage code collaboratively. |
| **HUD**        | Heads-Up Display, a graphical interface that displays essential information to the player in real time, such as health, score, resources, etc. |
| **Lore**       | The backstory, world-building, or narrative that provides depth to a game’s universe. |
| **MIT License**| A permissive open-source license that allows developers to use, copy, modify, and distribute software, even in commercial projects, without paying royalties. |
| **NPC**        | Non-Playable Character, a character controlled by the game rather than the player. |
| **Path**       | A sequence of points in space that defines a route for objects to move along. |
| **Path3D**     | A 3D path for objects to follow in a game engine. |
| **Procedural Geometry** | Geometry dynamically generated through code, often used for creating environments or objects that change over time. |
| **Ragdolls**   | Physical structures used to simulate realistic movement of an articulated body. |
| **Static Body**| A non-moving object used for collisions or obstacles in a physics-based game engine. |
| **Texture**    | A file used to define the surface properties of 3D objects, including colors, patterns, and details. |
| **UI**         | User Interface, the set of visual elements that enable the user to interact with an application or game. |
| **Vehicle Body**| A physics body type specifically designed to simulate vehicles in a game engine. |
| **WIP**        | Work In Progress, indicating that something is not yet finalized or completed. |


## Client Requirements

### Objective :

The aim of the game is to educate players about environmental and climate issues. The game aims to raise players' awareness of ecological issues and make them understand the impact of their actions on the planet.

### Game Engine :

The game must be designed using the Godot Engine 4.3, relying on GDScript. 

### Game theme :

The central theme of the game is climat change, approached in a fun and educational way. 

### Game Quality :

The game must be well finished, respecting the principles of game design and development. Regular and rigorous testing throughout the development process is necessary to ensure a smooth and enjoyable gaming experience.
  
### Deliverable Requirements :

The final product must offer a pleasant and engaging experience for players. All essential elements must be included, the game must be bug-free for optimal playability and as full-featured as possible.

---


# Work Environement

## Github Conventions 

- We must use Github to manage our project.

### 1. Branch 

- Each branch should be named in English and given a clear, descriptive name to represent its purpose, ideally indicating the specific feature, issue, or task they address.

- Branches are used to isolate work on a specific feature, bug fix, or task without affecting the main codebase.

- By using branches, developers can experiment, make changes, and test code independently before integrating it with the main branch.


### 2. Commit 

- Each commit should be named in English and carry a descriptive title to clarify its purpose.
  
- Frequent commits are encouraged to provide a detailed record of all changes.
  
- Work-in-progress (WIP) code can be committed, provided it is not merged into the main branch. Multiple commits within a single branch are acceptable to document progressive updates.

### 3. Pull Request 

- Pull requests must have a clear, descriptive title in English, accurately reflecting the changes.
  
- A pull request requires approval from at least two other team members before it is merged.
  
- The author or a designated project manager should be responsible for merging the pull request.
  
- A detailed summary of the changes made should accompany each pull request for reference.

### 4. Issue 

- Each issue should have an informative and specific title in English.
- Issues should be assigned to a responsible team member for resolution.
- Include a clear, concise description of the issue to outline the problem (see [Issues](https://github.com/algosup/2024-2025-project-2-serious-game-team-1/issues)).


## Code Conventions

### Naming 

It is important to establish a naming convention for projects. This makes the source code easier to read and understand with less effort. For this project, we will use the following convention namings :


| Naming Context | Naming Convention |
|----------------|-------------------|
| InputMap       | `flatcase`        |
| Autoload       | `PascalCase`      |
| function       | `camel_Snake_case`|
| variable       | `kebab-case`      |
| groups         | `camelCase`       |
| folder         | `Train-Case`      |
| files          | `snake_case`      |


### Comments

- Use comments to explain the code

- The comments should be placed before the code they explain.

- Use comments to explain the purpose of the code, not the code itself.

- Use comments when declaring a variable or a parameter to explain its purpose and its value.

- For each function, explain which paramters it takes and which output it returns as well as its global behavior.

- In Godot comments are available by adding `#` in front of the line.

### Repository architecture

```txt

📦2024-2025-project-2-serious-game-team-1
└── 📁Documents
|    └── 📁 Management
|    |   └── 📝 project_charter.md
|    |   └── 📁 Images
|    └── 📝 technical_specifications.md
|    └── 📝 functional-specifications.md
|    └── 📝 test_plan.md
|    └── 📝 test_case.md
|    └── 📁 images
└── 📁Source
|    └── 📁 assets
|    |   └── 📁 characters
|    |   |   └── 📁 player
|    |   |   └── 📁 pnj
|    |   |   └── 📁 animals
|    |   └── 📁 sounds
|    |   └── 📁 fonts
|    |   └── 📁 music
|    |   └── 📁 texture
|    |   └── 📁 object
|    |   └── 📁 dialogue
|    └── 📁 interfaces
|    └── 📁 scripts
|    └── 📝 main
└── 📄 .gitignore
└── 📝 README.MD 
```

## Source Folder

The "Source" folder contains all the game code in the form of files and folders.

###  Assets 

This folder contains all the graphics resources and 3D models used in the game, which are essential for the game's functionality and aesthetics.

#### Characters

This folder contains all the graphics and animations for the game's characters, whether playable or not.

#### Sounds

This folder contains all the sound effects used in the game, such as sounds for specific actions such as collisions or player interactions and actions.

#### Fonts

This folder contains all the fonts used in the game, including user interface display fonts, in-game text fonts and any other design elements involving typography.

#### Music

This folder contains all the music tracks used in the game, including background music, ambient sounds and any other tracks that accompany gameplay.

#### Texture

This folder contains all the textures and images used in the game. This includes background textures, character sprites, user interface elements, and any other visual elements needed to make the game look good.

#### Object

This folder contains all the interactive and visual objects in the game, including those that the player can interact with and the scenery elements.

#### Dialogue 

This folder contains all the dialogue used in the game, including text files for character conversations. It organises all the content for interactions with NPCs and mission instructions.

### Script

This folder stores all the main scripts needed to make the game work. This includes gameplay logic, player controls and all the essential functions for managing the player's interaction with the game.

### Interfaces

This folder contains all the files relating to the game's user interfaces and the way in which players interact visually with the game.


## System : 

#### Desktop or laptop PC - Recommended [(More here)](https://docs.godotengine.org/en/stable/about/system_requirements.html#id3 "Permalink to this headline")

To edit and export to Godot Engine we need a desktop or laptop computer with the following minimum power : 


| | |
| :- | :- |
| **CPU**              | - _Example: Intel Core i5-6600K, AMD Ryzen 5 1600, Apple M1_, Raspberry Pi 5 with overclocking |
| **GPU**              | - _Example: NVIDIA GeForce GTX 1050, AMD Radeon RX 460|
| **RAM**              | - **For native exports:** 4 GB  <br>  <br>- **For web exports:** 8 GB  |
| **Storage**          | -  ~1GB (used for the executable, project files and cache)|
| **Operating system** | - **For native exports:** Windows 10, macOS 10.15, Linux distribution released after 2020   <br> <br>- **For web exports:** Latest version of Firefox, Chrome, Edge, Safari, Opera |
| | |

---

# Introduction to GODOT

## About Godot Engine 

Godot Engine is a free, open-source game engine for creating 2D and 3D games. 
It offers comprehensive tools to facilitate development, and can be easily exported to multiple platforms (computers, mobiles, web, consoles). 

Entirely licensed by MIT, it gives developers a great deal of freedom and control over their creations. 
A library of asserts is also included in the software.

### Node

A Node is the basic unit in Godot. It's an entity that has a set of properties and specific functionalities, like displaying an image, playing a sound, or handling a collision area. There are different types of nodes, each with distinct roles:

- Node2D and Node3D for 2D and 3D objects,
- Sprite to display an image,
- Area2D to handle collision detection areas,
- AudioStreamPlayer to play sound, etc.

Nodes can be organized in a hierarchical structure as children of other nodes, creating a tree structure. This parent-child system allows child nodes to "inherit" certain behaviors from their parents, like position in space or visibility.

## Scene

A Scene is a group of nodes organized to create a functional game element, such as a character, a user interface, or a complete level. A scene can contain multiple nodes, arranged in a hierarchy to form a logical structure. The advantage of this system is that each scene can be reused, combined with others, or instantiated multiple times to create repetitive or modular elements in the game.

For example, we can create:

- a scene for a level,
- a scene for a player character (with nodes for the sprite, animations, collisions, etc.),
- a scene for the user interface (UI).
Each scene can be saved as a file and imported into other scenes. This system makes development modular and allows us to work on individual elements of the game without affecting the entire project.



## 3D

Godot Engine can create both 2D and 3D games. This flexibility is one of its standout features, as it allows developers to use a single tool to create a wide range of game experiences, from pixel art platformers to immersive 3D worlds. 


### 3D tools 

- Built-in meshes: cube, cylinder, cone, sphere, prism, plane, quad, torus, ribbon, tube.

- GridMaps for 3D tile-based level design.

- Constructive solid geometry (intended for prototyping).

- Tools for procedural geometry generation.

- Path3D node to represent a path in 3D space.

- Can be drawn in the editor or generated procedurally.

- PathFollow3D node to make nodes follow a Path3D.

### 3D geometry helper class.

Support for exporting the current scene as a glTF 2.0 file, both from the editor and at run-time from an exported project.

### 3D physics

#### Physics bodies:

- Static bodies.

- Animatable bodies (for objects moving only by script or animation, such as doors and platforms).

- Rigid bodies.

- Character bodies.

- Vehicle bodies (intended for arcade physics, not simulation).

- Joints.

- Soft bodies.

- Ragdolls.

- Areas to detect bodies entering or leaving it.

#### Collision detection:

- Built-in shapes: sphere, capsule, cylinder,...

- Generate triangle collision shapes for any mesh from the editor.

- Generate one or several convex collision shapes for any mesh from the editor.


## Scripting


### GDScript:

GDScript is a high-level, object-oriented programming language designed for Godot. It uses a syntax based on indentation, similar to languages such as Python. Its purpose is to be optimised and tightly integrated with Godot Engine, allowing great flexibility for content creation and integration.

GDScript is entirely independent of Python and is not based on it.

Example : 

```txt
func _ready():
	print("Hello world!")
```

#### Methods

In GDScript, methods are functions that belong to a class. They are used to define actions that an object can perform. Methods can be used to manipulate data, interact with other objects, or perform calculations.

Example :

```
func my_method():
  var my_array = [1, 2, 3, 4, 5]
  var array_length = len(my_array)
    print("Length of the array: ", array_length)  # Display "5"
```

Here are a few methods that can be used in Godot, you can see more [here](https://docs.godotengine.org/en/stable/classes/class_@gdscript.html) :


| **Type**  | **Method**  | 
|-----------|-------------|
| **[Color](https://docs.godotengine.org/en/stable/classes/class_color.html)** | - [Color8(r8: int, g8: int, b8: int, a8: int = 255)](https://docs.godotengine.org/en/stable/classes/class_@gdscript.html#class-gdscript-method-color8) |
| **[String](https://docs.godotengine.org/en/stable/classes/class_string.html)** | - [char(char: int)](https://docs.godotengine.org/en/stable/classes/class_@gdscript.html#class-gdscript-method-char) |
| **[Variant](https://docs.godotengine.org/en/stable/classes/class_variant.html)** | - [convert(what: Variant, type: int)](https://docs.godotengine.org/en/stable/classes/class_@gdscript.html#class-gdscript-method-convert) |
| **[Object](https://docs.godotengine.org/en/stable/classes/class_object.html)** | - [dict_to_inst(dictionary: Dictionary)](https://docs.godotengine.org/en/stable/classes/class_@gdscript.html#class-gdscript-method-dict-to-inst) |
| **[Dictionary](https://docs.godotengine.org/en/stable/classes/class_dictionary.html)** | - [inst_to_dict(instance: Object)](https://docs.godotengine.org/en/stable/classes/class_@gdscript.html#class-gdscript-method-inst-to-dict) |
| **[Boolean](https://docs.godotengine.org/en/stable/classes/class_bool.html)** | - [is_instance_of(value: Variant, type: Variant)](https://docs.godotengine.org/en/stable/classes/class_@gdscript.html#class-gdscript-method-is-instance-of) |
| **[Integer](https://docs.godotengine.org/en/stable/classes/class_int.html)** | - [len(var: Variant)](https://docs.godotengine.org/en/stable/classes/class_@gdscript.html#class-gdscript-method-len) |
| **[Resource](https://docs.godotengine.org/en/stable/classes/class_resource.html)** | - [load(path: String)](https://docs.godotengine.org/en/stable/classes/class_@gdscript.html#class-gdscript-method-load) |
| **[Resource](https://docs.godotengine.org/en/stable/classes/class_resource.html)** | - [preload(path: String)](https://docs.godotengine.org/en/stable/classes/class_@gdscript.html#class-gdscript-method-preload) |
| **[Void](https://docs.godotengine.org/en/stable/classes/class_void.html)** | - [print_debug(...) vararg](https://docs.godotengine.org/en/stable/classes/class_@gdscript.html#class-gdscript-method-print-debug) |
| **[Void](https://docs.godotengine.org/en/stable/classes/class_void.html)** | - [print_stack()](https://docs.godotengine.org/en/stable/classes/class_@gdscript.html#class-gdscript-method-print-stack) |
| **[Array](https://docs.godotengine.org/en/stable/classes/class_array.html)** | - [range(...) vararg](https://docs.godotengine.org/en/stable/classes/class_@gdscript.html#class-gdscript-method-range) |
| **[Boolean](https://docs.godotengine.org/en/stable/classes/class_bool.html)** | - [type_exists(type: StringName)](https://docs.godotengine.org/en/stable/classes/class_@gdscript.html#class-gdscript-method-type-exists)|

#### Annotations

Annotations in Godot allow to enhance the functionality of your scripts by exposing properties to the editor, managing initialization, or customizing class behaviors. Here's a table summarizing the key annotations :

| **Annotation**      | **Description**  |
|---------------------|------------------|
| `@export` | Makes a property visible and editable in the Inspector. |
| `@export_range` | Constrains a property's value to a specific range. |
| `@export_file` | Allows selecting a specific file type in the Inspector. |
| `@export_enum` | Lets you select from a predefined list of options. |
| `@onready`| Initializes a variable after the node is ready. |
| `@tool` | Enables the script to run in the editor (active outside of gameplay). |
| `@class_name` | Assigns a custom name to the class, making it reusable as a new resource. |
| `@signal`  | Declares a signal the script can emit. |
| `@gadget`  | Used for creating custom tools for the editor (advanced use). |
| `@position` | Defines the order of appearance in the Inspector (with GDScript 2.0). |
| `@global_class`| Similar to `@class_name`, but makes the class globally accessible. |
| `@export_group` | Groups properties under a header in the Inspector.  |
| `@export_subgroup`| Creates subsections under a grouped property in the Inspector. |



---

# Development Steps

## 1. Environement setup

- Initialization in Godot : Create the basic scenes, configure the FPS controls.

### Godot architecture 

To get started, we need to create a set of nodes. They are the basic building blocks of the game in Godot, and their hierarchical organisation allows us to create a complex project in a simple and modular way.

So we need to create all the nodes needed for the game: a main node that will host the game, sub-nodes that will classify all the nodes, and finally nodes such as the game inventory.

![alt text](./images/node_architecture1.png)


### Perspective

The game is in 3D, because we felt it was better suited to our case and our atmosphere. This will allow greater flexibility in the creation of interactive and dynamic game elements. We will therefore use a 3D node and work in 3 dimensions for all the animations, and in 2D for the interface.   

### Game aspects

#### Movements

The following movements will be included in the game:

To assign keys, it's simple in Godot, we need to in the general panel go to Project -> Project Settings -> Input Map. 

Then all we have to do is add your keys and link them to their actions.

![alt text](./images/Godot_key.png)

Players can move in four directions (up, down, left, right), jump and sprint using the following key combinations:

| Key     | Direction |
| --------| --------- |
| `w`     | Forward   |
| `S`     | Backward  |
| `A`     | Left      |
| `D`     | Right     |
| `Space` | Jump      |
| `Shift` | Sprint    |


## 2. Development of the Map 

- Zone : Model each zone (town, beach), delimit zone, add textures and assets.

### Map Foundation

First of all, to create the map we need to add the foundations, the base. The 3D terrain should include a raised area representing the mountain, a slope down to the water representing the beach and four other flatter areas representing the farm, the town, the forest and the port. 

To create the terrain we will use these videos in which all the characteristics for [the formation of the relief](https://www.youtube.com/watch?v=oV8c9alXVwU&t=68s), [the addition of water](https://www.youtube.com/watch?v=jYVO0-_sXZs&t=603s).


We need to use a node: 3D Terrain. Then use the tools to create the relief and the different areas of the map.

![alt text](./images/greenfield.png)

### Zone Texture

Each zone will have different textures to distinguish it from the others. We'll use the textures available [here](https://ambientcg.com/). To use them in godot, import them and then go to the middle panel, then 3D Terrain and finally Texture.


![alt text](./images/texture.png)

### Zone Delimitation

Each zone needs to be delimited as it will be necessary to reuse this later in the game. Indeed, quests and reputations will be assigned to each zone.To do this, you need to create nodes for each zone and delimit them.

A child node of type CollisionShape3D has been added to a specific node to define the shape of the zone. 

Next we need to configure the detection between zones in the player, which will be used later for queries.  

```
extends Area3D

func _on_body_entered(body):
    if body.name == "Player":
        print("Le joueur est entré dans la zone.")
        # Déclencher un événement ou une action

```


![alt text](./images/node_zone.png)

![alt text](./images/beach_area.png)

### Add Assets

Each zone will have different assets (farms, houses, trees, etc.). All assets come from the same [source](https://poly.pizza/u/Quaternius). Import them into the "assets" folder and place them in the zone you want. 

To simplify the positioning of assets, we can use an addon called: [Object Placer](https://github.com/Fleischkuechle/Godot-object-placer)



## 3. Game mechanics integration

- Create the User Interface, add the HUD (Quests, Mini-Map, Time,...).

### User Interface

#### Main Menu

A menu will be available, accessible by pressing the `esc` "escape" key. It will allow us to access all the settings (audio, graphics, keys, etc.), or quit the game.

To create the menu, we'll take inspiration from this video [this video](https://www.youtube.com/watch?v=Z8jcjy_jZyk).

We you need to add a Button node for each menu option. Next, we need to connect the pressed signal from the buttons to the menu script to execute the corresponding actions.

```
extends Control

func _on_StartButton_pressed():
    print("Start game")
    # Load the main game scene
    get_tree().change_scene("res://scenes/MainGame.tscn")

func _on_OptionsButton_pressed():
    print("Open options menu")
    # Display a submenu for options

func _on_QuitButton_pressed():
    print("Quit game")
    get_tree().quit()

```

#### Inventory

An inventory will keep track of all the player's items and allow them to navigate between the items in their bag by pressing the `e` key . A drag-and-drop system will be used to create this system.

To create the inventor, we'll take inspiration from this video : [inventory](https://www.youtube.com/watch?v=7RXm0-TSJMw&t=764s&pp=ygUSZ29kb3Qga2V5IGJpbmRpbmdz) and [drag&drop](https://www.youtube.com/watch?v=8cV-5ByZLOE)  in which we have all the characteristics.


![alt text](./images/Inventory_screen.png)


#### HUD

From the main game screen, players can access a range of information : 


##### Mini Maps

A mini-map will be displayed in the top right-hand corner of the screen to help players find their way around.

To create the mini The mini maps consist of creating another point of life for the player, but from above. 

First of all we need to add a Camera3D node dedicated to the mini-map in our scene, then we just need to configure it the way we want and add the visual features.

##### Time

The time will be displayed below the mini-map, allowing the player to keep track of the time.
  
The timer will be based on a clock of 24 minutes equivalent to 24 hours and will represent the real life cycle.

```
extends Node

# Variables for the clock
var hours = 0        # Initial hours (0-23)
var minutes = 0      # Initial minutes (0-59)
var seconds = 0      # Seconds (optional)

const GAME_SECONDS_PER_REAL_SECOND = 60  # 1 real-world second = 1 in-game minute

var elapsed_time = 0.0  # Time elapsed since the start

func _process(delta):
    # Add the elapsed time
    elapsed_time += delta * GAME_SECONDS_PER_REAL_SECOND

    # Convert to hours, minutes, and seconds
    seconds = int(elapsed_time) % 60
    minutes = int(elapsed_time / 60) % 60
    hours = int(elapsed_time / 3600) % 24

    # Debug print to display the time
    print("Clock: %02d:%02d:%02d" % [hours, minutes, seconds])

```
##### Reputation

A progress bar showing the reputation of the location the player is in will be placed at the top left.

Reputation increases as the player completes quests. It also decreases with inactivity.

| **Reputation Gain** | **Reputation Loss** (per period of inactivity) | **Inactivity period before loss** | **Max Reputation** | **Min Reputation** |
|----|-----|--------------|-----|---|
| +2 | -1  | 120 seconds  | 100 | 0 |

  
##### Quests Panel 

A list of quests will be placed below the player to inform them of the actions to be carried out.

We need to create a quest dictionary where all the names and actions are listed for each quest. 

![alt text](./images/Quest_scheme.png)

```
extends Panel

onready var quest_container = $VBoxContainer

var quests = []  # List of quests

func _ready():
    load_quests()
    display_quests()

func load_quests():
    # Load quests from a JSON file or another source
    var file = File.new()
    if file.open("res://quests.json", File.READ) == OK:
        quests = JSON.parse(file.get_as_text()).result
        file.close()

func display_quests():
    # Clear existing quests in the UI
    quest_container.clear_children()
    
    # Add each quest to the list
    for quest in quests:
        var quest_label = Label.new()
        quest_label.text = "[b]" + quest["title"] + "[/b]\n" + quest["description"]
        quest_label.bbcode_enabled = true
        quest_container.add_child(quest_label)

# Add a quest (to be called when the player accepts a new quest)
func add_quest(title, description):
    quests.append({"title": title, "description": description})
    display_quests()

# Mark a quest as completed
func complete_quest(title):
    quests = quests.filter(func(q): return q.title != title)
    display_quests()
```

## 4. Others features 

- Add interaction between quests and the player,  all audio and dialogue. 

### Audio 

Audio is essential to the game's appeal, whether as background sounds or in connection with interactions.

Then we can mix the audio using a control panel in the middle of the main Godot interface and select "Audio".

![alt text](./images/Audio_panel.png)

Finally we can play the sound as follows : 

```
var sound = preload("res://sounds/your_sound.ogg")
$AudioStreamPlayer.stream = sound

```


### Dialogue

Dialogue is important for creating more immersion for players. 


First of all, we need to add a new node to house all the dialogue. Then we can use an addon available from the ‘AssetLib’ in Godot : "dialogue_node". 

Finally, we can set the dialogues as follows : 

![alt text](./images/example_dialogue.png)

### Interaction Quest & Player

We then need to include the interaction between the quests and the player, and we'll use [this video](https://www.youtube.com/watch?v=QKdyUBjzPmk) as inspiration for our code. 

So we have the following example, which represents a class of interactive objects with a customisable prompt message, displaying the key assigned to the interaction. When an object interacts, a message identifying the two parties is printed.


```GDScript
extends CollisionObject3D
class_name Interactable
@export var prompt_message = "Interact"
func get_prompt():
	var key_name = " "
	for action in InputMap.action_get_events("interaction"):
		if action is InputEventKey:
			key_name = action.as_text_physical_keycode()
			break
			
	return prompt_message + "\n[" + key_name + "]"
func interact(body):
	print(body.name, " interacted with ", name)
```



## 5. Gameplay testing 

- Debugging : Fix bugs and improve game stability.

To resolve problems and bugs, we can use Godot's terminal. The terminal displays debugging logs, which can help us spot errors or unexpected behaviour in your game. It also displays syntax errors, warnings and other useful information during development.

![alt text](./images/terminal_godot.png)


## 6. Final phase and launch

- Export : Bring the game to life by creating its executable file.

Once the game is finished, it's time to export it. 

First we need to add the export templates for our version of Godot. You can download them directly from the Godot interface: Go to Editor -> Manage Export Templates.
Click on Download and Install.

Then we need to go to the menu: Project -> Export -> Add (choose the platform we want to use here Windows Desktop or macOS), add all the necessary parameters and finally export the project.

![alt text](./images/export.png)
![alt text](./images/export_2.png)

---





