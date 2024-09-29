function opponentNoteHit(id, dir, noteType, sus)
    if noteType == 'Phone Note' and not sus then
        characterPlayAnim('dad', 'pre-attack')
        setProperty('dad.specialAnim', true)
    end
end
function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Blammed Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Phone Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_Phone'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
	--debugPrint('Script started!')
end
function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    if noteType == 'PhoneThrow' then
        setObjectOrder('dadGroup', getObjectOrder('boyfriendGroup') + 1)
        triggerEvent('Play Animation', 'attack', 'Dad')
        noteTweenAlpha('alphaTween', noteData + 4, 0, 0.01, 'linear')
        triggerEvent('Play Animation', 'hurt', 'BF')
        runTimer('fadebackwait', 3)
        function onTimerCompleted(tag, loops, loopsLeft)
            if tag == 'fadebackwait' then
                for i = 4,7 do
                    if isSustainNote == false then
                        noteTweenAlpha('alphaTween2'..i, i, 1, 5, 'easeInExpo')
                    else
                        noteTweenAlpha('alphaTween3'..i, i, 0.4, 5, 'easeInExpo')
                    end
                end
            end
        end
    end
end