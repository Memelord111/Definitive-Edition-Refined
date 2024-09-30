function onCreate()

    makeAnimatedLuaSprite('bg1','Recursed/darkroombg', 1300, -200)
    addAnimationByPrefix('bg1','wind','windblow0', 15, true);
	objectPlayAnimation('bg1','wind', true);
    addLuaSprite('bg1',false)
    setLuaSpriteScrollFactor('bg1', 1, 1);
    setProperty('bg1.scale.x', 5);
    setProperty('bg1.scale.y', 2);

	makeLuaSprite('bgcolored', "", 0, 0)
	makeGraphic('bgcolored', 2048, 1080, 'FFFFFF')
	screenCenter('bgcolored','xy')
	setScrollFactor('bgcolored',0,0)
	addLuaSprite('bgcolored', false)
	setProperty('bgcolored.color',getColorFromHex('040533'))
	setProperty('bgcolored.alpha', 0)
	setProperty('bgcolored.visible', false)

	setProperty('bg2.visible',false)
    setProperty('bg3.visible',false)
    setProperty('bg4.visible',false)
    setProperty('bg5.visible',false)
    setProperty('bg6.visible',false)

	addHaxeLibrary('FlxBackdrop','flixel.addons.display')
    addHaxeLibrary('FlxPoint','flixel.math')
--	addHaxeLibrary('')

	luaDebugMode = false
	runHaxeCode([[

		alphabetsex = new Alphabet(0, 0, 'houseinsanitypolygonizedbonussonghouseinsanitypolygonizedbonussonghouseinsanitypolygonizedbonussonghouseinsanitypolygonizedbonussonghouseinsanitypolygonizedbonussonghouseinsanitypolygonizedbonussonghouseinsanitypolygonizedbonussonghouseinsanitypolygonizedbonussonghouseinsanitypolygonizedbonussonghouseinsanitypolygonizedbonussong', true);
        alphabetsex.screenCenter();
		alphabetsex.visible = false;
		game.addBehindGF(alphabetsex);

		for (character in alphabetsex.letters)
        {
			character.alpha = 0;
			character.velocity.set(FlxG.random.float(-50, 50), FlxG.random.float(-50, 50));
			character.angularVelocity = FlxG.random.int(30, 50);
			character.setPosition(FlxG.random.float(1400 + FlxG.width / 2, 1700+ FlxG.width * 2.5), FlxG.random.float(-500,500+ FlxG.height * 2.5));
        }
	]])

	runHaxeCode([[
		game.initLuaShader('backdrop');
		shader0 = game.createRuntimeShader('backdrop');
	]])

end

function onCreatePost()
	runHaxeCode([[
		charBackdrop = new FlxBackdrop(Paths.image('recursed/daveScroll'), 2, 2, true, true);
		charBackdrop.antialiasing = true;
		charBackdrop.scale.set(2, 2);
		charBackdrop.screenCenter();
		charBackdrop.velocity.set(0,0);
		charBackdrop.visible = false;
		charBackdrop.alpha = 0;
		charBackdrop.scrollFactor.set(0.5, 1);
		charBackdrop.shader = shader0;
		game.addBehindGF(charBackdrop)
	]])
end

function onUpdatePost()
	runHaxeCode([[
		shader0.setFloat("iTime", ]] .. os.clock() .. [[);
	]])
end

fr = 0
function onUpdate(elapsed)
setShaderFloat("bg", "iTime", os.clock())
fr = fr + elapsed


setProperty('dad.x',2450 + math.sin(fr*1) * 200);
setProperty('dad.angle',-2 + math.sin(fr*1) * -8);
setProperty('dad.y',300 + math.sin(fr*2) * 300);
runHaxeCode([[
	charBackdrop.alpha = charBackdrop.alpha - 0.08;

		for (letter in alphabetsex.letters)
		{
			letter.alpha = letter.alpha - 0.08;
		}
	]])
	setProperty('bgcolored.alpha',getProperty('bgcolored.alpha')-0.08)
	if curBeat % 4 == 0 then
		setProperty('bgcolored.alpha', 0.8)
		runHaxeCode([[
			charBackdrop.alpha = 0.8;
			for (letter in alphabetsex.letters)
				{
					letter.alpha = 0.8;
				}
		]])
	end
end

function onBeatHit()
	if curBeat == 88 then
		setProperty('bgcolored.visible', true)
		runHaxeCode([[
			charBackdrop.visible = true;
			alphabetsex.visible = true;
		]])
	end
end

function onStepHit()
	if curStep == 352 then
		cameraFlash('camGame', 'FFFFFF', 1, true)
	end
	if curStep == 864 then
		cameraFlash('camGame', 'FFFFFF', 1, true)
		setProperty('bgcolored.color',getColorFromHex('123304'))
		runHaxeCode([[
		charBackdrop.loadGraphic(Paths.image('recursed/bambiScroll'));

		alphabetsex = new Alphabet(0, 0, 'blockedcorntheftmazemealieblockedcorntheftmazemealieblockedcorntheftmazemealieblockedcorntheftmazemealieblockedcorntheftmazemealieblockedcorntheftmazemealieblockedcorntheftmazemealieblockedcorntheftmazemealieblockedcorntheftmazemealieblockedcorntheftmazemealieblockedcorntheftmazemealieblockedcorntheftmazemealieblockedcorntheftmazemealieblockedcorntheftmazemealie', true);
        alphabetsex.screenCenter();
		game.addBehindGF(alphabetsex);

		for (character in alphabetsex.letters)
                {
					character.velocity.set(FlxG.random.float(-50, 50), FlxG.random.float(-50, 50));
					character.angularVelocity = FlxG.random.int(30, 50);
					character.setPosition(FlxG.random.float(1400 + FlxG.width / 2, 1700+ FlxG.width * 2.5), FlxG.random.float(-500,500+ FlxG.height * 2.5));
                }
	]])
	end
	if curStep == 1248 then
		cameraFlash('camGame', 'FFFFFF', 1, true)
		setProperty('bgcolored.color',getColorFromHex('4A1305'))
		runHaxeCode([[
		charBackdrop.loadGraphic(Paths.image('recursed/tristanScroll'));
		alphabetsex = new Alphabet(0, 0, 'adventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristanadventurevs-tristan', true);
        alphabetsex.screenCenter();
		game.addBehindGF(alphabetsex);

		for (character in alphabetsex.letters)
                {
					character.velocity.set(FlxG.random.float(-50, 50), FlxG.random.float(-50, 50));
					character.angularVelocity = FlxG.random.int(30, 50);
					character.setPosition(FlxG.random.float(1400 + FlxG.width / 2, 1700+ FlxG.width * 2.5), FlxG.random.float(-500,500+ FlxG.height * 2.5));
                }
	]])
	end
	if curStep == 1632 then
		cameraFlash('camGame', 'FFFFFF', 1, true)
	end
end

function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end
function formatTime(millisecond)
    local seconds = math.floor(millisecond / 1000)

    return string.format("%01d:%02d", (seconds / 60) % 60, seconds % 60)  
end