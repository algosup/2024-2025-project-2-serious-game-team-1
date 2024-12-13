# Test Plan

|author|Léna|
|-|-|
|Created|11/27/2024|
|Finished|12/05/2024|


![-](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png)
<hr>
<details>
<summary>📖 Table of content</summary>

-[Scope of Testing](#scope-of-testing)

-[Risk Analysis](#risk-analysis)

-[Scheduling and Test Approach](#scheduling-and-test-approach)

-   [Technical validation phase](#technical-validation-phase)

-   [User experience phase](#user-experience-phase)

-[Testing Tools](#testing-tools)

-   [Hardware](#hardware)

-   [Software](#software)

-[Defect Management](#defect-management)

-[Test Cases](#test-cases)

-[Glossary](#glossary)
</details>
<hr>

The following report outlines the steps to perform the necessary QA[^qa] testing during the different testing phases of *The Renewable Island* project.

The main goal of game testing is to identify and discover defects and bugs in a video game and improve its stability and performance. Game testing is a component of game development that helps to ensure the video game to be deployed is bug-free.

## Scope of Testing
This test plan was designed to test the game *The Renewable Island*. Testing will focus on ensuring the game's functionality, primarily focusing on control functions and the seriousness of the game.
## Risk Analysis
A widely recognized challenge in the field of testing is that it is impossible to test everything exhaustively.

The principles defined by ISTQB2[^istqb] , developed over the years alongside the evolution of testing practices and software development, are now considered the essential foundations of the profession.

Taking into account the previous information, as well as the fact that this is the first version of the game, here are the most important features to test:
|feature|why|
|-|-|
|Control|Players need to be able to move around easily in the open world|
|Interactions with objects|Players must be able to interact with objects and use them|
|inventory|Facilitates interaction between the player and the environment|
|Quest|Quests need to be functional for a better user experience|

## Scheduling and Test Approach
During this phase, the testing will be on the mechanics and dynamics of the game to ensure that the game is coherent. 
the test period will be divided into two parts:
- Technical validation phase
- User experience phase

### Technical validation phase

|date|12/09/2024-12/13/2024|
|-|-|
|**objective**|Test all the game's functionality and check if everything is for a potential beta test|
### User experience phase

|date|12/16/2024-12/20/2024|
|-|-|
|**objective**|The game can be accessed before its official release to get feedback and make the game more entertaining, as well as to fix potential persistent bugs|

## Testing Tools
### Hardware
|Lenovo||
|-|-|
|CPU|Intel Core i7-1255U|
|RAM|16 GB|
|GPU|None|


### Software
|||
|-|-|
|OS|Windows 11 Pro|
|Game Engine| GODOT v4.3|
## Defect Management

All the bug funds in the project will be reported on the [GitHub issue](https://github.com/algosup/2024-2025-project-2-serious-game-team-1/issues?q=is%3Aissue+is%3Aclosed).

|template||
|-|-|
|Description|Description of the bug is as detailed as possible.|
|Origin|Where does the bug come from (Example: Character, Texture, pnj, etc ... ).|
|Severity|- **None**: Doesn't impact the project at all.
||- **Low**: Small impact.
||- **Medium**: Impact a single feature.
||- **Major**: Crash the game or question a feature.|
|Additional content|Screenshots, Videos, and Additional information.|


## Test Cases
All the test cases are in the markdown file [Test_Cases](https://github.com/algosup/2024-2025-project-2-serious-game-team-1/blob/main/documents/test_cases.md).
## Glossary

 [^istqb]: The International Software Testing Qualifications Board is a software testing certification board that operates internationally.

 [^qa]: Quality Assurance