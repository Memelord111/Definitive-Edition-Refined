function onCreate()
    luaDebugMode = true
    for i,lib in pairs{'ClientPrefs', 'Conductor', 'Math', 'Highscore', 'Type', 'Main', 'Note'} do
        addHaxeLibrary(lib)
    end
    addHaxeLibrary('Lua_helper', 'llua')
    addHaxeLibrary('FlxStringUtil', 'flixel.util')
    addHaxeLibrary('FlxMath', 'flixel.math')
    addHaxeLibrary('FPS', 'openfl.display')
    addHaxeLibrary('System', 'openfl.system')
    local callbacks = runHaxeCode 'return [for(i in Lua_helper.callbacks.keys()) i];'
    for i,callback in pairs(callbacks) do
        runHaxeCode(callback..' = Lua_helper.callbacks.get("'..callback..'");')
    end
    setProperty('showCombo', true)
    addHaxeLibrary('FlxTransitionableState', 'flixel.addons.transition')
    addHaxeLibrary'CustomFadeTransition'
end
function onCreatePost() --time stuff
	runHaxeCode([[
		Type.resolveClass('flixel.addons.transition.FlxTransitionableState').skipNextTransOut = true;
	]])
    local dp = debugPrint
    function debugPrint(...)
        dp(...)
        setProperty('luaDebugGroup.members[0].y', getProperty'luaDebugGroup.members[0].y'+40)
    end
    setProperty('beatline.visible', false)
    setProperty('beatline.visible', false)
    
    dadFloat, bfFloat, gfFloat = unpack(runHaxeCode[[
        iconP1 = new HealthIcon(game.boyfriend.healthIcon, true);
        iconP1.y = game.healthBar.y - 75;
        iconP1.visible = !ClientPrefs.hideHud;
        iconP1.alpha = ClientPrefs.healthBarAlpha;
        iconP1.cameras = [game.camHUD];
        iconP1.antialiasing = game.boyfriend.antialiasing;
        game.insert(game.members.indexOf(game.scoreTxt), iconP1);

        iconP2 = new HealthIcon(game.dad.healthIcon, false);
        iconP2.y = game.healthBar.y - 75;
        iconP2.visible = !ClientPrefs.hideHud;
        iconP2.alpha = ClientPrefs.healthBarAlpha;
        iconP2.cameras = [game.camHUD];
        iconP2.antialiasing = game.dad.antialiasing;
        if(game.dad.curCharacter == 'not-penis-elf') iconP2.color = 0xFF000000;
        game.insert(game.members.indexOf(game.scoreTxt), iconP2);
        floaters = ['bambi_piss', 'bandu_scared', 'bwooky', 'bwooky-mad', 'not-penis-elf', 'bandu'];
        noFloat = ['bwooky', 'bwooky-mad', 'not-penis-elf', 'bandu'];
        for(thing in [iconP1, iconP2, game.healthBar, game.scoreTxt]) {
            thing.y += 5;
            thing.x -= 2;
        }
        game.healthBar.y -= 3;
        game.scoreTxt.y += 6;
        if(floaters.contains(game.dad.curCharacter)) {
            for(note in game.unspawnNotes) {
                if(!note.gfNote && (!note.mustPress || FlxG.random.bool(25)) && !note.isSustainNote) {
                    note.texture = (note.noteType == 'smash') ? 'phone3d' : 'NOTE_assets_3D';
                    note.antialiasing = false;
                }
            }
        }
        if(floaters.contains(game.boyfriend.curCharacter)) {
            for(note in game.unspawnNotes) {
                if(!note.gfNote && (note.mustPress || FlxG.random.bool(25)) && !note.isSustainNote) {
                    note.texture = (note.noteType == 'smash') ? 'phone3d' : 'NOTE_assets_3D';
                    note.antialiasing = false;
                }
            }
        }
        if(game.gf != null && floaters.contains(game.gf.curCharacter)) {
            for(note in game.unspawnNotes) {
                if(note.gfNote && !note.isSustainNote) {
                    note.texture = (note.noteType == 'smash') ? 'phone3d' : 'NOTE_assets_3D';
                    note.antialiasing = false;
                }
            }
        }
        for(note in game.unspawnNotes) {
            if(note.isSustainNote) {
                note.texture = note.prevNote.texture;
                note.antialiasing = note.prevNote.antialiasing;
            }
        }
        return [floaters.contains(game.dad.curCharacter) && !noFloat.contains(game.dad.curCharacter), floaters.contains(game.boyfriend.curCharacter) && !noFloat.contains(game.boyfriend.curCharacter), game.gf != null && floaters.contains(game.gf.curCharacter) && !noFloat.contains(game.gf.curCharacter)];
        destroyedFader = false;
    ]])
    setPropertyFromClass('flixel.FlxG', 'sound.soundTrayEnabled', false)
    vol = getPropertyFromClass('flixel.FlxG', 'sound.volume')
    vol = math.floor(vol * 10)/10
    for i,coolVol in ipairs(soundLevels) do
        if coolVol > vol then
            soundIndex = i-1
            vol = soundLevels[i-1] or 0
            if vol == 0 then soundIndex = 1 end
            break;
        end
    end
    if not soundIndex then
        vol = 1
        soundIndex = 10
    end
    muted = getPropertyFromClass('flixel.FlxG', 'sound.muted')

    if checkFileExists ('data/'..songPath..'/credits.txt') then
        hasCredits = true
        makeLuaSprite ('creditsBox', '', -426)
        makeGraphic('creditsBox', 426, screenHeight, '0xFF000000')
        setObjectCamera('creditsBox', 'other')
        setProperty('creditsBox.alpha', 0.5)
        addLuaSprite('creditsBox', true)

        makeLuaText('creditsBoxTxt', getTextFromFile ('data/'..songPath..'/credits.txt'), 426)
        setProperty('creditsBoxTxt.alignment', 'center')
        setProperty('creditsBoxTxt.size', 32)
        setObjectCamera('creditsBoxTxt', 'other')
        runHaxeCode "game.getLuaObject('creditsBoxTxt').setBorderStyle(Type.resolveEnum('flixel.text.FlxTextBorderStyle').NONE);"
        addLuaText('creditsBoxTxt')
    end

    runHaxeCode 'Main.fpsVar.visible = false;'
    makeLuaText 'fpsTxt'
    setObjectCamera('fpsTxt', 'other')
    runHaxeCode "game.getLuaObject('fpsTxt').setBorderStyle(Type.resolveEnum('flixel.text.FlxTextBorderStyle').NONE);"
    setProperty('fpsTxt.x', 10)
    setProperty('fpsTxt.y', 3)
    setProperty('fpsTxt.size', 20)
    addLuaText 'fpsTxt'
    --rip mem txt
    --makeLuaText 'memTxt' 
    --setObjectCamera('memTxt', 'other')
    --runHaxeCode "game.getLuaObject('memTxt').setBorderStyle(Type.resolveEnum('flixel.text.FlxTextBorderStyle').NONE);"
    --setProperty('memTxt.x', 10)
    --setProperty('memTxt.y', 35)
    --addLuaText 'memTxt'

    makeLuaSprite('soundTray', 'soundtray', screenWidth)
    screenCenter('soundTray', 'y')
    setObjectCamera('soundTray', 'camOther')
    setProperty('soundTray.antialiasing', false)
    addLuaSprite('soundTray', true)
    --debugPrint(getProperty'soundTray.y')
    --debugPrint(soundLevel)
    makeLuaSprite('soundTrayArrow', 'arrow', 0, soundYs[(vol*10)+1])
    setProperty('soundTrayArrow.antialiasing', false)
    setObjectCamera('soundTrayArrow', 'other')
    addLuaSprite('soundTrayArrow', true)

    makeAnimatedLuaSprite('transition', 'Gapple/transition')
    addAnimationByPrefix('transition', 'idle', 'Symbol 1', 24, false)
    setObjectCamera('transition', 'other')
    setProperty('transition.antialiasing', false)
    addLuaSprite('transition', true)
    
    makeAnimatedLuaSprite('transitionFake', 'Gapple/transition')
    addAnimationByPrefix('transitionFake', 'idle', 'Symbol 1', 24, false)
    setProperty('transitionFake.visible', false)
    addLuaSprite('transitionFake', true)
end
soundLevel = 0
soundYs = {517, 485, 453, 424, 392, 360, 326, 294, 262, 233, 201}
soundLevels = {0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1}
function onDestroy() 
    runHaxeCode 'Main.fpsVar.visible = true;'
    setPropertyFromClass('flixel.FlxG', 'sound.soundTrayEnabled', true)
end
function onBeatHit()
    runHaxeCode([[
        if (game.curBeat % game.gfSpeed == 0) {
            var newTween = game.modchartTweens.set;
			if(game.curBeat % (game.gfSpeed * 2) == 0) {
				iconP1.scale.set(1.1, 0.8);
				iconP2.scale.set(1.1, 1.3);

				newTween('_iconp1angle', FlxTween.angle(iconP1, -15, 0, Conductor.crochet / 1300 * game.gfSpeed, {ease: FlxEase.quadOut}));
				newTween('_iconp2angle', FlxTween.angle(iconP2, 15, 0, Conductor.crochet / 1300 * game.gfSpeed, {ease: FlxEase.quadOut}));
			} else {
				iconP1.scale.set(1.1, 1.3);
				iconP2.scale.set(1.1, 0.8);

				newTween('_iconp2angle', FlxTween.angle(iconP2, -15, 0, Conductor.crochet / 1300 * game.gfSpeed, {ease: FlxEase.quadOut}));
				newTween('_iconp1angle', FlxTween.angle(iconP1, 15, 0, Conductor.crochet / 1300 * game.gfSpeed, {ease: FlxEase.quadOut}));
			}
			iconP1.updateHitbox();
			iconP2.updateHitbox();
            iconP1.offset.x -= 150 - iconP1.width + 5;
            iconP2.offset.x -= 150 - iconP2.width + 5;
            iconP1.offset.y += (150 - iconP1.height)/2;
            iconP2.offset.y += (150 - iconP2.height)/2;
			newTween('_iconp1scale', FlxTween.tween(iconP1.scale, {x: 1, y: 1}, Conductor.crochet / 1250 * game.gfSpeed, {ease: FlxEase.quadOut}));
			newTween('_iconp2scale', FlxTween.tween(iconP2.scale, {x: 1, y: 1}, Conductor.crochet / 1250 * game.gfSpeed, {ease: FlxEase.quadOut}));
            newTween('_iconp1offset', FlxTween.tween(iconP1.offset, {x: 0, y: 0}, Conductor.crochet / 1250 * game.gfSpeed, {ease: FlxEase.quadOut}));
            newTween('_iconp2offset', FlxTween.tween(iconP2.offset, {x: 0, y: 0}, Conductor.crochet / 1250 * game.gfSpeed, {ease: FlxEase.quadOut}));
		}
    ]])
end
et = 0
function noteMiss()
    playSound('missnote'..getRandomInt(1, 3), getRandomFloat(0.1, 0.2))
end
function onCountdownStarted()
    if bfFloat then
        for i=0,3 do 
            setPropertyFromGroup('playerStrums', i, 'texture', 'NOTE_assets_3D')
            setPropertyFromGroup('playerStrums', i, 'antialiasing', false) 
        end
    end
    if dadFloat then
        for i=0,3 do 
            setPropertyFromGroup('opponentStrums', i, 'texture', 'NOTE_assets_3D') 
            setPropertyFromGroup('opponentStrums', i, 'antialiasing', false) 
        end
    end
    runHaxeCode[[
        if(!ClientPrefs.middleScroll) {
            for(strum in game.opponentStrums){
                strum.x -= 42;
            }
            for(strum in game.playerStrums){
                strum.x += 32;
            }
            for(strum in game.strumLineNotes)
                strum.y -= 2;
        }
    ]]
end
function onEndSong()
    if not canEnd then
        ending = true
        playAnim('transition', 'idle', true, true)
        playAnim('transitionFake', 'idle', true)
        --debugPrint 'PREVENTING END'
        return Function_Stop
    end
    return Function_Continue
end
function onUpdate(e)
    if ending and getProperty 'transitionFake.animation.curAnim.finished' then
        canEnd = true
        makeLuaSprite 'blocker'
        setObjectCamera('blocker', 'other')
        makeGraphic('blocker', 1280, 720, '000000')
        addLuaSprite('blocker', true)
        runHaxeCode[[
          game.endSong();
        ]]
    end
    if keyboardJustPressed 'BACKSPACE' then
        exitSong()
    end
    et = et + e
    if dadFloat then
        if not dadName == 'bandu_scared' then setProperty('dad.y', getProperty'dad.y' + math.sin(et) * 0.6) end
        if not mustHitSection then runHaxeCode'game.moveCameraSection();' end
    end
    if bfFloat then
        setProperty('boyfriend.y', getProperty'boyfriend.y' + math.sin(et) * 0.6)
        if mustHitSection then runHaxeCode'game.moveCameraSection();' end
    end
    runHaxeCode([[
        iconP1.x = game.iconP1.x;
        iconP1.x -= (12350 * game.iconP1.scale.x - 150)/2;
        iconP1.animation.curAnim.curFrame = game.iconP1.animation.curAnim.curFrame;
        iconP2.x = game.iconP2.x;
        iconP2.x += (12350 * game.iconP2.scale.x)/2 - (26*3);
        iconP2.animation.curAnim.curFrame = game.iconP2.animation.curAnim.curFrame;
    ]])
    if hasCredits then
        setProperty('creditsBoxTxt.x', getProperty 'creditsBox.x')
    end
    setProperty('soundTrayArrow.x', getProperty'soundTray.x'+62)
    if keyboardJustPressed 'PLUS' then
        muted = false
        showTray(ADD)
        timer(1, hideTray, 'soundtrayshow')
    end
    if keyboardJustPressed 'MINUS' then
        muted = false
        showTray(SUBTRACT)
        timer(1, hideTray, 'soundtrayshow')
    end
    if keyboardJustPressed 'ZERO' then
        muted = not muted
        showTray(MUTED)
        timer(1, hideTray, 'soundtrayshow')
    end
end
function hideTray()
    doTweenX('hidetray', 'soundTray', screenWidth, 0.25)
end
SUBTRACT = -1
MUTED = 0
ADD = 1
vol = 1
function showTray(state)
    cancelTween 'hidetray'
    playSound 'soundtray'
    if state == ADD and soundIndex ~= 11 then
        soundIndex = soundIndex + 1
    elseif state == SUBTRACT and soundIndex ~= 1 then
        soundIndex = soundIndex - 1
    end
    vol = soundLevels[soundIndex]
    --debugPrint(soundIndex)
    setPropertyFromClass('flixel.FlxG', 'sound.volume', muted and 0 or vol)
    setProperty('soundTray.x', screenWidth - (12.95 + getProperty'soundTray.width'))
    setProperty('soundTrayArrow.y', soundYs[muted and 0 or soundIndex])
end
function onUpdatePost()
    if not getProperty 'startingSong' and not getProperty 'paused' then
        runHaxeCode([[
            var curTime:Float = Conductor.songPosition - ClientPrefs.noteOffset;

            var secondsTotal:Int = Math.floor((game.songLength - curTime) / 1000);
            if(secondsTotal < 0) secondsTotal = 0;
            var theString:String = FlxStringUtil.formatTime(secondsTotal, false);
            game.timeTxt.text = theString;
        ]])
    end
    local scoreSplit = stringSplit(getProperty 'scoreTxt.text', ' | ')
    scoreSplit[3] = 'Accuracy: '..tostring(math.floor(getProperty 'ratingPercent' * 10000)/100)..'%'
    setProperty('scoreTxt.text', table.concat(scoreSplit, ' | '))
    local fps = runHaxeCode 'return Main.fpsVar.currentFPS;'
    setProperty('fpsTxt.text', 'FPS: '..tostring(fps))
    --setProperty('memTxt.text', 'RAM Used: '..tostring(runHaxeCode 'return Math.abs(FlxMath.roundDecimal(System.totalMemory / 1000000, 1));')..' MB')
end
function goodNoteHit(id, data, type, sus) --do wacky stuff with ratings
    if not sus then
        runHaxeCode([=[
            var seperatedScore = [];
            
            if(game.combo >= 1000) {
                seperatedScore.push(Math.floor(game.combo / 1000) % 10);
            }
            seperatedScore.push(Math.floor(game.combo / 100) % 10);
            seperatedScore.push(Math.floor(game.combo / 10) % 10);
            seperatedScore.push(game.combo % 10);

            var note = game.notes.members[]=]..id..[=[];
            var is3D = note.texture == 'NOTE_assets_3D';
            var daRating = Conductor.judgeNote(note, (note.strumTime - Conductor.songPosition + ClientPrefs.ratingOffset) / game.playbackRate);


            var nums = [for(i in 1...4) game.members[game.members.indexOf(game.strumLineNotes)-i]];
            var i = 0;
            var ok = [1190, 1230, 1265];
            //debugPrint(seperatedScore);
            for(num in nums){
                num.x = ok[i];
                num.y = 320;
                if(is3D) {
                    //debugPrint(Paths.image('3dUi/num' + Std.string(seperatedScore[i]) + '-3d'));
                    num.loadGraphic(Paths.image('3dUi/num' + Std.string(seperatedScore[i]) + '-3d'));
                    num.antialiasing = false;
                }
                i++;
            }
            var all = [for(i in nums) i];
            var combo = game.members[game.members.indexOf(game.strumLineNotes)-4];
            var doAdd = FlxG.random.bool(50);
            combo.x = doAdd ? 975 : 878;
            combo.y = 208;
            if(is3D) {
                combo.loadGraphic(Paths.image('3dUi/combo-3d'));
                combo.antialiasing = false;
            }
            all.push(combo);
            var rating = game.members[game.members.indexOf(game.strumLineNotes)-5];
            rating.x = doAdd ? 975 : 878;
            rating.y = 283.55;
            if(is3D) {
                rating.loadGraphic(Paths.image('3dUi/'+daRating.image+'-3d'));
                rating.antialiasing = false;
            }
            all.push(rating);
            //example on what you can do :)
            for(spr in all){
                spr.alpha = 0.5;
                if(game.combo < 10) spr.visible = false;
            }
            rating.visible = true;
            //game.addTextToDebug(all, 0xFFFFFFFF);
        ]=])
    end
end
function onUpdateScore(miss)
    runHaxeCode([[
        if(ClientPrefs.scoreZoom && !]]..tostring(miss)..[[) {
            if(game.scoreTxtTween != null) {
				game.scoreTxtTween.cancel();
			}
            var scale = 1.3;
			game.scoreTxt.scale.set(scale, scale);
			game.scoreTxtTween = FlxTween.tween(game.scoreTxt.scale, {x: 1, y: 1}, 0.4, {
				onComplete: function(twn:FlxTween) {
					scoreTxtTween = null;
				},
                ease: FlxEase.backOut
			});
        }
    ]])
end
function onCountdownTick(what)
    local scale = 1
    local funcs = {
        [1] = function()
            setObjectCamera('countdownReady', 'game')
            scaleObject('countdownReady', scale, scale)
            screenCenter 'countdownReady'
        end,
        [2] = function()
            setObjectCamera('countdownSet', 'game')
            scaleObject('countdownSet', scale, scale)
            screenCenter 'countdownSet'
            setProperty('countdownSet.y', getProperty 'countdownSet.y' + 50)
            setProperty('countdownSet.x', getProperty 'countdownSet.x' - 50)
        end,
        [3] = function()
            setObjectCamera('countdownGo', 'game')
            runHaxeCode([[
                game.countdownGo.frames = Paths.getSparrowAtlas('goAnim');
                game.countdownGo.animation.addByPrefix('idle', 'G', 24, false);
                game.countdownGo.animation.play('idle');
            ]])
            scale = 1.7
            scaleObject('countdownGo', 0.7 * scale, 0.7 * scale)
            screenCenter 'countdownGo'
            setProperty('countdownGo.y', getProperty 'countdownGo.y' + 50)
            runHaxeCode([[
                game.dad.playAnim(game.dad.animOffsets.exists('hey') ? 'hey' : 'idle');
                game.boyfriend.playAnim(game.boyfriend.animOffsets.exists('hey') ? 'hey' : 'idle');
            ]])
        end,
        [4] = function()
            runHaxeCode 'game.moveCameraSection();'
            if hasCredits then
                doTweenX('klajshdfklhasdklfjhasd', 'creditsBox', 0, 0.4, 'backOut')
                timer(3.25, function()
                    doTweenX('klajshdfklhasdklfjhasd', 'creditsBox', -426, 0.4, 'backIn')
                    timer(0.4, function()
                        hasCredits = false
                        removeLuaSprite('creditsTxtBox', true)
                        removeLuaSprite('creditsBox', true)
                    end)
                end)
            end
        end
    }
    if funcs[what] then funcs[what]() end
end
--eztimer reborn!!!!
_timers = {count = 0}
function timer(time, callback, tag)
    local taggy = tag or _timers.count..'_SUPER AWESOIME TIMER'
    runTimer(taggy, time)
    _timers[taggy] = callback
    _timers.count = _timers.count + 1
end
function onTimerCompleted(tag)
    if _timers[tag] then
        _timers[tag]()
        _timers[tag] = nil
    end
end
function onEvent(n, v1, v2)
    if n == 'Change Character' then
        runHaxeCode([[
            iconP1.changeIcon(game.boyfriend.healthIcon);
            iconP1.antialiasing = game.boyfriend.antialiasing;
            iconP2.changeIcon(game.dad.healthIcon);
            iconP2.antialiasing = game.dad.antialiasing;
        ]])
    end
end