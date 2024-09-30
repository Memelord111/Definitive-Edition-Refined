function onCreatePost()
    setTimeBarColors('00FF00', '808080');
    setProperty('timeTxt.visible', true);

    setTextString('botplayTxt', "BOTPLAY");

    makeLuaText('watermark', ''..songname..'', 0, 4, getProperty('healthBarBG.y') + 55);
    setTextBorder("watermark", 0.0, '000000')
    addLuaText('watermark');

    --setProperty('scoreTxt.y', 690);
end

function onUpdatePost()

    local ratePercent = getProperty('ratingPercent')

    local ratingFull = math.max(ratePercent * 100, 0)

    local ratingFullAsStrAlt = string.format("%.2f", ratingFull) --Shows accuracy fully.

    local ratingFullAsStr = string.format('%.0f%%', rating * 100)
    local BeforeScore = 'Score:' .. score .. ' | Misses:' .. getProperty('songMisses') .. ' | Accuracy:0%'
    local FinalScore = 'Score:' .. score .. ' | Misses:' .. getProperty('songMisses') .. ' | Accuracy:'..ratingFullAsStrAlt..'%'


	setObjectOrder('healthBar', 1)
	setObjectOrder('healthBarBG', 2)
        
        setProperty('grpNoteSplashes.visible', false)
        
        scaleObject('scoreTxt',1,1)

	setObjectOrder('timeBar', 1)
	setObjectOrder('timeBarBG', 2)

        setProperty('botplayTxt.y', 500);
        setProperty('botplayTxt.x', 405);
        setProperty('timeBar.x', 360);
        setProperty('timeBarBG.x', 355);


        setProperty('botplayTxt.y', 500);

   if ratingName == '?' then

        setTextString('scoreTxt', BeforeScore)

    else

        setTextString('scoreTxt', FinalScore)
end
end