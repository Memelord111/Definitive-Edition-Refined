function opponentNoteHit()
	health = getProperty('health')
	if health > 0.02 then
		setProperty('health', health - 0.003);	
	end
end