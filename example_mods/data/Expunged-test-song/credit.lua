function onCreate()
    makeAnimatedLuaSprite('creditsheading', 'Expunged/expungedHeading', -1010, 200)
    scaleObject('creditsheading', 0.7, 0.7)
    setObjectCamera('creditsheading', 'camHUD')
    addLuaSprite('creditsheading', true)
    addAnimationByPrefix('creditsheading', true)
    objectPlayAnimation('creditsheading', false)

    makeLuaSprite('creditscreator', 'credits/MoldyGH', -640, 187)
    scaleObject('creditscreator', 0.4, 0.4)
    setObjectCamera('creditscreator', 'camHUD')
    addLuaSprite('creditscreator', true)
end

function onCreatePost()
makeLuaText('songby', 'Song by MoldyGH', -1000, -1000, 195)
setTextSize('songby', 27)
setObjectCamera('songby', 'camHUD')
addLuaText('songby', true)
setTextFont('songby', 'comic.ttf')
end

function onSongStart()
doTweenX('creditsheadingx','creditsheading' , -10 , 0.5, 'backInOut')
doTweenX('songbyx','songby' , 0 , 0.5, 'backInOut')
doTweenX('creditscreatorx','creditscreator' , 235 , 0.5, 'backInOut')
end

function onUpdate(elapsed)
if curBeat == 4 then
setProperty('creditscreator.alpha', 1)    
setProperty('songby.alpha', 1)   
elseif curStep == 25 then
doTweenX('creditsheadingx','creditsheading' , -1010 , 1, 'backIn')
doTweenX('songbyx','songby' , -1000 , 1, 'backIn')
doTweenX('creditscreatorx','creditscreator' , -780 , 1, 'backIn')
end
end