## AdminToolkit for Arma 3
<sup>**Version 2.0** | Author: ole1986 | This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License</sup>

This tool is used to administrate Arma3 multiplayer servers. 
It also supports an option to overwrite the sections for additional features. 

**<p align="center"><a href="#installation">Installation</a> <a href="#extending-the-admintoolkit">Extensions</a></p>**

**<p align="center">PRESS THE F2 KEY TO OPEN IN-GAME</p>**

<img src="images/a3-atk-newdesign.png" width="210" title="New design">
<img src="images/a3-atk-players.png" width="210" title="Manage players">
<img src="images/a3-atk-vehicles.png" width="210" title="Spawn vehicles">
<img src="images/a3-atk-weapons.png" width="210" title="Weapons">

<p align="center">
Video<br/>
<a href="https://www.youtube.com/watch?v=Hznh7DSM38E" target="_blank"><img src="http://img.youtube.com/vi/Hznh7DSM38E/0.jpg" /></a>
</p>
**Core Features:**

**Players**
- Setup administrators or moderators with limited access
- Teleport from/to players and to map position (by using the in-game map - hold ALT key and press LMB)
- Spectate player using WASD plus Q and E keys  <sup>improved since version 1.6</sup>
- God Mode
- Kick/Ban players

**Vehicles**
- Vehicle spawn for yourself or a selected player
- (Exile Addon) Spawn persistent vehicles with PIN CODE

**Weapons**
- add weapon to inventory
- add ammo to inventory

**Construction & Others**
- NEW: Building persistence supported (since v1.4)
- Place buildings by using **Q, E for rotation**, **PAGEUP/PAGEDOWN and HOME/END for moving** the constructions
- spawn additional "vehicle items" like Backpacks, GPS, Binocular, etc... (located in Other)

**Extension support**
- allows you to extend and overwrite features with your own extension file(s) - <a href="#extensions">Read more</a> 

## Installation

### Required Tools

+ PBO Manager - to setup UIDs and server password in server pbo
+ Notepad++ or any other Text Editor (https://notepad-plus-plus.org/)

### Client

+ Copy the folder `@AdminToolkit` into your Arma 3 game directory (E.g. `C:\Steam\steamapps\common\Arma 3`) 
+ Load the mod through Arma 3 Launcher when you run the game

### Server

+ Open the `@ExileServer\admintoolkit_server` folder and setup the `config.cpp` accordingly - see <a href="#configuration">Configuration</a>
+ Pack the `@ExileServer\admintoolkit_server` folder (containing your config.cpp changes) into `admintoolkit_server.pbo`
+ Copy the `@ExileServer\admintoolkit_server.pbo` into your `@ExileServer\addons` directory from the server.
+ Copy the `admintoolkit.bikey` server key file into your server `keys` directory

### MissionFile

+ Open the `description.ext` and add the below line into `class CfgRemoteExec -> class Functions`

```
class AdminToolkit_network_receiveRequest { allowedTargets = 2; };
```

+ Add the below line at the beginning of the file `initPlayerLocal.sqf`

```
[] execVM "atk\init.sqf"; 
```

For additional extension implementation, please follow the instructions in the README.&lt;Extension&gt;.md file

## Configuration

Before you can use the AdminToolkit it is necessary to **add you as administrator**.
Please find the server `config.cpp` in your `@ExileServer\admintoolkit_server` directory and amend it according to your requirements

```
/**
 * Server command password required to execute kick, ban, etc...
 */
ServerCommandPassword = "";
/**
 * list of allowed admins using its player UID
 */
AdminList[] = {"yourPlayerUIDHere"};
/**
 * list of admins with restricted access only
 */
ModeratorList[] = {""};
```

Moderators can have restricted access - help yourself and read the config.cpp carefully to customize the permissions

## Extending the AdminToolkit

The AdminToolkit can be extended by using the MissionFile configuration class `CfgAdminToolkitCustomMod`.
For more details, please refer to the <a href="%40MissionFile/README.md">@MissionFile/README.md</a>

**Below is a list of available extensions**

| Name       | Description                                                                  | Autor(s)  | Links                                           
| ---------- | ---------------------------------------------------------------------------- | --------- | --- 
| ExileMod   | create persistent vehicles, receive ExileMoney and build objects, etc...     | ole       | <a href="tree/exilemod/@MissionFile/README.ExileMod.md">README</a>

### Battleye

Please use the below tool setup all Battleye exceptions:

http://gp.gamersinc.net/BEF.php
