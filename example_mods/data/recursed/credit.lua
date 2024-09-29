function onCreate()
    makeLuaSprite('creditsheading', 'songHeadings/recursedHeading', -1010, 203)	--ur heading sprite
    scaleObject('creditsheading', 1, 1)
    setObjectCamera('creditsheading', 'camHUD')
    addLuaSprite('creditsheading', true)
    addAnimationByPrefix('creditsheading', false)
    objectPlayAnimation('creditsheading', false)

    makeLuaSprite('creditscreator', 'title/credits/icons/Contributors/Aadsta', -650, 203)	--ur credit icon sprite
    scaleObject('creditscreator', 0.4, 0.4)
    setObjectCamera('creditscreator', 'camHUD')
    addLuaSprite('creditscreator', true)
end

function onCreatePost()
makeLuaText('songby', 'Song by AadstaPinwheel', -1000, -1000, 203)	--credit
setTextSize('songby', 31)
setObjectCamera('songby', 'camHUD')
addLuaText('songby', true)
setTextFont('songby', 'comic.ttf')
end

function onSongStart()
doTweenX('creditsheadingx','creditsheading' , -10 , 0.5, 'backInOut')
doTweenX('songbyx','songby' ,0 , 0.5, 'backInOut')
doTweenX('creditscreatorx','creditscreator' , 359 , 0.5, 'backInOut')
end

function onUpdate(elapsed)
if curBeat == 4 then
setProperty('creditscreator.alpha', 1)    
setProperty('songby.alpha', 1)   
elseif curStep == 35 then
doTweenX('creditsheadingx','creditsheading' , -1010 , 1, 'backIn')
doTweenX('songbyx','songby' , -1000 , 1, 'backIn')
doTweenX('creditscreatorx','creditscreator' , -780 , 1, 'backIn')
end
end