function onCreate()
    precacheImage("notes/NOTE_assets_3D")
end

function onUpdate(elapsed)
    if boyfriendName == 'bambi-3d-playable' or boyfriendName == 'expunged-3d-playable' or boyfriendName == 'unfair-3d-playable' or boyfriendName == 'dave-angey-playable' then --or boyfriendName == '3d-bf-alg' or boyfriendName == '3d-bf' then 
        for i = 0, getProperty('playerStrums.length')-1 do
		    setPropertyFromGroup('playerStrums', i, 'texture', 'notes/NOTE_assets_3D');
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') and getPropertyFromGroup('unspawnNotes', i,'noteType') == '' then
			    setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/NOTE_assets_3D');
			end
		end
    end
        for notesLength = 0,getProperty('notes.length') do
            if getPropertyFromGroup('notes', notesLength,'mustPress') == false and getPropertyFromGroup('notes', notesLength,'noteType') == '' then
                setPropertyFromGroup('notes',notesLength,'texture','notes/NOTE_assets_3D')
             end
         end
    end
    if boyfriendName == 'bambi-3d-playable' or boyfriendName == 'unfair-3d-playable' or boyfriendName == 'dave-angey-playable' then
        songPos = getSongPosition()
        local currentBeat = (songPos/1000)*(bpm/180)
        doTweenY('dadTweenY', 'boyfriend', 200 - 80*math.sin((currentBeat*0.25)*math.pi),0.001)
    end

fr = 0
function onUpdatePost(elapsed)
    if boyfriendName == 'expunged-3d-playable' then
        fr = fr + elapsed
	    setProperty('boyfriend.x',getProperty('boyfriend.x') + math.sin(fr*1.2) * 5);
	    setProperty('boyfriend.y',getProperty('boyfriend.y') + math.sin(fr*2.5) * 10);
    end
end

function onCreatePost()
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noteType') ~= '3d_notes' then
		    if getPropertyFromGroup('unspawnNotes', i, 'mustPress') and math.random(0, 2) == 1 then
			    setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/NOTE_assets_3D'); --Change texture
            end
		end
	end
        for strumLineNotes = 0,7 do
            if strumLineNotes < 4 then
                setPropertyFromGroup('strumLineNotes', strumLineNotes,'texture','notes/NOTE_assets_3D')
            end
        end
    end
--function goodNoteHit(i, d)
--    runHaxeCode("game.playerStrums.members["..d.."].playAnim('static', true);")
--end