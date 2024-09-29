function onCreatePost()
    makeLuaText("version", "", 1050, 10, 690)
    setTextAlignment("version", "left")
    addLuaText("version")
    setTextFont("version", "comic-sans-ms.ttf");

    makeLuaText("engineText", "", 1250, 10, 690)
    setTextAlignment("engineText", "right")
    addLuaText("engineText")
    setTextFont("engineText", "comic-sans-ms.ttf");

    setTextFont('timeTxt', 'comic-sans-ms.ttf');
    setTextFont("scoreTxt", 'comic-sans-ms.ttf');
end