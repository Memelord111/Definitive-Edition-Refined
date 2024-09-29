function onUpdate()
    if curStep >= 0 and dadName == 'dave-3d' then
        songPos = getSongPosition()
        local currentBeat = (songPos/1000)*(bpm/180)
        doTweenY('dadTweenY', 'dad', 90 - 40*math.sin((currentBeat*0.25)*math.pi),0.001)
    end
    if curStep == 608 then
        cancelTween('dadTweenY')
    end
end

--function onCreatePost()
--    setProperty('defaultCamZoom',0.75)
--end