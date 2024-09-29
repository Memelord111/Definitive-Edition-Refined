useFromText = false --set to true for subtitles to be read from data/song/subs.txt
function string:split(s) return stringSplit(self, s) end
function onCreate() --load the shit
    addHaxeLibrary('Type')
    addHaxeLibrary('FlxTypeText', 'flixel.addons.text')
    addHaxeLibrary('ClientPrefs')
    fixRH()
    luaDebugMode = true
    if useFromText then
        subs = getTextFromFile('data/'..songPath..'/subtitles.txt')
        if not subs then error 'Subtitles not found!' end
        subs = subs:split '\n'
        subs.index = 0
    end
end
function onEvent(n, sub, v2)
    if n == 'dnbsubs' then
        sub = sub:gsub(',/', ',') --if you are calling from an event
        size = tonumber(size) or 36
        typespeed = tonumber(typespeed) or 0.02
        showtime = tonumber(showtime) or 1
        if useFromText then
            subs.index = subs.index + 1
            sub = subs[subs.index]
        end
        runHaxeCode([[
            var sub = new FlxTypeText(0, 0, FlxG.width, ']]..sub..[[', 36);
            sub.setFormat(Paths.font("comic.ttf"), ]]..size..[[, 0xFFFFFF, 'center', Type.resolveEnum('flixel.text.FlxTextBorderStyle').OUTLINE, 0xFF000000);
            sub.antialiasing = ClientPrefs.globalAntialiasing;
            sub.borderSize = 2;
            sub.cameras = [game.camHUD];
            sub.start(]]..typespeed..[[, false, false, [], () -> {
                game.modchartTimers.set(sub + 'timer', new FlxTimer().start(]]..showtime..[[, _ -> {
                    game.modchartTweens.set(sub + ' tween', FlxTween.tween(sub, {alpha: 0}, 0.5, {onComplete: _ -> {
                        game.remove(sub);
                        sub.destroy();
                    }}));
                }));
            });
            sub.screenCenter(0x01);
            sub.y = (FlxG.height / 2) - 200;
            game.add(sub);
        ]])
    end
end