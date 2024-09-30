function onUpdate(elapsed)
songPos = getSongPosition()
		local currentBeat = (songPos/5000)*(curBpm/60)
if curBeat > 304 then
		doTweenY('opponentmove', 'dad', 50, 5)

end
if curBeat > 367 then
		doTweenY('opponentmove', 'dad', 300, 0.5)
end
if curBeat > 464 then
		doTweenY('opponentmove', 'dad', 50, 3)

end
if curBeat > 495 then
		doTweenY('opponentmove', 'dad', 300, 0.5)
end
if curBeat > 624 then
		doTweenY('opponentmove', 'dad', 50, 5)

end
if curBeat > 687 then
		doTweenY('opponentmove', 'dad', 300, 0.5)
end
end
