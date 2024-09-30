local allowCountdown = false
local allowEndShit = false

function onCreatePost()
	addCharacterToList('dave-3dcut')
	precacheImage('redskyinsanity')
	precacheImage('redskybg')
	precacheSound('static')
end

function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'DaveDialogue');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end

function onEndSong()
 if not allowEndShit and isStoryMode and not seenCutscene then
  setProperty('inCutscene', true);
  startDialogue('enddialogue', 'DaveDialogue'); 
  allowEndShit = true;
  return Function_Stop;
 end
 return Function_Continue;
end



function onStepHit()
	if curStep == 787 then
		addLuaSprite('redskyinsanity', false)
		playSound('static', 20, 'stat')
	end
	if curStep == 790 then
		removeLuaSprite('redskyinsanity', false)
		stopSound('stat')
	end
	if curStep == 797 then
		addLuaSprite('redskyinsanity', false)
		playSound('static', 20, 'stats')
	end
	if curStep == 800 then
		removeLuaSprite('redskyinsanity', false)
		stopSound('stats')
	end
	if curStep == 345345 then
		addLuaSprite('redskybg', true)
		playSound('static', 20, 'staty')
	end
	if curStep == 345345 then
		stopSound('staty')
	end
end


