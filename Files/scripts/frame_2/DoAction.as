stop();
var gameDirectory = com.clubpenguin.util.LocaleText.getGameDirectory();
var localeDirectory = "lang/" + com.clubpenguin.util.LocaleText.getLocale(com.clubpenguin.util.LocaleText.getLocaleID()) + "/";
var loader = new MovieClipLoader();
loader.loadClip(gameDirectory + localeDirectory + "title.swf",start_screen.logo_title);
var SHELL = _global.getCurrentShell();
var penguinColor = SHELL.getMyPlayerHex();
trace("PENGUIN COLOR IS: " + penguinColor);
var colorObject = new Color(start_screen.penguin_color_screen.penguin_mc);
colorObject.setRGB(penguinColor);
