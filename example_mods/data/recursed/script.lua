local counts = 0
local number = 0
local number2 = 0
local time = 31

local recursed = false
local callbackCancel = false
local allNotesHit = false
local randomNumberPicked = false
local thing = false
local shaking = false
local noteImages = {
    'notes/alphabet/ALPHANOTE_assets',
    'notes/alphabet/ALPHANOTE_assets2',
    'notes/alphabet/ALPHANOTE_assets3',
    'notes/alphabet/ALPHANOTE_assets4',
    'notes/alphabet/ALPHANOTE_assets5',
    'notes/alphabet/ALPHANOTE_assets6',
    'notes/alphabet/ALPHANOTE_assets7',
    'notes/alphabet/ALPHANOTE_assets8',
    'notes/alphabet/ALPHANOTE_assets9',
    'notes/alphabet/ALPHANOTE_assets10',
    'notes/alphabet/ALPHANOTE_assets11'
}

function onCreatePost()
	local texture = 'notes/' .. 'NOTE_recursed'

	for i = 0, 3 do setPropertyFromGroup('unspawnNotes', i, 'texture', texture) end
    for i = 0, getProperty('unspawnNotes.length') - 1 do
        if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
            setPropertyFromGroup('unspawnNotes', i, 'texture', texture)
        end
    end
    for i = 0, getProperty('unspawnNotes.length')-1 do
		if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/NOTE_recursed'); --Change texture
		end

		if getPropertyFromGroup('unspawnNotes', i, 'mustPress') and not getPropertyFromGroup('unspawnNotes', i, 'isSustainNote') and math.random(0, 5) == 1 then
--            getRandomInt(1,#noteImages)
--			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/NOTE_recursed'); --Change texture
            setPropertyFromGroup('unspawnNotes', i, 'texture', noteImages[getRandomInt(1,#noteImages)]); --Change texture
		end
	end
end

function onCreate()
    makeLuaSprite('whites', 'white', 0, 0)
    scaleObject('whites', screenWidth, screenHeight)
    setObjectCamera('whites', 'other')
    addLuaSprite('whites', true)

    makeLuaSprite('x1', 'recursed/recursedX', getProperty('boyfriend.x')+150, getProperty('boyfriend.y'))
    setProperty('x1.angle', 40)
    setScrollFactor('x1', 1, 1)
    addLuaSprite('x1', true)

    makeLuaSprite('x2', 'recursed/recursedX', getProperty('boyfriend.x'), getProperty('boyfriend.y'))
    setProperty('x2.angle', 0)
    setScrollFactor('x2', 1, 1)
    addLuaSprite('x2', true)

    makeLuaSprite('x3', 'recursed/recursedX', getProperty('boyfriend.x')+170, getProperty('boyfriend.y')+150)
    setProperty('x3.angle', 60)
    setScrollFactor('x3', 1, 1)
    addLuaSprite('x3', true)

    makeLuaSprite('x4', 'recursed/recursedX', getProperty('boyfriend.x')+250, getProperty('boyfriend.y')-150)
    setProperty('x4.angle', 100)
    setScrollFactor('x4', 1, 1)
    addLuaSprite('x4', true)

    makeLuaSprite('arrow', 'recursed/noteIcon', getProperty('healthBar.x')+100, getProperty('healthBar.y')-70)
    setObjectCamera('arrow', 'hud')
    scaleObject('arrow', 0.5, 0.5)
    addLuaSprite('arrow', true)

    makeLuaSprite('clock', 'recursed/timerIcon', getProperty('healthBar.x')+500, getProperty('healthBar.y')-70)
    setObjectCamera('clock', 'hud')
    scaleObject('clock', 0.5, 0.5)
    addLuaSprite('clock', true)

    makeLuaText('rawr', number, 200, getProperty('healthBar.x')-50, getProperty('healthBar.y')-70)
    setTextFont('rawr', 'comic.ttf')
    setTextSize('rawr', 40)
    addLuaText('rawr')

    makeLuaText('rawr2', time, 200, getProperty('healthBar.x')+350, getProperty('healthBar.y')-70)
    setTextFont('rawr2', 'comic.ttf')
    setTextSize('rawr2', 40)
    addLuaText('rawr2')

    setProperty('whites.alpha', 0)

    setProperty('arrow.visible', false)
    setProperty('rawr.visible', false)
    setProperty('rawr2.visible', false)
    setProperty('clock.visible', false)
    
    setProperty('x1.alpha', 0)
    setProperty('x2.alpha', 0)
    setProperty('x3.alpha', 0)
    setProperty('x4.alpha', 0)
end

function noteMiss(id, noteData, noteType, isSustainNote)
    if not isSustainNote then
        counts = counts + 1
        cameraShake('camGame', 0.05, 0.30)
    end
end

function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if recursed and not isSustainNote then
        number = number + 1
    end
end

function onUpdate(elapsed)
    if counts >= 5 and not recursed then
        recursed = true
        counts = counts - 5
    end
    if recursed and not shaking then
        if boyfriendName == 'boyfriend' or boyfriendName == 'bf' then
            triggerEvent('Change Character', 'bf', 'bf-recursed')
        elseif boyfriendName == 'bambi-new-playable' then
            triggerEvent('Change Character', 'bf', 'bambi-recursed')
        elseif boyfriendName == 'dave-playable' or boyfriendName == 'dave-insanity-playable' then
            triggerEvent('Change Character', 'bf', 'dave-recursed')
        elseif boyfriendName == 'dave-angey-playable' then
            triggerEvent('Change Character', 'bf', 'dave-3d-recursed')
        elseif boyfriendName == 'tristan' or boyfriendName == 'tristan-golden' then
            triggerEvent('Change Character', 'bf', 'tristan-recursed')
        end
        runTimer('callbacktimebby', 31)
        runTimer('remove thing', 1)
        runTimer('add0', 11)
        setProperty('arrow.visible', true)
        setProperty('rawr.visible', true)
        setProperty('rawr2.visible', true)
        setProperty('clock.visible', true)
        setProperty('whites.alpha', 1)
        doTweenAlpha('byew11', 'whites', 0, 1, 'linear')
        shaking = true
        goodNoteHit()
        time = getTimerShit()
--        runHaxeCode("game.callOnLuas('Flash', [1, 1]);"); <-- tryna figure out how to trigger custom events inside of a script
--        runHaxeCode("game.callOnLuas('tilt', [true, true]);");
--        setProperty('camGame.angle',  math.sin(0 / 100 * 2) * -20)
    end
    if shaking and recursed then
        cameraShake('camHUD', 0.003, 0.30)
        cameraShake('camGame', 0.003, 0.30)
    end
    if shaking and not recursed then
        cameraShake('camHUD', 0.0, 0.01)
        cameraShake('camGame', 0.0, 0.01)
        shaking = false
    end
    if recursed and not randomNumberPicked then
        thing = getRandomInt(10,100)
        randomNumberPicked = true
    end
    if number >= thing then
        allNotesHit = true
    end
    if not recursed and randomNumberPicked then
        randomNumberPicked = false
    end
    if allNotesHit == true then
        callbackCancel = true
    end
    if callbackCancel == true then
        if boyfriendName == 'bf-recursed' then
            triggerEvent('Change Character', 'bf', 'bf')
        elseif boyfriendName == 'bambi-recursed' then
            triggerEvent('Change Character', 'bf', 'bambi-new-playable')
        elseif boyfriendName == 'dave-recursed' then
            triggerEvent('Change Character', 'bf', 'dave-playable')
        elseif boyfriendName == 'dave-3d-recursed' then
            triggerEvent('Change Character', 'bf', 'dave-angey-playable')
        elseif boyfriendName == 'tristan-recursed' then
            triggerEvent('Change Character', 'bf', 'tristan')
        end
        cancelTimer('callbacktimebby')
        setProperty('arrow.visible', false)
        setProperty('rawr.visible', false)
        setProperty('rawr2.visible', false)
        setProperty('clock.visible', false)
        cancelTimer('remove thing')
        setProperty('whites.alpha', 1)
        doTweenAlpha('byew11', 'whites', 0, 1, 'linear')
        setProperty('camHUD.angle',0)
        setProperty('camGame.angle',0)
        setProperty('camHUD.x',0)
        setProperty('camGame.x',0)
        setProperty('camHUD.y',0)
        setProperty('camGame.y',0)
        setProperty('camHUD.angle', 0);
        recursed = false
        allNotesHit = false
        shaking = false
        counts = 0
        number = 0
        time = 31
        recursed = false
        callbackCancel = false
        allNotesHit = false
        randomNumberPicked = false
        thing = false
        shaking = false
    end
    if time == 0 then
        setProperty('health', -1)
    end
    if recursed then
        currentBeat = (getSongPosition() / 1000) * (bpm / 60);
        setProperty('camHUD.angle', 2 * math.sin(currentBeat * 0.56));
        setProperty('camGame.angle', 2 * math.sin(currentBeat * 0.56));
    else
        setProperty('camHUD.angle', 0);
    end
    if time <= 9 then
        setTextString('rawr2', number2..':0'..time)
    end
    if counts ~= 1 and not recursed then
        setProperty('x1.alpha', 1)
    end
    if counts ~= 2 and not recursed then
        setProperty('x2.alpha', 1)
    end
    if counts ~= 3 and not recursed then
        setProperty('x3.alpha', 1)
    end
    if counts ~= 4 and not recursed then
        setProperty('x4.alpha', 1)
    end
    if counts ~= 5 and not recursed then
        setProperty('x1.alpha', 0)
        setProperty('x2.alpha', 0)
        setProperty('x3.alpha', 0)
        setProperty('x4.alpha', 0)
    end
    if time <= 9 then
        setTextString('rawr2', number2..':0'..time)
    else
        setTextString('rawr2', number2..':'..time)
    end
    setTextString('rawr', number..'/'..thing)
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'callbacktimebby' then
        setProperty('health', -1)
        recursed = false
    end
    if tag == 'remove thing' then
        time = time - 1
        runTimer('remove thing', 1)
    end
    if tag == 'back' then
		doTweenAngle('circ', 'camGame', -40, 4, 'linear')
		runTimer('backagain', 1)
	end
	if tag == 'backagain' then
        doTweenAngle('circ', 'camGame', 40, 4, 'linear')
		runTimer('back', 1)
	end
end