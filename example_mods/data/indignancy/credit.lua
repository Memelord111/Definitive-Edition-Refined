function onCreate()
    makeLuaSprite('creditsheading', 'songHeadings/bambiHeading', -1010, 203)	--ur heading sprite
    scaleObject('creditsheading', 0.8, 0.5)
    setObjectCamera('creditsheading', 'camHUD')
    addLuaSprite('creditsheading', true)
    addAnimationByPrefix('creditsheading', false)
    objectPlayAnimation('creditsheading', false)

    makeLuaSprite('creditscreator', 'dave/MoldyGH', -650, 203)	--ur credit icon sprite
    scaleObject('creditscreator', 0.4, 0.4)
    setObjectCamera('creditscreator', 'camHUD')
    addLuaSprite('creditscreator', true)
end

function onCreatePost()
makeLuaText('songby', 'Song by MoldyGH', -1000, -1000, 203)	--credit
setTextSize('songby', 31)
setObjectCamera('songby', 'camHUD')
addLuaText('songby', true)
setTextFont('songby', 'comic.ttf')
end

function onSongStart()
doTweenX('creditsheadingx','creditsheading' , -10 , 0.5, 'backInOut')
doTweenX('songbyx','songby' ,0 , 0.5, 'backInOut')
doTweenX('creditscreatorx','creditscreator' , 259 , 0.5, 'backInOut')
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