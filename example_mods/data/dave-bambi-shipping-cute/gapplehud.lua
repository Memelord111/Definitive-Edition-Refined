function onCreatePost()
    makeLuaText('songName', songName:gsub('-', ' '), 0, 3)
    setProperty('songName.y', screenHeight - getProperty 'songName.height')
    setProperty('songName.borderSize', 1.25)
    addLuaText 'songName'

end