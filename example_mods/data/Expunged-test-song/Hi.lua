local allowCountdown = false
local username = os.getenv('USERNAME');

function onStartCountdown()
    for i = 0, getProperty('unspawnNotes.length')-1 do
		if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/NOTE_assets_3D'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'antialiasing', false)
            setPropertyFromClass("openfl.Lib", "application.window.title", '[DATA EXPUNGED]')
		end
	end
end

function onSongStart()
    doTweenX('imaging', 'songSht', 0, 0.30, 'linear')
    doTweenX('imaging2', 'songSht2', 0, 0.30, 'linear')
    doTweenX('imaging3', 'cred', 240, 0.30, 'linear')
    doTweenX('imaging4', 'cred2', 240, 0.30, 'linear')
    doTweenX('imaging5', 'originalname', 0, 0.30, 'linear')
    doTweenX('imaging6', 'originalname2', 0, 0.30, 'linear')
    runTimer('fallback', 3.41)
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'fallback' then
        doTweenX('imaging7', 'songSht', -300, 0.30, 'linear')
        doTweenX('imaging8', 'songSht2', -300, 0.30, 'linear')
        doTweenX('imaging9', 'cred', -140, 0.30, 'linear')
        doTweenX('imaging10', 'cred2', -140, 0.30, 'linear')
        doTweenX('imaging11', 'originalname', -300, 0.30, 'linear')
        doTweenX('imaging12', 'originalname2', -300, 0.30, 'linear')
    end
end

function goodNoteHit()
    setProperty('health', getProperty('health')+0.02);
end

function onCreate()
    makeLuaSprite('uglyHB', 'HELLthBar', 0, 0)
	setObjectCamera('uglyHB', 'hud')
	setScrollFactor('uglyHB', 1, 1)
	
	addLuaSprite('uglyHB', true)

    makeLuaSprite('white', 'white', -1000, -500)
    setObjectCamera('white', 'game')
    scaleObject('white', 5, 5)
    addLuaSprite('white', true)
    setProperty('white.alpha', 0)

    makeLuaSprite('cred', 'expunged/Oxygen', -140, 180)
    setObjectCamera('cred', 'other')
    scaleObject('cred', 0.5, 0.5)
    setProperty('cred.alpha', 1)
    addLuaSprite('cred', true)

    makeLuaSprite('cred2', 'icons/exp', -50, 180)
    setObjectCamera('cred2', 'other')
    scaleObject('cred2', 0.5, 0.5)
    setProperty('cred2.alpha', 0)
    addLuaSprite('cred2', true)

    makeAnimatedLuaSprite('songSht', 'Expunged/expungedHeading', -300, 180)
    luaSpriteAddAnimationByPrefix('songSht', 'anim', 'Expunged', 24, true);
    scaleObject('songSht', 0.67, 0.5);
    setObjectCamera('songSht', 'other')
    objectPlayAnim('songSht', 'anim', true)
    addLuaSprite('songSht', false)

    makeAnimatedLuaSprite('songSht2', 'Expunged/expungedHeading', -300, 180)
    luaSpriteAddAnimationByPrefix('songSht2', 'anim2', 'Expunged', 24, true);
    scaleObject('songSht2', 0.7, 0.5);
    setObjectCamera('songSht2', 'other')
    setProperty('songSht2.alpha', 0)
    objectPlayAnim('songSht2', 'anim2', true)
    addLuaSprite('songSht2', false)

    setPropertyFromClass('ClientPrefs', 'ghostTapping', false)
end

function onCreatePost()
    makeLuaText('songname', 'You wont survive' .. username .. '!', 0, 0, 700)
    addLuaText('songname')

    makeLuaText('originalname', 'Song by Oxygen', 0, -300, 185)
    setTextSize('originalname', 30)
    setObjectCamera('originalname', 'other')
    setTextFont('originalname', 'comic.ttf')
    addLuaText('originalname')

    makeLuaText('originalname2', 'Song by EXPUNGED', 0, -300, 185)
    setTextSize('originalname2', 30)
    setObjectCamera('originalname2', 'other')
    setTextFont('originalname2', 'comic.ttf')
    addLuaText('originalname2')
    setProperty('originalname2.alpha', 0)
    for i = 0, getProperty('unspawnNotes.length')-1 do
		if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/NOTE_assets_3D'); --Change texture
		end

		if getPropertyFromGroup('unspawnNotes', i, 'mustPress') and math.random(0, 2) == 1 then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/NOTE_assets_3D'); --Change texture
		end
	end
    --Fucker's Healthbar
    setProperty('uglyHB.alpha',  getPropertyFromClass('ClientPrefs', 'healthBarAlpha'))

    setProperty('uglyHB.x', getProperty('healthBar.x') - 4)

    setProperty('uglyHB.angle', getProperty('healthBar.angle'))
    setProperty('uglyHB.y', getProperty('healthBar.y') - 3)
    setProperty('uglyHB.scale.x', getProperty('healthBar.scale.x'))
    setProperty('uglyHB.scale.y', getProperty('healthBar.scale.y'))
    setObjectOrder('uglyHB', 4)
	setObjectOrder('healthBar', 3)
	setObjectOrder('healthBarBG', 2)
	setProperty('healthBarBG.visible', false)
    setHealthBarColors('ff0000', '00ff00');
end

function onUpdate(elapsed)
	setProperty('iconP2.antialiasing', false)
    setProperty('healthBarBG.scale.x', 1)
	setProperty('healthBarBG.scale.y', 1)
	setProperty('healthBar.scale.x', 1)
	setProperty('healthBar.scale.y', 1)
	health = getProperty('health')
	if health >= 0 then
		for i=0,4,1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', 'notes/NOTE_assets_3D')
			setPropertyFromGroup('opponentStrums', i, 'antialiasing', false)
		end
	end
end

function onCountdownTick(swagCounter)
    if swagCounter == 3 then
        playSound('introSounds/ex/introGo_weird', 1)
    end
end

function onBeatHit()
    --math.randomseed(curBeat * 4)
    --fontName = string.format('fonts-%i', math.random(1, 3))
    --setTextFont('scoreTxt', fontName)
    --setTextFont('timeTxt', fontName)
    --setTextFont('songname', fontName)
    --setTextFont('songname2', fontName)
    --setTextFont('songname3', fontName)
    --local fontTable = {'barcode', 'comic', 'wingding'}
    --setTextFont('scoreTxt', fontTable[getRandomInt(1, #fontTable)]..'.ttf')
    --setTextFont('timeTxt', fontTable[getRandomInt(1, #fontTable)]..'.ttf')
    --setTextFont('songname', fontTable[getRandomInt(1, #fontTable)]..'.ttf')
    --setTextFont('songname2', fontTable[getRandomInt(1, #fontTable)]..'.ttf')
    --setTextFont('songname3', fontTable[getRandomInt(1, #fontTable)]..'.ttf')
end

function onStepHit()
    if curStep == 13 then
        playSound('static', 1)
        setProperty('originalname.alpha', 0)
        setProperty('originalname2.alpha', 1)
        setProperty('cred.alpha', 0)
        setProperty('cred2.alpha', 1)
        setProperty('songSht.alpha', 0)
        setProperty('songSht2.alpha', 1)
    end
    if curStep == 20 then
        playSound('static', 1)
        setProperty('originalname.alpha', 1)
        setProperty('originalname2.alpha', 0)
        setProperty('cred.alpha', 1)
        setProperty('cred2.alpha', 0)
        setProperty('songSht.alpha', 1)
        setProperty('songSht2.alpha', 0)
    end
    if curStep == 25 then
        playSound('static', 1)
        setProperty('originalname.alpha', 0)
        setProperty('originalname2.alpha', 1)
        setProperty('cred.alpha', 0)
        setProperty('cred2.alpha', 1)
        setProperty('songSht.alpha', 0)
        setProperty('songSht2.alpha', 1)
    end
end