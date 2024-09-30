local bounce = 1.05
local bounce2 = 1.15

function onUpdatePost()
    setProperty('iconP1.scale.y', (getProperty('iconP1.scale.y') - 1) / -bounce2 + 1)
    setProperty('iconP2.scale.y', (getProperty('iconP2.scale.y') - 1) / -bounce + 1)
    setProperty('iconP1.origin.y', 0)
    setProperty('iconP2.origin.y', 0)
    
if getProperty('health') <= 0.375 then
    bounce2 = 0.82
    bounce = 1.35
end
if getProperty('health') >= 1.350 then
    bounce2 = 1.29
    bounce = 0.92
end
if getProperty('health') >= 1.625 then
    bounce2 = 1.35
    bounce = 0.8
end
end

function onBeatHit()
   setProperty('iconP1.scale.x', bounce2*1.3)
   setProperty('iconP2.scale.x', bounce*1.3)
end
