function onUpdate()

doTweenAlpha('AlphaTween1', 'beatline', 0, 0.001)

doTweenAlpha('AlphaTween2', 'Beatline', 0, 0.001)

--making the timebar bounce every 4 beats

--works best with the default icon bounce

if curBeat % 4 == 0 then

setProperty('timeTxt.scale.x', getProperty('iconP1.scale.x'))

setProperty('timeTxt.scale.y', getProperty('iconP1.scale.y'))

end

end

--EVERYTHING below is made by SameTheta

function onUpdatePost()

--timer variables

--getting song length in seconds

local timeElapsed = math.floor(getProperty('songTime')/1000)

local timeTotal = math.floor(getProperty('songLength')/1000)

--timeTxt updates (string.format puts it into mm:ss format)

setTextString('timeTxt', string.format("%.2d:%.2d", timeElapsed/60%60, timeElapsed%60) .. ' / ' .. string.format("%.2d:%.2d", timeTotal/60%60, timeTotal%60))

end