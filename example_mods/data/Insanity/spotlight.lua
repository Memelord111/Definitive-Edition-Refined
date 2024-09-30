function onCreate()
    makeLuaSprite('DarkEffect', 'Bambi/NightEffect', 0, 0)
	addLuaSprite('DarkEffect', true)
	setObjectCamera('DarkEffect', 'camgame')
	setProperty('DarkEffect.scale.x', 12.5);
    setProperty('DarkEffect.scale.y', 12.5);
    setProperty('DarkEffect.visible', false)

    makeLuaSprite('spotlight','bambi/spotlight', -80, -200)
	setLuaSpriteScrollFactor('spotlight', 1, 1)
    addLuaSprite('spotlight', true)
    setObjectOrder('spotlight', getObjectOrder('DarkEffect') + 500)
    setProperty('spotlight.visible', false)
end

function onUpdate(elapsed)
    if curStep == 896 then
        setProperty('spotlight.visible', true)   
        cameraFlash('hud', 'FFFFFF', 1)
        setProperty('DarkEffect.visible', true)
        setObjectOrder('dadGroup', getObjectOrder('DarkEffect') + 1)
        setProperty('NightEffect.visible', false)
    end
    if curStep == 960 then
        setObjectOrder('boyfriendGroup', getObjectOrder('DarkEffect') + 1)
        doTweenX('spotlightMoveToBF', 'spotlight', 800, 1, 'smootherStepInOut')
        setProperty('NightEffect.visible', false)
        setObjectOrder('dadGroup', getObjectOrder('DarkEffect') - 1)
    end
    if curStep == 1024 then
        setProperty('spotlight.visible', false)
        setProperty('DarkEffect.visible', false)
        cameraFlash('hud', 'FFFFFF', 1)
        setProperty('NightEffect.visible', true)
    end
end

function onMoveCamera(focus)
    if focus == 'boyfriend' then
        doTweenX('spotlightMoveToBF', 'spotlight', -120, 0.7, 'smootherStepInOut')
        cancelTween('spotlightMoveToDad')
        runTimer('waitforchange1', 0.45)
        runTimer('waitforback1', 0.25)
    end
    if focus == 'dad' then
        doTweenX('spotlightMoveToDad', 'spotlight', 100, 0.7, 'smootherStepInOut')
        cancelTween('spotlightMoveToBF')
        runTimer('waitforchange2', 0.45)
        runTimer('waitforback2', 0.25)
    end
end

function onTimerCompleted(tag)
    if tag == 'waitforchange1' then
        setObjectOrder('boyfriendGroup', getObjectOrder('spotlight') - 1)
        setObjectOrder('boyfriendGroup', getObjectOrder('DarkEffect') + 1)
    end

    if tag == 'waitforchange2' then
        setObjectOrder('dadGroup', getObjectOrder('spotlight') - 1)
        setObjectOrder('dadGroup', getObjectOrder('DarkEffect') + 1)
    end

    if tag == 'waitforback1' then
        setObjectOrder('dadGroup', getObjectOrder('DarkEffect') - 1)
    end

    if tag == 'waitforback2' then
        setObjectOrder('boyfriendGroup', getObjectOrder('DarkEffect') - 1)
    end

    if curStep == 1 then
        return Function_Stop;
    end
end