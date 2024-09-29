

function opponentNoteHit()
		health = getProperty('health')
		setProperty('health', health- 0.006);
end

function onBeatHit()
	
end
function onEvent(n,v1,v2)
	if n == 'Flash Event' then
		playSound('static',0.8)
	end
end
function onTimerCompleted(t)
	if t == 'kaglitch' then
		removeLuaSprite('kaglitch',false)
	end

end
function onTweenCompleted(t)
	if t == 'blackout' then
         removeLuaSprite('blackout',false)
	end
end
function onSongStartno()
	
	runHaxeCode([[
        windowDad = Application.current.createWindow({
			title: 'Pink Expunged.json',
			width: 720,
			height: 600,
			borderless: true,
			alwaysOnTop: true

        });]])
		setTransparency(0x000f0f0f)
	runHaxeCode([[
		Application.current.window.focus();

        windowDad.stage.color = 0x000f0f0f;
        FlxG.mouse.useSystemCursor = true;
	    FlxG.autoPause = false;
		
		]])
end
function glitch()
    
	makeAnimatedLuaSprite('kaglitch','Expunged/glitchSwitch',0,0)
	addAnimationByPrefix('kaglitch','fuck','glitchScreen',24,true)
	addLuaSprite('kaglitch')
	setObjectCamera('kaglitch','hud')
	setObjectOrder('kaglitch',9999)
	scaleObject('kaglitch',4,3)
	setProperty('kaglitch.antialiasing',false)
	screenCenter('kaglitch','xy')
	runTimer('kaglitch',0.25)

end  
local window_default = {}
function onCreatePost()
	setPropertyFromClass('ClientPrefs', 'ghostTapping', false)
    setPropertyFromClass("openfl.Lib", "application.window.title","[Pink Expunged Attack]")
   window_default[1] = getPropertyFromClass("openfl.Lib", "application.window.x")
   window_default[2] = getPropertyFromClass("openfl.Lib", "application.window.y")

   addHaxeLibrary('Lib', 'openfl')

   addHaxeLibrary('Application', 'openfl.display')
   addHaxeLibrary('Application', 'lime.app')
   addHaxeLibrary('KeyCode', 'lime.ui')
   addHaxeLibrary('RenderContext', 'lime.graphics')
   addHaxeLibrary('Assets', 'openfl.utils')
   
   addHaxeLibrary('KeyModifier', 'lime.ui')
   
   addHaxeLibrary('FlxG', 'flixel')
   addHaxeLibrary('Matrix', 'openfl.geom')
   addHaxeLibrary('Rectangle', 'openfl.geom')
   addHaxeLibrary('Sprite', 'openfl.display')
	
	makeLuaSprite('hella','Expunged/HELLthBar',getProperty('healthBarBG.x'),getProperty('healthBarBG.y'))
	addLuaSprite('hella')
	setObjectCamera('hella','hud')
	setObjectOrder('hella',getObjectOrder('healthBarBG'))
	setProperty('healthBarBG.visible',false)
end
function blackout(time)
    
	makeLuaSprite('blackout','',0,0)
	makeGraphic('blackout', 5000, 5000, 'FFFFFF')
	addLuaSprite('blackout',false)
	screenCenter('blackout','xy')
	setObjectCamera('blackout','camHUD')
    setProperty('blackout.alpha',0) 
    doTweenAlpha('blackout','blackout',1,time,'circOut')
end
local modchart = true
local fakedefaultNotePos = {};

function onUpdatePost(elapsed)
  if curStep >= 6 then
	setProperty('iconbarAlt.x',getProperty('iconbar.x')+50)
  end
end 
fr = 0
function onUpdate(elapsed)
	fr = fr + elapsed
	
	
	if curStep >= 12280 and curStep <= 2080 then
	setPropertyFromClass("openfl.Lib", "application.window.y",(200 + math.sin(fr*0.4) * 100))
	bruhy = (70 + math.sin(fr*1.85) * 100)
	bruhx = (100 + math.sin(fr*0.7) * 100)
	runHaxeCode([[  
        
		var dadFrame = game.dad._frame;
		
		if (dadFrame == null || dadFrame.frame == null) return; // prevents crashes (i think???)
			
		var rect = new Rectangle(dadFrame.frame.x, dadFrame.frame.y, dadFrame.frame.width, dadFrame.frame.height);
		
		dadWin.scrollRect = rect;
		dadWin.x = (20 + ((dadFrame.offset.x) - (game.dad.offset.x / 2)) * dadWin.scaleX);
		dadWin.y = (50 + ((dadFrame.offset.y) - (game.dad.offset.y / 2)) * dadWin.scaleY);   

		windowDad.x = ]]..bruhx..[[;
		windowDad.y = ]]..bruhy..[[;
		]])	
	end


	
end

function onStepHit()
	if curStep == 11276 then
		blackout(0.38)
	end
    if curStep == 11140 then
		doTweenWindow("x",window_default[1],1.5,"expoInOut")
		doTweenWindow("y",window_default[2],1.5,"expoInOut")
		runHaxeCode([[
			windowDad.y = -5000;
		]])
	end
	if curStep == 11140 then
	    removeLuaSprite('blackout',false)
        setProperty('dad.visible',false)
		doTweenWindow("x",window_default[1] + 300,1,"circOut")

    runHaxeCode([[


        

            windowDad.x = 10;
            windowDad.y = 50;
         dadWin = new Sprite();
        var dadScrollWin = new Sprite();
        windowDad.stage.addEventListener("keyDown", FlxG.keys.onKeyDown);
        windowDad.stage.addEventListener("keyUp", FlxG.keys.onKeyUp);
        var m = new Matrix();

      

        
        dadWin.graphics.beginBitmapFill(game.dad.pixels, m);
        dadWin.graphics.drawRect(0, 0, game.dad.pixels.width, game.dad.pixels.height);
        dadWin.graphics.endFill();
        windowDad.stage.addChild(dadWin);
        dadWin.scaleX = 0.4;
        dadWin.scaleY = 0.4;

    ]])
	end
	if curStep == 8 then
		setProperty('iconbar.visible',false)
		makeAnimatedLuaSprite('iconbarAlt', nil, getProperty('iconbar.x')+90, getProperty('iconbar.y')-5)
		loadGraphic('iconbarAlt', 'icons/'..getProperty('dad.healthIcon'), 150)
		addAnimation('iconbarAlt', 'icons/'..getProperty('dad.healthIcon'), {0, 1}, 0, true)
		setObjectCamera('iconbarAlt', 'camHUD')
		scaleObject('iconbarAlt',0.5,0.5)
        setObjectOrder('iconbarAlt',getObjectOrder('textsong'))
		setTextString('textsong','Song by EXPUNGED')
		scaleObject('wall',0.9,0.5)
	end
	if curStep == 14 then
		setTextString('textsong','Song by Oxygen')
		setProperty('iconbar.visible',true)
		setProperty('iconbarAlt.visible',false)
		scaleObject('wall',0.75,0.5)
	end
	if curStep == 18 then
		setTextString('textsong','Song by EXPUNGED')
		setProperty('iconbar.visible',false)
		setProperty('iconbarAlt.visible',true)
		scaleObject('wall',0.9,0.5)
	end
	if curStep == 704 then
		glitch()
    end
	if curStep == 768 then
		glitch()
    end
	if curStep == 896 then
		glitch()
    end
	if curStep == 1152 then
		glitch()
    end


if modchart then
    if curStep == 704 then
		noteTweenX('note1',0,defaultPlayerStrumX3,0.5,'expoOut')
		noteTweenX('note2',1,defaultPlayerStrumX2,0.5,'expoOut')
		noteTweenX('note3',2,defaultPlayerStrumX0,0.5,'expoOut')
		noteTweenX('note4',3,defaultPlayerStrumX1,0.5,'expoOut')

		noteTweenX('altnote1',4,defaultOpponentStrumX2,0.5,'expoOut')
		noteTweenX('altnote2',5,defaultOpponentStrumX3,0.5,'expoOut')
		noteTweenX('altnote3',6,defaultOpponentStrumX1,0.5,'expoOut')
		noteTweenX('altnote4',7,defaultOpponentStrumX0,0.5,'expoOut')

		for i = 0,3 do
			noteTweenAngle('noteangle'..i,i,-360,0.2,'circOut')
		end
		for i = 4,7 do
			noteTweenAngle('noteangle'..i,i,360,0.2,'circOut')
		end
		for i = 0,7 do
			noteTweenY('notedown'..i,i,560,0.5,'expoOut')
			if not downscroll then
			noteTweenDirection('notedirec'..i,i,-90,0.1,'expoOut')
			else
			noteTweenDirection('notedirec'..i,i,90,0.1,'expoOut')
            end

		end
	end	
	if curStep == 768 then
		noteTweenX('note1',0,defaultOpponentStrumX0,0.5,'expoOut')
		noteTweenX('note2',1,defaultOpponentStrumX1,0.5,'expoOut')
		noteTweenX('note3',2,defaultOpponentStrumX3,0.5,'expoOut')
		noteTweenX('note4',3,defaultOpponentStrumX2,0.5,'expoOut')

		noteTweenX('altnote1',4,defaultPlayerStrumX0,0.5,'expoOut')
		noteTweenX('altnote2',5,defaultPlayerStrumX1,0.5,'expoOut')
		noteTweenX('altnote3',6,defaultPlayerStrumX3,0.5,'expoOut')
		noteTweenX('altnote4',7,defaultPlayerStrumX2,0.5,'expoOut')
		
	for i = 0,3 do
		noteTweenAngle('noteangle'..i,i,360,0.2,'circOut')
	end
	for i = 4,7 do
		noteTweenAngle('noteangle'..i,i,-360,0.2,'circOut')
	end
	end
	if curStep == 4184 then
		noteTweenX('note1',0,defaultPlayerStrumX3,0.5,'expoOut')
		noteTweenX('note2',1,defaultPlayerStrumX2,0.5,'expoOut')
		noteTweenX('note3',2,defaultPlayerStrumX0,0.5,'expoOut')
		noteTweenX('note4',3,defaultPlayerStrumX1,0.5,'expoOut')

		noteTweenX('altnote1',4,defaultOpponentStrumX2,0.5,'expoOut')
		noteTweenX('altnote2',5,defaultOpponentStrumX3,0.5,'expoOut')
		noteTweenX('altnote3',6,defaultOpponentStrumX1,0.5,'expoOut')
		noteTweenX('altnote4',7,defaultOpponentStrumX0,0.5,'expoOut')

		if not downscroll then
			noteTweenDirection('notedirec'..i,i,90,0.1,'expoOut')
			else
			noteTweenDirection('notedirec'..i,i,-90,0.1,'expoOut')
            end
			
	for i = 0,3 do
		noteTweenAngle('noteangle'..i,i,-360,0.2,'circOut')
	end
	for i = 4,7 do
		noteTweenAngle('noteangle'..i,i,360,0.2,'circOut')
	end
	end
	if curStep == 888 then
		noteTweenX('note1',0,defaultOpponentStrumX1,0.5,'expoOut')
		noteTweenX('note2',1,defaultOpponentStrumX2,0.5,'expoOut')
		noteTweenX('note3',2,defaultOpponentStrumX3,0.5,'expoOut')
		noteTweenX('note4',3,defaultOpponentStrumX0,0.5,'expoOut')

		noteTweenX('altnote1',4,defaultPlayerStrumX1,0.5,'expoOut')
		noteTweenX('altnote2',5,defaultPlayerStrumX2,0.5,'expoOut')
		noteTweenX('altnote3',6,defaultPlayerStrumX3,0.5,'expoOut')
		noteTweenX('altnote4',7,defaultPlayerStrumX0,0.5,'expoOut')
		
	for i = 0,3 do
		noteTweenAngle('noteangle'..i,i,360,0.2,'circOut')
	end
	for i = 4,7 do
		noteTweenAngle('noteangle'..i,i,-360,0.2,'circOut')
	end
	end
	if curStep == 892 then
		noteTweenX('note1',0,defaultPlayerStrumX0,0.5,'expoOut')
		noteTweenX('note2',1,defaultPlayerStrumX2,0.5,'expoOut')
		noteTweenX('note3',2,defaultPlayerStrumX3,0.5,'expoOut')
		noteTweenX('note4',3,defaultPlayerStrumX1,0.5,'expoOut')

		noteTweenX('altnote1',4,defaultOpponentStrumX0,0.5,'expoOut')
		noteTweenX('altnote2',5,defaultOpponentStrumX2,0.5,'expoOut')
		noteTweenX('altnote3',6,defaultOpponentStrumX3,0.5,'expoOut')
		noteTweenX('altnote4',7,defaultOpponentStrumX1,0.5,'expoOut')

		if not downscroll then
			noteTweenDirection('notedirec'..i,i,-90,0.1,'expoOut')
			else
			noteTweenDirection('notedirec'..i,i,90,0.1,'expoOut')
            end
			
	for i = 0,3 do
		noteTweenAngle('noteangle'..i,i,-360,0.2,'circOut')
	end
	for i = 4,7 do
		noteTweenAngle('noteangle'..i,i,360,0.2,'circOut')
	end
	end
	if curStep == 1018 then
		noteTweenX('note1',0,defaultPlayerStrumX3,0.5,'expoOut')
		noteTweenX('note2',1,defaultOpponentStrumX1,0.5,'expoOut')
		noteTweenX('note3',2,defaultOpponentStrumX0,0.5,'expoOut')
		noteTweenX('note4',3,defaultOpponentStrumX2,0.5,'expoOut')

		noteTweenX('altnote1',4,defaultOpponentStrumX3,0.5,'expoOut')
		noteTweenX('altnote2',5,defaultPlayerStrumX1,0.5,'expoOut')
		noteTweenX('altnote3',6,defaultPlayerStrumX0,0.5,'expoOut')
		noteTweenX('altnote4',7,defaultPlayerStrumX2,0.5,'expoOut')

		if not downscroll then
			noteTweenDirection('notedirec'..i,i,90,0.1,'expoOut')
			else
			noteTweenDirection('notedirec'..i,i,-90,0.1,'expoOut')
            end
			
	for i = 0,3 do
		noteTweenAngle('noteangle'..i,i,360,0.2,'circOut')
	end
	for i = 4,7 do
		noteTweenAngle('noteangle'..i,i,-360,0.2,'circOut')
	end
	end
	if curStep == 1020 then
		noteTweenX('note1',0,defaultOpponentStrumX0,0.5,'expoOut')
		noteTweenX('note2',1,defaultOpponentStrumX1,0.5,'expoOut')
		noteTweenX('note3',2,defaultPlayerStrumX0,0.5,'expoOut')
		noteTweenX('note4',3,defaultPlayerStrumX1,0.5,'expoOut')

		noteTweenX('altnote1',4,defaultOpponentStrumX2,0.5,'expoOut')
		noteTweenX('altnote2',5,defaultOpponentStrumX3,0.5,'expoOut')
		noteTweenX('altnote3',6,defaultPlayerStrumX2,0.5,'expoOut')
		noteTweenX('altnote4',7,defaultPlayerStrumX3,0.5,'expoOut')
		
	for i = 0,3 do
		noteTweenAngle('noteangle'..i,i,-360,0.2,'circOut')
	end
	for i = 4,7 do
		noteTweenAngle('noteangle'..i,i,360,0.2,'circOut')
	end
	end
	if curStep == 3304 then
		noteTweenX('note1',0,defaultPlayerStrumX2,0.5,'expoOut')
		noteTweenX('note2',1,defaultPlayerStrumX3,0.5,'expoOut')
		noteTweenX('note3',2,defaultPlayerStrumX0,0.5,'expoOut')
		noteTweenX('note4',3,defaultPlayerStrumX1,0.5,'expoOut')

		noteTweenX('altnote1',4,defaultOpponentStrumX2,0.5,'expoOut')
		noteTweenX('altnote2',5,defaultOpponentStrumX3,0.5,'expoOut')
		noteTweenX('altnote3',6,defaultOpponentStrumX0,0.5,'expoOut')
		noteTweenX('altnote4',7,defaultOpponentStrumX1,0.5,'expoOut')
		
	for i = 0,3 do
		noteTweenAngle('noteangle'..i,i,360,0.2,'circOut')
	end
	for i = 4,7 do
		noteTweenAngle('noteangle'..i,i,-360,0.2,'circOut')
	end
	end
	if curStep == 1022 then
		noteTweenX('note1',0,defaultPlayerStrumX3,0.5,'expoOut')
		noteTweenX('note2',1,defaultOpponentStrumX1,0.5,'expoOut')
		noteTweenX('note3',2,defaultOpponentStrumX3,0.5,'expoOut')
		noteTweenX('note4',3,defaultOpponentStrumX2,0.5,'expoOut')

		noteTweenX('altnote1',4,defaultPlayerStrumX1,0.5,'expoOut')
		noteTweenX('altnote2',5,defaultPlayerStrumX0,0.5,'expoOut')
		noteTweenX('altnote3',6,defaultPlayerStrumX2,0.5,'expoOut')
		noteTweenX('altnote4',7,defaultOpponentStrumX0,0.5,'expoOut')
		
	for i = 0,3 do
		noteTweenAngle('noteangle'..i,i,-360,0.2,'circOut')
	end
	for i = 4,7 do
		noteTweenAngle('noteangle'..i,i,360,0.2,'circOut')
	end
	end
	if curStep == 1088 then
		noteTweenX('note1',0,defaultOpponentStrumX2,0.5,'expoOut')
		noteTweenX('note2',1,defaultOpponentStrumX3,0.5,'expoOut')
		noteTweenX('note3',2,defaultOpponentStrumX1,0.5,'expoOut')
		noteTweenX('note4',3,defaultPlayerStrumX3,0.5,'expoOut')

		noteTweenX('altnote1',4,defaultOpponentStrumX0,0.5,'expoOut')
		noteTweenX('altnote2',5,defaultPlayerStrumX2,0.5,'expoOut')
		noteTweenX('altnote3',6,defaultPlayerStrumX0,0.5,'expoOut')
		noteTweenX('altnote4',7,defaultPlayerStrumX1,0.5,'expoOut')
		
	for i = 0,3 do
		noteTweenAngle('noteangle'..i,i,360,0.2,'circOut')
	end
	for i = 4,7 do
		noteTweenAngle('noteangle'..i,i,-360,0.2,'circOut')
	end
	end
	if curStep == 1120 then
		noteTweenX('note1',0,defaultOpponentStrumX0,0.5,'expoOut')
		noteTweenX('note2',1,defaultPlayerStrumX2,0.5,'expoOut')
		noteTweenX('note3',2,defaultPlayerStrumX0,0.5,'expoOut')
		noteTweenX('note4',3,defaultPlayerStrumX1,0.5,'expoOut')

		noteTweenX('altnote1',4,defaultOpponentStrumX2,0.5,'expoOut')
		noteTweenX('altnote2',5,defaultOpponentStrumX3,0.5,'expoOut')
		noteTweenX('altnote3',6,defaultOpponentStrumX1,0.5,'expoOut')
		noteTweenX('altnote4',7,defaultPlayerStrumX3,0.5,'expoOut')
		
	for i = 0,3 do
		noteTweenAngle('noteangle'..i,i,-360,0.2,'circOut')
	end
	for i = 4,7 do
		noteTweenAngle('noteangle'..i,i,360,0.2,'circOut')
	end
	end
	if curStep == 1144 then
		noteTweenX('note1',0,defaultOpponentStrumX2,0.5,'expoOut')
		noteTweenX('note2',1,defaultOpponentStrumX3,0.5,'expoOut')
		noteTweenX('note3',2,defaultOpponentStrumX1,0.5,'expoOut')
		noteTweenX('note4',3,defaultPlayerStrumX3,0.5,'expoOut')

		noteTweenX('altnote1',4,defaultOpponentStrumX0,0.5,'expoOut')
		noteTweenX('altnote2',5,defaultPlayerStrumX2,0.5,'expoOut')
		noteTweenX('altnote3',6,defaultPlayerStrumX0,0.5,'expoOut')
		noteTweenX('altnote4',7,defaultPlayerStrumX1,0.5,'expoOut')
		
	for i = 0,3 do
		noteTweenAngle('noteangle'..i,i,360,0.2,'circOut')
	end
	for i = 4,7 do
		noteTweenAngle('noteangle'..i,i,-360,0.2,'circOut')
	end
	end
	if curStep == 4448 then
		noteTweenX('note1',0,180,0.5,'expoOut')
	noteTweenX('note2',1,405,0.5,'expoOut')
	noteTweenX('note3',2,635,0.5,'expoOut')
	noteTweenX('note4',3,865,0.5,'expoOut')

	noteTweenX('altnote1',4,295,0.5,'expoOut')
	noteTweenX('altnote2',5,525,0.5,'expoOut')
	noteTweenX('altnote3',6,755,0.5,'expoOut')
	noteTweenX('altnote4',7,985,0.5,'expoOut')

	for i = 0,3 do
		noteTweenAngle('noteangle'..i,i,-360,0.2,'circOut')
	end
	for i = 4,7 do
		noteTweenAngle('noteangle'..i,i,360,0.2,'circOut')
	end
    end
	if curStep == 7209 then
		noteTweenX('note1',0,defaultOpponentStrumX3,0.5,'expoOut')
		noteTweenX('note2',1,defaultOpponentStrumX2,0.5,'expoOut')
		noteTweenX('note3',2,defaultOpponentStrumX1,0.5,'expoOut')
		noteTweenX('note4',3,defaultOpponentStrumX0,0.5,'expoOut')

		noteTweenX('altnote1',4,defaultPlayerStrumX3,0.5,'expoOut')
		noteTweenX('altnote2',5,defaultPlayerStrumX2,0.5,'expoOut')
		noteTweenX('altnote3',6,defaultPlayerStrumX1,0.5,'expoOut')
		noteTweenX('altnote4',7,defaultPlayerStrumX0,0.5,'expoOut')

		for i = 0,3 do
			noteTweenAngle('noteangle'..i,i,360,0.2,'circOut')
		end
		for i = 4,7 do
			noteTweenAngle('noteangle'..i,i,-360,0.2,'circOut')
		end
		for i = 0,7 do

			noteTweenY('notedown'..i,i,560,0.5,'expoOut')
			if not downscroll then
				noteTweenDirection('notedirec'..i,i,-90,0.1,'expoOut')
				else
				noteTweenDirection('notedirec'..i,i,90,0.1,'expoOut')
				end

		end
	end
	if curStep == 7289 then
		noteTweenX('note1',0,defaultOpponentStrumX0,0.5,'expoOut')
		noteTweenX('note2',1,defaultOpponentStrumX2,0.5,'expoOut')
		noteTweenX('note3',2,defaultOpponentStrumX3,0.5,'expoOut')
		noteTweenX('note4',3,defaultOpponentStrumX1,0.5,'expoOut')

		noteTweenX('altnote1',4,defaultPlayerStrumX0,0.5,'expoOut')
		noteTweenX('altnote2',5,defaultPlayerStrumX2,0.5,'expoOut')
		noteTweenX('altnote3',6,defaultPlayerStrumX3,0.5,'expoOut')
		noteTweenX('altnote4',7,defaultPlayerStrumX1,0.5,'expoOut')

		for i = 0,3 do
			noteTweenAngle('noteangle'..i,i,-360,0.2,'circOut')
		end
		for i = 4,7 do
			noteTweenAngle('noteangle'..i,i,360,0.2,'circOut')
		end
		for i = 0,7 do

			noteTweenY('notedown'..i,i,50,0.5,'expoOut')
			if not downscroll then
				noteTweenDirection('notedirec'..i,i,90,0.1,'expoOut')
				else
				noteTweenDirection('notedirec'..i,i,-90,0.1,'expoOut')
				end
		end
	end
	if curStep == 1824 then
	
		for i = 0,3 do
			noteTweenAngle('noteangle'..i,i,360,0.2,'circOut')
		end
		for i = 4,7 do
			noteTweenAngle('noteangle'..i,i,-360,0.2,'circOut')
		end	
		for i = 0,7 do

			noteTweenY('notedown'..i,i,50,0.5,'expoOut')
		end
		noteTweenX('note1',0,defaultOpponentStrumX2,0.5,'expoOut')
		noteTweenX('note2',1,defaultOpponentStrumX3,0.5,'expoOut')
		noteTweenX('note3',2,defaultOpponentStrumX1,0.5,'expoOut')
		noteTweenX('note4',3,defaultPlayerStrumX3,0.5,'expoOut')

		noteTweenX('altnote1',4,defaultOpponentStrumX0,0.5,'expoOut')
		noteTweenX('altnote2',5,defaultPlayerStrumX2,0.5,'expoOut')
		noteTweenX('altnote3',6,defaultPlayerStrumX0,0.5,'expoOut')
		noteTweenX('altnote4',7,defaultPlayerStrumX1,0.5,'expoOut')
	end
	if curStep == 1840 then
		noteTweenX('note1',0,defaultPlayerStrumX2,0.5,'expoOut')
		noteTweenX('note2',1,defaultPlayerStrumX3,0.5,'expoOut')
		noteTweenX('note3',2,defaultPlayerStrumX0,0.5,'expoOut')
		noteTweenX('note4',3,defaultPlayerStrumX1,0.5,'expoOut')

		noteTweenX('altnote1',4,defaultOpponentStrumX2,0.5,'expoOut')
		noteTweenX('altnote2',5,defaultOpponentStrumX3,0.5,'expoOut')
		noteTweenX('altnote3',6,defaultOpponentStrumX0,0.5,'expoOut')
		noteTweenX('altnote4',7,defaultOpponentStrumX1,0.5,'expoOut')
	end
	if curStep == 1864 then
		noteTweenX('note1',0,defaultPlayerStrumX3,0.5,'expoOut')
		noteTweenX('note2',1,defaultOpponentStrumX1,0.5,'expoOut')
		noteTweenX('note3',2,defaultOpponentStrumX0,0.5,'expoOut')
		noteTweenX('note4',3,defaultOpponentStrumX2,0.5,'expoOut')

		noteTweenX('altnote1',4,defaultOpponentStrumX3,0.5,'expoOut')
		noteTweenX('altnote2',5,defaultPlayerStrumX1,0.5,'expoOut')
		noteTweenX('altnote3',6,defaultPlayerStrumX0,0.5,'expoOut')
		noteTweenX('altnote4',7,defaultPlayerStrumX2,0.5,'expoOut')
	end
	if curStep == 1880 then
		noteTweenX('note1',0,defaultPlayerStrumX2,0.5,'expoOut')
		noteTweenX('note2',1,defaultPlayerStrumX3,0.5,'expoOut')
		noteTweenX('note3',2,defaultPlayerStrumX0,0.5,'expoOut')
		noteTweenX('note4',3,defaultPlayerStrumX1,0.5,'expoOut')

		noteTweenX('altnote1',4,defaultOpponentStrumX2,0.5,'expoOut')
		noteTweenX('altnote2',5,defaultOpponentStrumX3,0.5,'expoOut')
		noteTweenX('altnote3',6,defaultOpponentStrumX0,0.5,'expoOut')
		noteTweenX('altnote4',7,defaultOpponentStrumX1,0.5,'expoOut')
	end
	if curStep == 1904 then
		noteTweenX('note1',0,defaultOpponentStrumX0,0.5,'expoOut')
		noteTweenX('note2',1,defaultOpponentStrumX1,0.5,'expoOut')
		noteTweenX('note3',2,defaultOpponentStrumX3,0.5,'expoOut')
		noteTweenX('note4',3,defaultOpponentStrumX2,0.5,'expoOut')

		noteTweenX('altnote1',4,defaultPlayerStrumX0,0.5,'expoOut')
		noteTweenX('altnote2',5,defaultPlayerStrumX1,0.5,'expoOut')
		noteTweenX('altnote3',6,defaultPlayerStrumX3,0.5,'expoOut')
		noteTweenX('altnote4',7,defaultPlayerStrumX2,0.5,'expoOut')
	end
end
end

function fontchange(name)
	setTextFont('timeTxt', name)
	setTextFont('warning', name)
	setTextFont('ghudsong', name)
	setTextFont('ghudscoreTxt', name)
end
local fontlol = {'COMIC.TTF','metro.otf','poke.ttf','what','vcr.ttf','BarcodeFont.ttf'}
function onBeatHit()
	if curBeat % 2 == 0 then
		fontchange(fontlol[getRandomInt(1,6)])
	end
end
function doTweenWindow(var,value,duration,ease)
	runHaxeCode([[FlxTween.tween(Lib.application.window, {]]..var..[[: ]]..value..[[}, ]]..duration..[[, {ease: FlxEase.]]..ease..[[});]])
end

function onDestroy()
	setPropertyFromClass('lime.app.Application', 'current.window.title', "VS. D&B: Definitive Edition': Redefined")
	setPropertyFromClass("openfl.Lib", "application.window.x",window_default[1])
	setPropertyFromClass("openfl.Lib", "application.window.y",window_default[2])
	setPropertyFromClass('ClientPrefs', 'ghostTapping', true)

end


ffi = require "ffi"

ffi.cdef [[
    typedef int BOOL;
        typedef int BYTE;
        typedef int LONG;
        typedef LONG DWORD;
        typedef DWORD COLORREF;
    typedef unsigned long HANDLE;
    typedef HANDLE HWND;
    typedef int bInvert;
        
        HWND GetActiveWindow(void);
        
        LONG SetWindowLongA(HWND hWnd, int nIndex, LONG dwNewLong);
        
    HWND SetLayeredWindowAttributes(HWND hwnd, COLORREF crKey, BYTE bAlpha, DWORD dwFlags);
        
        DWORD GetLastError();
]]
function setTransparency(color)
    local win = ffi.C.GetActiveWindow()
    

    if win == nil then
        debugPrint('Error finding window!!! idiot!!!!')
        debugPrint('cool code: '..tostring(ffi.C.GetLastError()))
    end
    if ffi.C.SetWindowLongA(win, -20, 0x00080000) == 0 then
        debugPrint('error setting window to be layed WTF DFOES THAT EVBEN MEAN LMAOOO!!! IM NOT NO NERD!')
        debugPrint('cool code: '..tostring(ffi.C.GetLastError()))
    end
    if ffi.C.SetLayeredWindowAttributes(win, color, 0, 0x00000001) == 0 then
        debugPrint('error setting color key or whatever')
        debugPrint('cool code: '..tostring(ffi.C.GetLastError()))
    end
end