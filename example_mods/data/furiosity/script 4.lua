function onCreatePost()

	setPropertyFromClass('ClientPrefs', 'ghostTapping', true)
	setPropertyFromClass('ClientPrefs', 'noteSplashes', false)
end

function onBeatHit()
	if curBeat == 608 then
    for i=0,4,1 do
        setPropertyFromGroup('opponentStrums', i, 'texture', 'notes/NOTE_assets')
    end
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
            setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/NOTE_assets');
			end
		end
	end
end