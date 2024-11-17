# Functional Specification

![-](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

<details>
<summary>📖 Table of content</summary>

- [Functional Specification](#functional-specification)
  - [I. Document](#i-document)
    - [A. Information](#a-information)
    - [B. History](#b-history)
    - [C. Documents](#c-documents)
  - [II. Project Overview](#ii-project-overview)
    - [A. Purpose](#a-purpose)
    - [B. What is a Serious Game](#b-what-is-a-serious-game)
  - [III. Requirements](#iii-requirements)
    - [A. Story](#a-story)
    - [B. Prototype features](#b-prototype-features)
    - [C. Optional features](#c-optional-features)
  - [IV. Product](#iv-product)
    - [A. Game Mechanic](#a-game-mechanic)
      - [1. Movements](#1-movements)
      - [2. Inventory](#2-inventory)
      - [3. Quests/Reputation](#3-questsreputation)
      - [4. Teleportation](#4-teleportation)
      - [5. Map](#5-map)
    - [B. Interface](#b-interface)
    - [C. Personas and Scenarios](#c-personas-and-scenarios)
      - [1. Sarah](#1-sarah)
      - [2. Carl](#2-carl)
    - [D. Assumptions and Constraints](#d-assumptions-and-constraints)
    - [E. Non-functional Requierements](#e-non-functional-requierements)
      - [1. cost](#1-cost)
        - [a. Assets](#a-assets)
        - [b. Time developement](#b-time-developement)
      - [2. Environment](#2-environment)
      - [3. Security](#3-security)
  - [V. Risk](#v-risk)
    - [A. Competitors](#a-competitors)
    - [B. Product problem](#b-product-problem)
    - [C. Data](#c-data)
  - [Deadlines](#deadlines)
  - [Glossary](#glossary)

</details>

![-](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

## I. Document

### A. Information

| Author | Grégory PAGNOUX |
| - | - |
| Creation date | 11/07/2024 |
| Last Modification | 11/13/2024 |
| Reviewer(s) | Léna DE GERMAIN |
| Last review | 11/../2024 |

### B. History

| Version | Edits completed by | Date | Description of edit |
| - | - | - | - |
| 01.1 | Grégory PAGNOUX | 11/07/2024 | Create template, [ProjectOverview](#ii-project-overview), [Deadlines](#deadlines) |
| 01.2 | Grégory PAGNOUX | 11/12/2024 | [Requirements](#iii-requirements), [Time developement](#b-time-developement), [Environment](#2-environment), [Glossary](#glossary) |
| 01.3 | Grégory PAGNOUX | 11/13/2024 | [Security](#3-security), [Risk](#v-risk), [Glossary](#glossary) |

### C. Documents

During the brainstorming phase, we split researches between us and the table with results is below:

[Research table](https://docs.google.com/spreadsheets/d/18TqcBMzp2aJckCZGYooOq7OQtThMyXTudi9O38hkBC4/edit?usp=sharing)

You can find the One-sheet document below:

[One-sheet](https://docs.google.com/document/d/153vc26EhVamXTxfOmKHst1HX5ckaABPQhl9MGn1WX2Y/edit?tab=t.0)

## II. Project Overview

<center>

![img](./img/)

</center>

### A. Purpose

The project was commissioned by ALGOSUP to create a "Serious Game" on the theme of global warming. The aim is to talk about the causes and solutions for combating this current phenomenon, which is having an ever-increasing impact on us.

### B. What is a Serious Game

A serious game (video game or board game) is the lovely match between serious, educational content and video game's mechanics and storytelling. It's a tool incredibly efficient at communicating educational messages in an interactive, engaging and federating way.

The term of "serious game" is used since the beginning of the twentieth century, and the best-known game is The Landlord's Game (predecessor of Monopoly) in 1903.

In the early 1990s, a number of games on this theme were released, followed by another spike to over 100 games a year and a third in 2007 with over 200 games.
These spikes are due to a growing awareness of the climate emergency, and there are no fewer than 2,000 different games on the subject.

Serious games are commonly used to educate, raise awareness and develop critical thinking and problem-solving skills, as well as for therapeutic purposes.

sources :

- [Wikipedia](https://en.wikipedia.org/wiki/Serious_game)
- [Collock](https://www.collock.com/en/serious-game/)
- [ResearchGate](https://www.researchgate.net/figure/Number-of-Serious-Games-released-each-year-2218-games_fig1_273693305#:~:text=As%20we%20consider%20that%202002,%25%20of%20our%20total%20...)

## III. Requirements

### A. Story

The player incarn a character named Bob. He has just bought an old house, but the the village mayor ordered him to make the house more environmentally friendly. How can he do that when he knows nothing about it?
You'll have to carry out missions all over the map to maintain the reputation of the spaces and improve your house. As you carry out your first tasks, you learn that a book that can solve all the world's problems is hiding in the house.
Will you find it?

### B. Prototype features

To create our serious game, we need to have some basics features that we must have for the prototype:

- ability to control character's movement (move forward, backward, left, right and jump)
- interactions with objects
- two differents biomes (village and beach)
- three quests per biomes
- reputation for each biome
- inventory with drag and drop system

**Village**

The village has some houses and building where you can find the town hall, the library, a shop and the museum.
The quests that you can complete on this place are:

- collecting rubbish
- sorting waste
- learn some technics and new things on ecology
- measure air quality

**Beach**

The beach is a part of the map where you can walk and swim to clean up, and protect the ocean life.
The quests that you can complete on this place are:

- collecting rubbish
- restoring coral reefs
- protecting marine wildlife

### C. Optional features

Here are all optional features that we can find in the game after the prototype phase:

- teleportation between two spaces
- add biomes (forest, fields, mountain)
- add quests (until 10 per biomes)
- the main house of the player (in the city)
- the story
- add bike to move on the map
- NPCs[^1]

**Forest**

The forest is a place where you can find animals and some location where human leave his footprint.
Some quests that you can complete on this place are:

- collecting rubbish
- CO2 report
- return the animals to their living area
- preventing fire
- plant trees

**Fields**

There is a farm in the fields where you can help the farmer to cultivate, and take care about important natural ressources.
The quests that you can complete on this place are:

- Helping planting depending the season
- water filtration
- composting

**Mountain**

The mountain is a great spot to work on projects that help the environment, like using clean energy and protecting the land.
The quests that you can complete on this place are:

- renewable energy (solar or wind turbine)
- study glaciers
- measure air quality

## IV. Product

### A. Game Mechanic

#### 1. Movements

*description*

![movements flow chart](./img/)

#### 2. Inventory

*description*

![interactions flow chart](./img/)

#### 3. Quests/Reputation

*description*

![quests/reputation flow chart](./img/)

#### 4. Teleportation

*description*

![teleportation flow chart](./img/)

#### 5. Map

*description*

![ flow chart](./img/)

### B. Interface



### C. Personas and Scenarios

#### 1. Sarah

*general description (physique and moral)*

![Sarah's persona](./img/)

*role play*

*conclusion*

#### 2. Carl

*general description (physique and moral)*

![Carl's persona](./img/)

*role play*

*conclusion*

### D. Assumptions and Constraints



### E. Non-functional Requierements

#### 1. cost

##### a. Assets

| ASSETS | PRICE | PROTOTYPE | FINAL GAME |
| :-: | :-: | :-: | :-: |
| ... | 0€ | Yes | Yes |

##### b. Time developement

We have 61 hours and 45 minutes dedicated to develop the game.
This amount of time don't take in consideration any overtime that members can do during the project.

#### 2. Environment

- Visual Studio Code on documents
- Godot on development
- MacOS and Windows on development

#### 3. Security

- respect GDPR[^2] and data saving law
- ensure the integrity[^3] of the information given to the player about climate change

## V. Risk

### A. Competitors

Today, serious games cover a lot of subjects and have a lot of competitors.
For our game, there are two other games that partially cover the subject we're talking about and that could be potential indirect competitors.
The first one is Esperide and the second one is Nuage.

**Esperide**

You embody a forester, and you have one mission, save french forest by taking decision and manage flora and fauna[^4].
This game is developped for the French Government and the ONF[^5] and has the Néo Terra label[^6].
The aim of this game is to experiment with different forest management methods adapted to tomorrow's climate and developing innovative awareness-raising tools to explain forest management to the general public.

Here you can find [Esperide](https://www.onf.fr/vivre-la-foret/%2B/12bd::entrez-au-coeur-des-enjeux-du-changement-climatique-et-sauvez-la-foret.html)

**Nuage**

Zeus is your name, you can control a city and help it to reduce the pollution, and become an utopic city where it's a good place to live.
This game is developped by Hakatah[^7] whose aim is to help people understand the phenomenon of climate change and raising awareness of its consequences.

Here you can find [Nuage](https://www.serious-game.fr/nuage-le-serious-game-sur-le-changement-climatique/)

### B. Product problem

We need to think about the problems our game may have, and the first thing to consider is the message it conveys. More specifically, the fact that the information we want to convey to the player is unclear or misunderstood could, in the worst case scenario, lead to an adaptation of behaviour that would go against the climate and the very idea of the game.
The second is if our game is too big to install or requires specific handling to install, many potential players will not launch the game and the impact will be reduced or even non-existent.
The third problem is that the risk of transmitting too much information through the game and therefore losing the educational and fun value of the game.

### C. Data

Our game doesn't need to save player's data, but if the game evolves and we need to save information, we need to interest us on the **the reglementation of data backups**.
There are three different archives depending on the type of data :

- **Active database archiving** where data that are no longer useful to the enterprise (for example, data on job seekers to which they have not followed up) are deleted once the reason for the study has been completed (after a maximum of two years).
- **Intermediate archiving** where data are saved even after the purpose of data collection has been achieved as they are still of interest to the enterprise. The duration is set by the person responsible and must be relevant to its usefulness.
- **Final archiving** where data that remains of great interest in the future without an end date are saved, after an upstream check.

source :

- [CNIL](https://www.cnil.fr/fr/reglement-europeen-protection-donnees)

## Deadlines

| PURPOSE | CONCERNED | DATE |
| - | - | - |
| Functional Specification | Grégory PAGNOUX | 22/11/2024 |
| Technical Specification | Robin GOUMY | 29/11/2024 |
| Test Plan | Léna DE GERMAIN | 06/12/2024 |
| Code | Mattéo LEFIN / Alexis SANTOS | 13/12/2024 |
| User Manual | Guillaume DESPAUX | 13/12/2024 |

![-](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)

## Glossary

[^1]: **NPC**
Abbreviation for Non-Playable Character. It's a character in a computer game that is not controlled by someone playing the game.
source : [Cambridge dictionnary](https://dictionary.cambridge.org/fr/dictionnaire/anglais/npc)

[^2]: **GDPR**
Abbreviation for General Data Protection Regulation. It's a European Union regulation adopted on 27 April 2016. It's the reference text for personal data protection. It strengthens and unifies data protection for individuals within the European Union.
source : [Wikipedia](https://fr.wikipedia.org/wiki/Règlement_général_sur_la_protection_des_données)

[^3]: **integrity**
The quality of being whole and complete. It's the fact that an information is certified as true and we can believe on it.
source : [Cambridge dictionnary](https://dictionary.cambridge.org/fr/dictionnaire/anglais/integrity)

[^4]: **flora and fauna**
The flora and fauna of a place are its plants and animals.
source : [Cambridge dictionnary](https://dictionary.cambridge.org/fr/dictionnaire/anglais/flora-and-fauna)

[^5]: **ONF**
Abbreviation for Office National des Forêts. The organisation was created in 1966 and has 5 fundamental missions: to develop wood resources, to act for the environment, to welcome the public to the forest, to prevent natural risks and to offer tailor-made services.
source : [ONF](https://www.onf.fr/onf/connaitre-lonf/+/28::les-enjeux-valeurs-et-missions-de-lonf.html)

[^6]: **Néo Terra label**
Néo Terra was created in 2019 to develop the environmental transition of the Nouvelle-Aquitaine. Their objective: to accelerate change and support the process. Their ambitions: natural resources, solidarity, agriculture and food, the economy, mobility and habitats, health.
source : [Néo Terra](https://www.neo-terra.fr/quest-ce-que-neo-terra/)

[^7]: **Hakatah**
Hakatah is a collective of video game designers committed to global warming founded in 2014. They run educational workshops and organise Game Jams (the event at which Nuage was born).
source : [Hakatah](https://www.hakatah.com)

//TODO
Research table
Name + pochette
19/11
validate the One-sheet document by Franck
