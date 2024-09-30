function onUpdate(elapsed)
    for i=0,4,1 do
        setPropertyFromGroup('opponentStrums', i, 'texture', 'who')
    end
end