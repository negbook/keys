
RegisterNetEvent('AddKeyHelp')
AddEventHandler('AddKeyHelp', function(data) 
    Arrival.AddGroupData("KeyHelp",data)
end)
CreateThread(function()
   SetEntityCoords(PlayerPedId(),-262.1,-966.1,31.2)
    --{inputGroup, controlKey , helptext, x , y, z, distance}
    --[[
    local keys  = 
    {
        {inputGroup = 2,controlKey = 191, helptext = "quick Pressed to say  enter",x=-262.1,y=-966.1,z=31.2,cbsendsors = {IsControlJustPressed=function() print('enter!') end}},
        {inputGroup = 2,controlKey = 38, helptext = "quick Released to say hi",x=-262.1,y=-966.1,z=31.2,cbsendsors = {IsControlJustReleased=function() print('hi') end} },
        {inputGroup = 2,controlKey = 38, helptext = "quick Pressed to say hello",x=-262.1,y=-966.1,z=31.2,cbsendsors = {IsControlJustPressed=function() print('hello') end} }
    } 
    --]]
    local keys  = 
    {
        {inputGroup = 2,controlKey = 191, helptext = "quick Pressed to say  enter",x=-262.1,y=-966.1,z=31.2,cbsendsors = {IsControlJustPressed=function() print('enter!') end}},
        {inputGroup = 2,controlKey = 38, helptext = "quick Released to say hi and hello",x=-262.1,y=-966.1,z=31.2,cbsendsors = {
        IsControlJustReleased=function() print('hi') end,
        IsControlJustPressed=function() print('hello') end} },
        
    } 
    
    Arrival.RegisterTargets ('KeyHelp',{ 
        itemlist = keys,
        onEnter = 
                            function(data)
                                
                                
                                TriggerEvent('CallScaleformMovie','instructional_buttons',function(run,send,stop,handle)
                                    
                                        run('CLEAR_ALL')
                                        stop()
                                        
                                        run('SET_CLEAR_SPACE')
                                            send(200)
                                        stop()
                                         
                                        
                                        
                                        local Keys = {}
                                        
                                        for i=1,#(data) do 
                                            local v = data[i]
                                            run('SET_DATA_SLOT')
                                                send(i-1,GetControlInstructionalButton(v.inputGroup, v.controlKey, true), v.helptext)
                                            stop() 
                                        end      
                                         
                                        
                                        run('SET_BACKGROUND_COLOUR')
                                            send(0,0,0,22)
                                        stop()
                                        
                                        run('SET_BACKGROUND')
                                        stop()
                                        
                                        run('DRAW_INSTRUCTIONAL_BUTTONS')
                                        stop()
                                        
                                        TriggerEvent('DrawScaleformMovie','instructional_buttons')
                                        
                                end )
                            end
        ,
        onExit = 
                            function(data)
                                print('exit')
                                TriggerEvent('EndScaleformMovie','instructional_buttons')
                            end
        ,
        onSpam = 
                            function(data)
                                        local agzi = data
                                            for i=1,#(agzi) do 
                                                    local v = agzi[i]
                                                   
                                                    if v.cbsendsors then 
                                                        for k,c in pairs(v.cbsendsors) do 
                                                            if _G[k] and  _G[k](v.inputGroup, v.controlKey ) then 
                                                                c()
                                                            end 
                                                        end 
                                                    
                                                    end 
                                            end 
                                       
                                    end
        ,
        range = 1.0
        

    })
        
   
end)
