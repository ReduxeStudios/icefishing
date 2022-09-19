var gameDirectory = com.clubpenguin.util.LocaleText.getGameDirectory();
var localeDirectory = "lang/" + com.clubpenguin.util.LocaleText.getLocale(com.clubpenguin.util.LocaleText.getLocaleID()) + "/";
var loader = new MovieClipLoader();
loader.loadClip(gameDirectory + localeDirectory + "canoworms.swf",oneup.obj.canOWorms);
