--[[--
Lilia's configuration options.

This is meant to override Lilia's configuration options.
]]
-- @configurations Lilia
--- A list of available commands for use within the game.
-- Each command is represented by a table with fields defining its functionality.
-- @realm shared
-- @table Lilia_Config_List
-- @field WalkSpeed: Controls how fast characters walk | integer.
-- @field RunSpeed: Controls how fast characters run | integer.
-- @field WalkRatio: Defines the walk speed ratio when holding the Alt key | float.
-- @field AllowExistNames: Determines whether duplicated character names are allowed | boolean.
-- @field GamemodeName: Specifies the name of the gamemode | string.
-- @field Color: Sets the theme color used throughout the gamemode | color.
-- @field Font: Specifies the core font used for UI elements | string.
-- @field GenericFont: Specifies the secondary font used for UI elements | string.
-- @field MoneyModel: Defines the model used for representing money in the game | string.
-- @field MaxCharacters: Sets the maximum number of characters per player | integer.
-- @field DataSaveInterval: Time interval between data saves | integer.
-- @field CharacterDataSaveInterval: Time interval between character data saves.
-- @field MoneyLimit: Sets the limit of money a player can have [0 for infinite] | integer.
-- @field invW: Defines the width of the default inventory | integer.
-- @field invH: Defines the height of the default inventory | integer.
-- @field DefaultMoney: Specifies the default amount of money a player starts with | integer.
-- @field MaxChatLength: Sets the maximum length of chat messages | integer.
-- @field CurrencySymbol: Specifies the currency symbol used in the game | string.
-- @field SpawnTime: Time to respawn after death | integer.
-- @field MaxAttributes: Maximum attributes a character can have | integer.
-- @field EquipDelay: Time delay between equipping items | integer.
-- @field DropDelay: Time delay between dropping items | integer.
-- @field TakeDelay: Time delay between taking items | integer.
-- @field CurrencySingularName: Singular name of the in-game currency | string.
-- @field CurrencyPluralName: Plural name of the in-game currency | string.
-- @field SchemaYear: Year in the gamemode's schema | integer.
-- @field AmericanDates: Determines whether to use the American date format | boolean.
-- @field AmericanTimeStamp: Determines whether to use the American timestamp format | boolean.
-- @field MinDescLen: Minimum length required for a character's description | integer.
-- @field TimeToEnterVehicle: Time [in seconds] required to enter a vehicle | integer.
-- @field CarEntryDelayEnabled: Determines if the car entry delay is applicable | boolean.
-- @field Notify: Contains notification sound and volume settings | table.
-- @field Notify[1]: Notification sound file path | string.
-- @field Notify[2]: Notification volume | integer.
-- @field Notify[3]: Notification pitch | integer.
lia.config.WalkSpeed = 130
lia.config.RunSpeed = 235
lia.config.WalkRatio = 0.5
lia.config.AllowExistNames = true
lia.config.GamemodeName = "FalloutRP"
lia.config.Color = Color(255, 145, 44)
lia.config.Font = "Arial"
lia.config.GenericFont = "Segoe UI"
lia.config.MoneyModel = "models/props_lab/box01a.mdl"
lia.config.MaxCharacters = 5
lia.config.DataSaveInterval = 600
lia.config.CharacterDataSaveInterval = 300
lia.config.MoneyLimit = 0
lia.config.invW = 6
lia.config.invH = 4
lia.config.DefaultMoney = 0
lia.config.MaxChatLength = 256
lia.config.CurrencySymbol = "C"
lia.config.SpawnTime = 5
lia.config.MaxAttributes = 30
lia.config.EquipDelay = 2
lia.config.UnequipDelay = 2
lia.config.DropDelay = 2
lia.config.TakeDelay = 0
lia.config.CurrencySingularName = "Cap"
lia.config.CurrencyPluralName = "Caps"
lia.config.SchemaYear = 2023
lia.config.AmericanDates = true
lia.config.AmericanTimeStamp = true
lia.config.MinDescLen = 16
lia.config.TimeToEnterVehicle = 1
lia.config.CarEntryDelayEnabled = true
lia.config.Notify = {"garrysmod/content_downloaded.wav", 50, 250}
lia.anim.DefaultTposingFixer = {
    ["models/Zombie/Classic.mdl"] = "zombie",
    ["models/Zombie/Classic_legs.mdl"] = "zombie",
    ["models/Zombie/Classic_torso.mdl"] = "zombie",
    ["models/Zombie/Poison.mdl"] = "zombie",
    ["models/Humans/Charple01.mdl"] = "zombie",
    ["models/Humans/Charple02.mdl"] = "zombie",
    ["models/Humans/Charple03.mdl"] = "zombie",
    ["models/Humans/Charple04.mdl"] = "zombie",
    ["models/Humans/corpse1.mdl"] = "zombie",
    ["models/Gibs/Fast_Zombie_Torso.mdl"] = "fastZombie",
    ["models/Zombie/Fast.mdl"] = "fastZombie",
    ["models/Gibs/Fast_Zombie_Legs.mdl"] = "fastZombie",
    ["models/Police.mdl"] = "metrocop",
    ["models/Combine_Soldier.mdl"] = "overwatch",
    ["models/Combine_Soldier_PrisonGuard.mdl"] = "overwatch",
    ["models/Combine_Super_Soldier.mdl"] = "overwatch",
    ["models/police.mdl"] = "metrocop",
    ["models/combine_super_soldier.mdl"] = "overwatch",
    ["models/combine_soldier_prisonGuard.mdl"] = "overwatch",
    ["models/combine_soldier.mdl"] = "overwatch",
    ["models/vortigaunt.mdl"] = "vort",
    ["models/vortigaunt_blue.mdl"] = "vort",
    ["models/vortigaunt_doctor.mdl"] = "vort",
    ["models/vortigaunt_slave.mdl"] = "vort",
    ["models/alyx.mdl"] = "citizen_female",
    ["models/mossman.mdl"] = "citizen_female",
    ["models/Barney.mdl"] = "citizen_male",
    ["models/breen.mdl"] = "citizen_male",
    ["models/Eli.mdl"] = "citizen_male",
    ["models/gman_high.mdl"] = "citizen_male",
    ["models/Kleiner.mdl"] = "citizen_male",
    ["models/monk.mdl"] = "citizen_male",
    ["models/odessa.mdl"] = "citizen_male",
    ["models/Humans/Group01/Female_01.mdl"] = "citizen_female",
    ["models/Humans/Group01/Female_02.mdl"] = "citizen_female",
    ["models/Humans/Group01/Female_03.mdl"] = "citizen_female",
    ["models/Humans/Group01/Female_04.mdl"] = "citizen_female",
    ["models/Humans/Group01/Female_06.mdl"] = "citizen_female",
    ["models/Humans/Group01/Female_07.mdl"] = "citizen_female",
    ["models/Humans/Group02/Female_01.mdl"] = "citizen_female",
    ["models/Humans/Group02/Female_02.mdl"] = "citizen_female",
    ["models/Humans/Group02/Female_03.mdl"] = "citizen_female",
    ["models/Humans/Group02/Female_04.mdl"] = "citizen_female",
    ["models/Humans/Group02/Female_06.mdl"] = "citizen_female",
    ["models/Humans/Group02/Female_07.mdl"] = "citizen_female",
    ["models/Humans/Group03/Female_01.mdl"] = "citizen_female",
    ["models/Humans/Group03/Female_02.mdl"] = "citizen_female",
    ["models/Humans/Group03/Female_03.mdl"] = "citizen_female",
    ["models/Humans/Group03/Female_04.mdl"] = "citizen_female",
    ["models/Humans/Group03/Female_06.mdl"] = "citizen_female",
    ["models/Humans/Group03/Female_07.mdl"] = "citizen_female",
    ["models/Humans/Group03m/Female_01.mdl"] = "citizen_female",
    ["models/Humans/Group03m/Female_02.mdl"] = "citizen_female",
    ["models/Humans/Group03m/Female_03.mdl"] = "citizen_female",
    ["models/Humans/Group03m/Female_04.mdl"] = "citizen_female",
    ["models/Humans/Group03m/Female_06.mdl"] = "citizen_female",
    ["models/Humans/Group03m/Female_07.mdl"] = "citizen_female",
    ["models/Humans/Group03m/Male_01.mdl"] = "citizen_male",
    ["models/Humans/Group03m/male_02.mdl"] = "citizen_male",
    ["models/Humans/Group03m/male_03.mdl"] = "citizen_male",
    ["models/Humans/Group03m/Male_04.mdl"] = "citizen_male",
    ["models/Humans/Group03m/Male_05.mdl"] = "citizen_male",
    ["models/Humans/Group03m/male_06.mdl"] = "citizen_male",
    ["models/Humans/Group03m/male_07.mdl"] = "citizen_male",
    ["models/Humans/Group03m/male_08.mdl"] = "citizen_male",
    ["models/Humans/Group03m/male_09.mdl"] = "citizen_male",
    ["models/Humans/Group03/Male_01.mdl"] = "citizen_male",
    ["models/Humans/Group03/male_02.mdl"] = "citizen_male",
    ["models/Humans/Group03/male_03.mdl"] = "citizen_male",
    ["models/Humans/Group03/Male_04.mdl"] = "citizen_male",
    ["models/Humans/Group03/Male_05.mdl"] = "citizen_male",
    ["models/Humans/Group03/male_06.mdl"] = "citizen_male",
    ["models/Humans/Group03/male_07.mdl"] = "citizen_male",
    ["models/Humans/Group03/male_08.mdl"] = "citizen_male",
    ["models/Humans/Group03/male_09.mdl"] = "citizen_male",
    ["models/Humans/Group02/Male_01.mdl"] = "citizen_male",
    ["models/Humans/Group02/male_02.mdl"] = "citizen_male",
    ["models/Humans/Group02/male_03.mdl"] = "citizen_male",
    ["models/Humans/Group02/Male_04.mdl"] = "citizen_male",
    ["models/Humans/Group02/Male_05.mdl"] = "citizen_male",
    ["models/Humans/Group02/male_06.mdl"] = "citizen_male",
    ["models/Humans/Group02/male_07.mdl"] = "citizen_male",
    ["models/Humans/Group02/male_08.mdl"] = "citizen_male",
    ["models/Humans/Group02/male_09.mdl"] = "citizen_male",
    ["models/Humans/Group01/Male_01.mdl"] = "citizen_male",
    ["models/Humans/Group01/male_02.mdl"] = "citizen_male",
    ["models/Humans/Group01/male_03.mdl"] = "citizen_male",
    ["models/Humans/Group01/Male_04.mdl"] = "citizen_male",
    ["models/Humans/Group01/Male_05.mdl"] = "citizen_male",
    ["models/Humans/Group01/male_06.mdl"] = "citizen_male",
    ["models/Humans/Group01/male_07.mdl"] = "citizen_male",
    ["models/Humans/Group01/male_08.mdl"] = "citizen_male",
    ["models/Humans/Group01/male_09.mdl"] = "citizen_male",
    ["models/Humans/Group01/Male_Cheaple.mdl"] = "citizen_male",
    ["models/suits/group3/male_04_open_tie.mdl"] = "citizen_male",
    ["models/suits/robber_shirt.mdl"] = "citizen_male",
    ["models/suits/group1/male_04_shirt_tie.mdl"] = "citizen_male",
    ["models/suits/group1/male_04_shirt.mdl"] = "citizen_male",
    ["models/suits/group2/male_04_open_tie.mdl"] = "citizen_male",
    ["models/suits/group1/male_02_shirt.mdl"] = "citizen_male",
    ["models/suits/group3/male_02_shirt_tie.mdl"] = "citizen_male",
    ["models/suits/group3/male_04_shirt_tie.mdl"] = "citizen_male",
    ["models/suits/group3/male_02_open.mdl"] = "citizen_male",
    ["models/suits/group1/male_07_open.mdl"] = "citizen_male",
    ["models/suits/group2/male_07_open.mdl"] = "citizen_male",
    ["models/suits/group1/male_06_shirt.mdl"] = "citizen_male",
    ["models/suits/group3/male_07_open.mdl"] = "citizen_male",
    ["models/suits/group2/male_07_shirt.mdl"] = "citizen_male",
    ["models/suits/group2/male_09_shirt_tie.mdl"] = "citizen_male",
    ["models/suits/group3/male_03_open.mdl"] = "citizen_male",
    ["models/suits/group3/male_09_shirt_tie.mdl"] = "citizen_male",
    ["models/suits/group3/male_06_open_tie.mdl"] = "citizen_male",
    ["models/suits/group1/male_09_shirt.mdl"] = "citizen_male",
    ["models/suits/group2/male_01_shirt.mdl"] = "citizen_male",
    ["models/suits/group3/male_08_open_tie.mdl"] = "citizen_male",
    ["models/suits/group2/male_02_shirt.mdl"] = "citizen_male",
    ["models/suits/group2/male_05_open_tie.mdl"] = "citizen_male",
    ["models/suits/group1/male_08_open.mdl"] = "citizen_male",
    ["models/suits/group3/male_05_open_tie.mdl"] = "citizen_male",
    ["models/suits/group3/male_01_shirt.mdl"] = "citizen_male",
    ["models/suits/group1/male_08_open_tie.mdl"] = "citizen_male",
    ["models/suits/group1/male_08_shirt.mdl"] = "citizen_male",
    ["models/suits/group1/male_01_open_tie.mdl"] = "citizen_male",
    ["models/suits/group3/male_08_shirt.mdl"] = "citizen_male",
    ["models/suits/robber_open.mdl"] = "citizen_male",
    ["models/suits/group2/male_02_open_tie.mdl"] = "citizen_male",
    ["models/suits/group2/male_08_shirt.mdl"] = "citizen_male",
    ["models/suits/group1/male_03_open.mdl"] = "citizen_male",
    ["models/suits/group2/male_09_open_tie.mdl"] = "citizen_male",
    ["models/suits/group2/male_04_shirt_tie.mdl"] = "citizen_male",
    ["models/suits/group2/male_01_open.mdl"] = "citizen_male",
    ["models/suits/group2/male_03_shirt_tie.mdl"] = "citizen_male",
    ["models/suits/group3/male_02_open_tie.mdl"] = "citizen_male",
    ["models/suits/group3/male_05_open.mdl"] = "citizen_male",
    ["models/suits/suit_vest.mdl"] = "citizen_male",
    ["models/suits/robber_shirt_2.mdl"] = "citizen_male",
    ["models/suits/group1/male_03_open_tie.mdl"] = "citizen_male",
    ["models/suits/group1/male_06_open_tie.mdl"] = "citizen_male",
    ["models/suits/group1/male_02_shirt_tie.mdl"] = "citizen_male",
    ["models/suits/group3/male_04_open.mdl"] = "citizen_male",
    ["models/suits/group2/male_06_open_tie.mdl"] = "citizen_male",
    ["models/suits/group3/male_07_shirt_tie.mdl"] = "citizen_male",
    ["models/suits/group1/male_01_open.mdl"] = "citizen_male",
    ["models/suits/group3/male_02_shirt.mdl"] = "citizen_male",
    ["models/suits/group2/male_08_open_tie.mdl"] = "citizen_male",
    ["models/suits/group2/male_07_shirt_tie.mdl"] = "citizen_male",
    ["models/suits/group3/male_06_shirt_tie.mdl"] = "citizen_male",
    ["models/suits/group1/male_04_open_tie.mdl"] = "citizen_male",
    ["models/suits/group3/male_01_open_tie.mdl"] = "citizen_male",
    ["models/suits/group1/male_08_shirt_tie.mdl"] = "citizen_male",
    ["models/suits/group2/male_04_open.mdl"] = "citizen_male",
    ["models/suits/group1/male_07_shirt_tie.mdl"] = "citizen_male",
    ["models/suits/robber_tuckedtie.mdl"] = "citizen_male",
    ["models/suits/group2/male_05_shirt.mdl"] = "citizen_male",
    ["models/suits/group3/male_09_shirt.mdl"] = "citizen_male",
    ["models/suits/group2/male_03_shirt.mdl"] = "citizen_male",
    ["models/suits/group3/male_07_open_tie.mdl"] = "citizen_male",
    ["models/suits/group1/male_06_open.mdl"] = "citizen_male",
    ["models/suits/group2/male_06_shirt_tie.mdl"] = "citizen_male",
    ["models/suits/group3/male_09_open_tie.mdl"] = "citizen_male",
    ["models/suits/group1/male_05_open.mdl"] = "citizen_male",
    ["models/suits/group3/male_09_open.mdl"] = "citizen_male",
    ["models/suits/group1/male_04_open.mdl"] = "citizen_male",
    ["models/suits/group1/male_06_shirt_tie.mdl"] = "citizen_male",
    ["models/suits/group3/male_08_shirt_tie.mdl"] = "citizen_male",
    ["models/suits/group2/male_03_open.mdl"] = "citizen_male",
    ["models/suits/group1/male_07_shirt.mdl"] = "citizen_male",
    ["models/suits/group3/male_08_open.mdl"] = "citizen_male",
    ["models/suits/group1/male_05_shirt.mdl"] = "citizen_male",
    ["models/suits/group1/male_09_shirt_tie.mdl"] = "citizen_male",
    ["models/suits/group2/male_01_shirt_tie.mdl"] = "citizen_male",
    ["models/suits/group1/male_01_shirt.mdl"] = "citizen_male",
    ["models/suits/group2/male_02_open.mdl"] = "citizen_male",
    ["models/suits/group2/male_09_open.mdl"] = "citizen_male",
    ["models/suits/group3/male_01_shirt_tie.mdl"] = "citizen_male",
    ["models/suits/group1/male_01_shirt_tie.mdl"] = "citizen_male",
    ["models/suits/group2/male_08_shirt_tie.mdl"] = "citizen_male",
    ["models/suits/group2/male_03_open_tie.mdl"] = "citizen_male",
    ["models/suits/group3/male_05_shirt.mdl"] = "citizen_male",
    ["models/suits/group2/male_02_shirt_tie.mdl"] = "citizen_male",
    ["models/suits/robber_tie.mdl"] = "citizen_male",
    ["models/suits/group2/male_07_open_tie.mdl"] = "citizen_male",
    ["models/suits/group2/male_01_open_tie.mdl"] = "citizen_male",
    ["models/suits/group1/male_02_open.mdl"] = "citizen_male",
    ["models/suits/group2/male_05_open.mdl"] = "citizen_male",
    ["models/suits/group2/male_09_shirt.mdl"] = "citizen_male",
    ["models/suits/group1/male_09_open_tie.mdl"] = "citizen_male",
    ["models/suits/group3/male_03_shirt_tie.mdl"] = "citizen_male",
    ["models/suits/group2/male_05_shirt_tie.mdl"] = "citizen_male",
    ["models/suits/group2/male_06_open.mdl"] = "citizen_male",
    ["models/suits/group1/male_03_shirt_tie.mdl"] = "citizen_male",
    ["models/suits/group3/male_03_open_tie.mdl"] = "citizen_male",
    ["models/suits/group3/male_03_shirt.mdl"] = "citizen_male",
    ["models/suits/shirt_vest.mdl"] = "citizen_male",
    ["models/suits/group3/male_07_shirt.mdl"] = "citizen_male",
    ["models/suits/group3/male_06_open.mdl"] = "citizen_male",
    ["models/suits/group2/male_04_shirt.mdl"] = "citizen_male",
    ["models/suits/group1/male_09_open.mdl"] = "citizen_male",
    ["models/suits/group3/male_06_shirt.mdl"] = "citizen_male",
    ["models/suits/group2/male_08_open.mdl"] = "citizen_male",
    ["models/suits/group1/male_02_open_tie.mdl"] = "citizen_male",
    ["models/suits/group1/male_03_shirt.mdl"] = "citizen_male",
    ["models/suits/group1/male_05_shirt_tie.mdl"] = "citizen_male",
    ["models/suits/group2/male_06_shirt.mdl"] = "citizen_male",
    ["models/suits/group3/male_05_shirt_tie.mdl"] = "citizen_male",
    ["models/suits/group1/male_07_open_tie.mdl"] = "citizen_male",
    ["models/suits/group3/male_01_open.mdl"] = "citizen_male",
    ["models/suits/group3/male_04_shirt.mdl"] = "citizen_male",
    ["models/suits/group1/male_05_open_tie.mdl"] = "citizen_male",
    ["models/thespireroleplay/humans/group004/male_01.mdl"] = "citizen_male",
    ["models/thespireroleplay/humans/group004/male_02.mdl"] = "citizen_male",
    ["models/thespireroleplay/humans/group004/male_03.mdl"] = "citizen_male",
    ["models/thespireroleplay/humans/group004/male_04.mdl"] = "citizen_male",
    ["models/thespireroleplay/humans/group004/male_05.mdl"] = "citizen_male",
    ["models/thespireroleplay/humans/group004/male_06.mdl"] = "citizen_male",
    ["models/thespireroleplay/humans/group004/male_07.mdl"] = "citizen_male",
    ["models/thespireroleplay/humans/group004/male_08.mdl"] = "citizen_male",
    ["models/thespireroleplay/humans/group004/male_09.mdl"] = "citizen_male",
    ["models/thespireroleplay/humans/group004/male_10.mdl"] = "citizen_male",
    ["models/thespireroleplay/humans/group004/male_11.mdl"] = "citizen_male",
    ["models/thespireroleplay/humans/group004/male_12.mdl"] = "citizen_male",
    ["models/thespireroleplay/humans/group004/male_13.mdl"] = "citizen_male",
    ["models/thespireroleplay/humans/group004/male_14.mdl"] = "citizen_male",
    ["models/thespireroleplay/humans/group004/male_15.mdl"] = "citizen_male",
    ["models/thespireroleplay/humans/group004/male_16.mdl"] = "citizen_male",
    ["models/thespireroleplay/humans/group004/male_17.mdl"] = "citizen_male",
    ["models/thespireroleplay/humans/group004/male_18.mdl"] = "citizen_male",
    ["models/thespireroleplay/humans/group004/female_01.mdl"] = "citizen_female",
    ["models/thespireroleplay/humans/group004/female_02.mdl"] = "citizen_female",
    ["models/thespireroleplay/humans/group004/female_03.mdl"] = "citizen_female",
    ["models/thespireroleplay/humans/group004/female_04.mdl"] = "citizen_female",
    ["models/thespireroleplay/humans/group004/female_05.mdl"] = "citizen_female",
    ["models/thespireroleplay/humans/group004/female_06.mdl"] = "citizen_female",
    ["models/thespireroleplay/humans/group004/female_07.mdl"] = "citizen_female",
    ["models/thespireroleplay/humans/group004/female_08.mdl"] = "citizen_female",
    ["models/thespireroleplay/humans/group004/female_09.mdl"] = "citizen_female",
    ["models/thespireroleplay/humans/group004/female_10.mdl"] = "citizen_female",
    ["models/thespireroleplay/humans/group004/female_11.mdl"] = "citizen_female",
    ["models/thespireroleplay/humans/group004/female_12.mdl"] = "citizen_female",
    ["models/npcraider2.mdl"] = "citizen_male",
    ["models/npcraider3.mdl"] = "citizen_female",
    ["models/deathsquad.mdl"] = "citizen_male",
    ["models/amwpa/advancedmidwest_powerarmor.mdl"] = "citizen_male",
    ["models/player/amwpa/advancedmidwest_powerarmor.mdl"] = "citizen_male",
    ["models/npcrogueranger.mdl"] = "citizen_male",
    ["models/scraptonranger.mdl"] = "citizen_male",
    ["models/brotherhoodelder_ns.mdl"] = "citizen_male",
    ["models/humans/colonelclanny/male_06.mdl"] = "citizen_male",
    ["models/ninja/chinese_m_npc.mdl"] = "citizen_male",
    ["models/ninja/chinese_f_npc.mdl"] = "citizen_female",
    ["models/player/h&h/raiderpowerarmor/male01.mdl"] = "citizen_male",
    ["models/visualitygaming/fallout/valentina_hellfire.mdl"] = "citizen_male"
}
