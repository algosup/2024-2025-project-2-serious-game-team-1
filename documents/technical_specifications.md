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

### *Last Update on November 22th, 2024*

![alt text](./images/Godot_Logo-1.png)

<details>

<summary><h3> Table of Contents </h3></summary>

- [**Technical Specifications - 2024-2025-project-2-serious-game-team-1**](#technical-specifications---2024-2025-project-2-serious-game-team-1)
    - [*Last Update on November 22th, 2024*](#last-update-on-november-22th-2024)
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
- [Technical Sources](#technical-sources)
  - [Godot Engine](#godot-engine)
  - [Visual Studio](#visual-studio)
  - [Git](#git)
  - [3D Asserts Website](#3d-asserts-website)
  - [Sound bank](#sound-bank)
- [Development Steps](#development-steps)
  - [1. Environement setup](#1-environement-setup)
  - [2. Development of the Map](#2-development-of-the-map)
  - [3. Game mechanics integration](#3-game-mechanics-integration)
  - [4. Gameplay Testing and Balancing](#4-gameplay-testing-and-balancing)
  - [5. Optimisation and Correction](#5-optimisation-and-correction)
  - [6. Implementing Educational and Narrative System](#6-implementing-educational-and-narrative-system)
  - [7. Final Phase and Launch](#7-final-phase-and-launch)
- [Game Aspects](#game-aspects)
  - [Perspective](#perspective)
  - [User Interface](#user-interface)
    - [Main Menu](#main-menu)
    - [Inventory](#inventory)
    - [HUD](#hud)
  - [Commands](#commands)
    - [Movement](#movement)
    - [Teleportation](#teleportation)
    - [Vehicules](#vehicules)


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
| **Animation**  | A file used to define the movement of 3D objects in Unreal Engine |
| **Asset**      | A file that can be imported into Godot Engine |
| **Dialogue**   | Text that appears on the screen |
| **FPS**        | First-person View |
| **Game Engine**| A Game Engine is software that provides the tools needed to create video games, such as graphics, physics, audio, and interaction management |
| **GitHub**     | A version control system |
| **HUD**        | Heads-Up Display, a graphical interface that displays essential information to the player in real time, such as health, score, resources... |
| **MIT**        | The MIT licence is a permissive open-source licence that allows developers to use, copy, modify, and distribute the software, even in commercial projects, without paying royalties |
| **Lore**       | A story that is not directly related to the gameplay |
| **NPC**        | Non-Playable Character |
| **Path**       | A path is a sequence of points in space that defines a route for objects to move along |
| **Path3D**     | A Path3D defines a 3D path for objects to follow.|
| **Ragdolls**   | A Physical structures used to simulate the realistic movement of an articulated body |
| **Texture**    | A file used to define the surface properties of 3D objects in Unreal Engine |
| **UI**         | A User Interface is the set of visual elements that enable the user to interact with an application or game |
| **WIP**        | Work In Progress |
| **.glTF**        | The .glTF format is an open, standardised file format designed for the efficient and compact exchange of 3D models |



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


### Script

This folder stores all the main scripts needed to make the game work. This includes gameplay logic, player controls and all the essential functions for managing the player's interaction with the game.

### Interfaces

This folder contains all the files relating to the game's user interfaces and the way in which players interact visually with the game.


## System : 

#### Desktop or laptop PC - Recommended [(More here)](https://docs.godotengine.org/en/stable/about/system_requirements.html#id3 "Permalink to this headline")

To edit and export to Godot Engine you need a desktop or laptop computer with the following minimum power : 


| **CPU**              | - _Example: Intel Core i5-6600K, AMD Ryzen 5 1600, Apple M1_, Raspberry Pi 5 with overclocking |
| -------------------- | ------------------------|
| **GPU**              | - _Example: NVIDIA GeForce GTX 1050 (Pascal), AMD Radeon RX 460 (GCN 4.0)_ <br>|
| **RAM**              | - **For native exports:** 4 GB  <br>  <br>- **For web exports:** 8 GB  |
| **Storage**          | -  ~1GB (used for the executable, project files and cache)|
| **Operating system** | - **For native exports:** Windows 10, macOS 10.15, Linux distribution released after 2020   <br> <br>- **For web exports:** Latest version of Firefox, Chrome, Edge, Safari, Opera |

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

For example, you can create:

- a scene for a level,
- a scene for a player character (with nodes for the sprite, animations, collisions, etc.),
- a scene for the user interface (UI).
Each scene can be saved as a file and imported into other scenes. This system makes development modular and allows you to work on individual elements of the game without affecting the entire project.



## 3D

Godot Engine can create both 2D and 3D games. This flexibility is one of its standout features, as it allows developers to use a single tool to create a wide range of game experiences, from pixel art platformers to immersive 3D worlds. 

| **Aspect** | **2D (Godot)**   | **3D (Godot)** |
|------------|------------------|----------------|
|**Advantages**          | | |
| Simplicity  | - Easier to learn, especially for beginners  | - Enables complex mechanics thanks to depth and perspective                     
| Performance | - Less resource-intensive, ideal for lightweight projects  | - Optimized with Vulkan to handle complex environments  |
| Development Time | - Faster development with dedicated tools (e.g., TileMap, AnimationTree 2D) | - Flexible node system for managing 3D objects, lighting, and cameras  |
| Immersion  | - Sufficient for traditional or stylized gameplay | - Offers realistic immersion with dynamic perspectives |
| Art Style Flexibility | - Perfect for minimalist or retro styles (pixel art, flat design, etc.)  | - Supports realistic or stylized 3D visuals |
| Specific Tools  | - Rich library for handling 2D collisions and animations  | - Compatible with standard 3D assets (.glTF, .obj), advanced shaders  |
| Community & Resources | - Wide range of resources to quickly create 2D games | - Growing library of resources and assets for 3D, especially with Godot 4 |
|  **Disadvantages**    | | |
| Artistic Limitations  | - Less immersive than a 3D environment  | - Requires knowledge of 3D modeling and texturing  |
| Gameplay Limitations  | - Poorly suited for games requiring depth or complex navigation | - Complex gameplay can significantly increase development time |
| Performance | - Can struggle with highly animation-rich or interactive scenes  | - More resource-intensive, requiring rigorous optimization  |
| Development Time | - May lack potential for highly ambitious concepts  | - Longer creation and iteration cycles, especially for 3D assets |
| Learning Curve | - More accessible for beginners | - Steeper learning curve to master 3D tools and workflows |
| Bugs & Limitations | - Limited for complex simulations requiring multiple dimensions | - 3D performance in Godot is still less optimized than engines like Unreal or Unity  |


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

- High-level interpreted language.

- Syntax inspired by Python. However, GDScript is not based on Python.

Example : 

```txt
func _ready():
	print("Hello world!")
```

### Methods

In GDScript, methods are functions that belong to a class. They are used to define actions that an object can perform. Methods can be used to manipulate data, interact with other objects, or perform calculations.

Example :

```
func my_method():
  var my_array = [1, 2, 3, 4, 5]
  var array_length = len(my_array)
    print("Length of the array: ", array_length)  # Display "5"
```

The methods that can be used in Godot :


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

---

# Technical Sources


## Godot Engine 

We will use Godot Engine 4.3 It is available [here](https://godotengine.org/download/windows/).

## Visual Studio

We will use Visual Studio 2019. It is available [here](https://visualstudio.microsoft.com/fr/downloads/).

## Git

We will use Git combined with GitHub Desktop. It is available [here](https://desktop.github.com/).

## 3D Asserts Website

We will use Itch.io and Poly Pizza, to get free assets. They are available [Itch.io](https://itch.io/) and [Poly Pizza](https://poly.pizza/).

## Sound bank

We will use Universal Soundbank and Zapsplat, to get free and royalty-free sounds. They are available [Universal Soundbank](https://universal-soundbank.com/) and [Zapsplat](https://www.zapsplat.com/).

---

# Development Steps

## 1. Environement setup

- Initialization in Godot : Create the basic scenes, configure the FPS controls.
- Backup Systems : Program the progress backup systems;

## 2. Development of the Map 

- Zone : Model each zone (e.g. town, beach), integrating interactive elements specific to each environment.

## 3. Game mechanics integration

- Action mechanics : Program actions between quests and players.
- Quests and Objectives System : Integrate a quest manager to track and display tasks in real time.

## 4. Gameplay Testing and Balancing

- Testing : Check the fluidity of the game, test basic interactions and the task system.
- User feedback : Gather feedback from testers on the understanding and difficulty of the educational tasks.
- Balancing : Adjust the difficulty of the quests.

## 5. Optimisation and Correction 

- Performance : Optimise graphics, physics and interactions to ensure optimum fluidity.
- Debugging : Fix bugs and improve game stability.


## 6. Implementing Educational and Narrative System 

- Learning Scenarios : Add relevant educational information integrated into the tasks.
- Dynamic Storytelling : Include narrative elements such as dialogues or significant events to reinforce the message of the game.

## 7. Final Phase and Launch

- Testing : Carry out wider tests with a target audience to finalise adjustments.
- Launch : Put the game online and monitor feedback for post-launch updates.

---

# Game Aspects

## Perspective

The game is in 3D, as we felt it was better suited to our case and our atmosphere. This will allow greater flexibility in creating interactive and dynamic game elements.

## User Interface

### Main Menu

A menu will be available, accessible by pressing the `esc` "escape" key. It will allow you to access all the settings (audio, graphics, keys, etc.), or quit the game.

### Inventory

An inventory will keep track of all the player's items and allow them to navigate between the items in their bag by pressing the `e` key . A drag-and-drop system will be used to create this system.

### HUD

From the main game screen, players can access a range of information : 

- Maps : a mini-map will be displayed in the top right-hand corner of the screen to help players find their way around.
- Time : the time will be displayed below the mini-map, allowing the player to keep track of the time.
- Control : the control description will be placed at the bottom left of the screen, giving players quick access to the buttons they can use.
- Reputation : A progress bar showing the reputation of the location the player is in will be placed at the top left.
- Quests : A list of quests will be placed below the player to inform them of the actions to be carried out.


## Commands

The following mechanisms will be included in the game:

To assign keys, it's simple in Godot, you need to in the general panel go to Project -> Project Settings -> Input Map. 

Then all you have to do is add your keys and link them to their actions.

![alt text](./images/Godot_key.png)

### Movement

Players can move in four directions (up, down, left, right), jump and sprint using the following key combinations:

| Key     | Direction |
| --------| --------- |
| `Z`     | Forward   |
| `S`     | Backward  |
| `Q`     | Left      |
| `D`     | Right     |
| `Space` | Jump      |
| `Shift` | Sprint    |

### Teleportation

The player can teleport around the island. This action will change the player's position  using the following key :
| Key | Action    |
| --- | ----------|
| XXX | Teleportation |


The teleport action temporarily disables the player's movement for as long as this function is used.


### Vehicules

The player can enter a vehicle and drive it. Once inside, they can move the vehicle in four directions using the same keys as for basic movement:

| Key | Action            |
| --- | ------------------|
| `F`   | Enter/Exit Vehicle |

When inside the vehicle, the player's standard movement controls are disabled until they exit/enter the vehicle using the `F`  key.

---