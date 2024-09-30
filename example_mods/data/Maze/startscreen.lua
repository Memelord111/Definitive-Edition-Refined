function onCreate()
    makeLuaSprite('fade','darknesss', 0, 0);
    setProperty('fade.scale.x', 12.5);
    setProperty('fade.scale.y', 12.5);
    addLuaSprite('fade', false);
    setObjectCamera('fade', 'hud')
    
end

function onSongStart()
    doTweenAlpha('fadein', 'fade', 0, 0, 'cubeIn')
end

function onStepHit()
    if curStep == 13 then
    doTweenAlpha('fadein', 'fade', 0, 9.4, 'cubeIn')
    end    
if curStep == 2432 then
        cameraFade('hud', '000000', 3.8)
    end
end
