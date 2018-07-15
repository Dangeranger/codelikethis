# Geo Vermonter

<https://geoguessr.com/> is a game built using Google Maps

In this project we will build our own version of the game using locations inside Vermont.

First, clone the starter project here: 

  http://github.com/BurlingtonCodeAcademy/geo-vermonter

`cd` into the repo directory and then run `npm install`

# Tech:

* web layout and UI
* embedding maps APIs
* geocoding APIs
* DOM event handlers

# Game Rules:

* when the player starts a game, they are dropped into a random spot inside Vermont
* initial score is 20
* the zoom level is pretty high (low to the ground) and there are no streets or markers, only satellite imagery
* the map does **not** support zoom out, or slippy click-and-drag-to-move -- all movements must be deliberate, by clicking one of the north / south / east / west buttons
* every time the user clicks a movement button, the map moves a fixed amount in that direction, and the score is decreased by 1
* when the player clicks "Guess!" they can choose a county from a popup menu
* if the guess is correct then:
  * the game displays "You win!" 
  * their final score is logged [how?] 
  * the Info box is filled in with the correct latitude and longitude
   
> How do we get the nested list of Vermont towns and counties?

# State Transition Diagram

TODO
 
# User Stories

<!--box-->
### Basic Layout

* Sketch out wireframes for a page with the following page elements. 

|Selector|Description|
|---|---|
|`map`| shows the current map (initally the entire state of Vermont) |
|`nav`| top of page, placeholder for "about" and "high scores" and such |
|`info`| contains fields for... |
|  `latitude`, `long`, `county`, `town` | read-only text fields |
| `north`, `south`, `east`, `west` | buttons for movement |
|`start`, `guess`, `quit` | buttons labeled "Start a Game", "Guess the Spot", "I Give Up!" respectively - all disabled for now |
|`score`| text field |

* Then code the layout in HTML with placeholder information
* Run the cypress tests:
  * use `npm test` to run them immediately on the console - find screenshots under `cypress/screenshots/geo_vermonter_tests`
  * use `npx cypress open` to run them interactively in the browser GUI

<!--/box-->


<!--box-->
### State of the State

Using [leaflet.js](#TODO) place a map of the state of Vermont inside the `map` div. Use the [Isri.WorldImagery tileset](https://leaflet-extras.github.io/leaflet-providers/preview/) and make sure **not** to show any street or town info to the user -- only satellite images.

The map should be at a *fixed* zoom level, enough to show just the boundaries of the state and not much more.

The boundaries of Vermont are specified in [`border.js`](https://github.com/BurlingtonCodeAcademy/geo-vermonter/blob/master/border.js). Ask Josh for further instructions.

<!--/box-->

<!--box-->
### Game On

**When** the user clicks *Start a Game*

**Then** the Start button is disabled

**And** the Guess button is enabled

**And** the Quit button is enabled

<!--/box-->


<!--box-->
### Random Spot

**When** the user clicks *Start a Game*

**Then** the app chooses a random lat/long position *inside the boundaries of Vermont* 

  * [leaflet-pip](https://github.com/mapbox/leaflet-pip) is a library for finding out whether a point is inside a polygon

**And** zooms and centers the map to that location, with a *different fixed zoom level* of 18

**And** displays question marks inside the lat, long, county, and town fields

*(optional)* **And** displays a small map of Vermont counties on the side, e.g. https://geology.com/county-map/vermont-county-map.gif

<!--/box-->

<!--box-->
### I Give Up!

**When** the user clicks the "I Give Up" button

**Then** the app displays the lat/long position inside the `info` panel

**And** uses *geocoding* to look up the town and county, and displays those inside the `info` panel

<!--/box-->

<!--box-->
### Guess the County

**When** the user clicks the Guess button

**Then** the user sees a *modal dialog box* (or a *modeless dialog box*) asking "What county are we in?" with a [popup list of all Vermont counties](https://en.wikipedia.org/wiki/List_of_counties_in_Vermont)

**And** two buttons ("Guess" and "Cancel")

<hr>

**When** the user selects the correct county and clicks "Guess"

**Then** the game *fills in* that county name in the Info box (instead of a question mark) (as well as the other geocoded information)

**And** informs the user "Correct!"

<hr>

**When** the user types in an incorrect county 

**Then** The game *subtracts* 1 from score

**And** informs the user "Wrong!"

**And** the dialog box disappears

<hr>

**When** the user clicks "Cancel"

**Then** the dialog box disappears with no change to score

<!--/box-->

<!--box-->
### Return

**When** the user clicks the "Return" button

**Then** the game scrolls back to the original spot, with no change in score

<!--/box-->

<!--box-->
### breadcrumbs

When the user clicks a movement button

Then the map draws a dotted line between the previous map center and the new map center

And keeps showing the dotted line during the rest of game

<!--/box-->

# Backlog

Ideas for future work:

Invent some new game modes, and put links to the various modes inside the nav bar. For instance...

  * Guess the town, not the county
  * Daily Challenge - every user uses the same point
  * Burlington Challenge - guess the neigborhood
  * High Score - keep showing the best scores, and save the high score list using [LocalStorage](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage) so it persists across game sessions.  **BEWARE** that the values can only be strings, so you must use `JSON.stringify` on the way in and `JSON.parse` on the way out.
