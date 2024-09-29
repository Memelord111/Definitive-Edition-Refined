function onCreate()
    makeLuaSprite('creditsheading', 'songHeadings/daveHeading', -1010, 215)	--ur heading sprite
    scaleObject('creditsheading', 1.3, 0.7)
    setObjectCamera('creditsheading', 'camHUD')
    addLuaSprite('creditsheading', true)
    addAnimationByPrefix('creditsheading', false)
    objectPlayAnimation('creditsheading', false)

    makeLuaSprite('creditscreator', 'songCreators/Alexander Cooper 19', -650, 200)	--ur credit icon sprite
    scaleObject('creditscreator', 0.6, 0.6)
    setObjectCamera('creditscreator', 'camHUD')
    addLuaSprite('creditscreator', true)
end

function onCreatePost()
makeLuaText('songby', 'Song by Alexander Cooper 19', -1000, -1000, 210)	--credit
setTextSize('songby', 29.9)
setObjectCamera('songby', 'camHUD')
addLuaText('songby', true)
setTextFont('songby', 'comic.ttf')
end

function onSongStart()
doTweenX('creditsheadingx','creditsheading' , -10 , 0.5, 'backInOut')
doTweenX('songbyx','songby' ,0 , 0.5, 'backInOut')
doTweenX('creditscreatorx','creditscreator' , 430 , 0.5, 'backInOut')
end

function onUpdate(elapsed)
if curBeat == 4 then
setProperty('creditscreator.alpha', 1)    
setProperty('songby.alpha', 1)   
elseif curStep == 25 then
doTweenX('creditsheadingx','creditsheading' , -1010 , 1, 'backIn')
doTweenX('songbyx','songby' , -1000 , 1, 'backIn')
doTweenX('creditscreatorx','creditscreator' , -730 , 1, 'backIn')
end
end