--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.player = Player {
        animations = ENTITY_DEFS['player'].animations,
        walkSpeed = ENTITY_DEFS['player'].walkSpeed,
        
        x = VIRTUAL_WIDTH / 2 - 8,
        y = VIRTUAL_HEIGHT / 2 - 11,
        
        width = 16,
        height = 22,

        -- one heart == 2 health
        health = 6,

        -- rendering and collision offset for spaced sprites
        offsetY = 5
    }

    self.heartAdded = false
    self.last_deathX = 0
    self.dungeon = Dungeon(self.player)
    self.currentRoom = Room(self.player)
    
    self.player.stateMachine = StateMachine {
        ['walk'] = function() return PlayerWalkState(self.player, self.dungeon) end,
        ['idle'] = function() return PlayerIdleState(self.player) end,
        ['swing-sword'] = function() return PlayerSwingSwordState(self.player, self.dungeon) end,
        ['hold-pot'] = function() return PlayerPotState(self.player, self.dungeon) end,
        ['idle-pot'] = function() return PlayerIdleStatePot(self.player) end
    }
    self.player:changeState('idle')
end

function PlayState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    self.dungeon:update(dt)

    
    if self.dungeon.entityDeath == true then
        if self.last_deathX ~= self.dungeon.entityDeathX then
            self.dungeon:addHeart(self.dungeon.entityDeathX, self.dungeon.entityDeathY)
            self.dungeon.entityDeath = false
        end
        self.last_deathX = self.dungeon.entityDeathX
    end

    if self.dungeon.potLifted == true then
        --if love.keyboard.wasPressed('space') then
        --    self.dungeon.myprojectile.state = 'thrown'
            
        --    Timer.tween(0.5, {
        --        [self.dungeon.myprojectile] = {x = self.dungeon.myprojectile.x + 100, y = self.dungeon.myprojectile.y + 100},
        --    }):finish(function()
        --        table.remove(self.currentRoom.objects, self.dungeon.myprojectile)
        --    end
        --    )
        --end
    end
end

function PlayState:render()
    -- render dungeon and all entities separate from hearts GUI
    love.graphics.push()
    self.dungeon:render()
    love.graphics.pop()

    -- draw player hearts, top of screen
    local healthLeft = self.player.health
    local heartFrame = 1

    for i = 1, 3 do
        if healthLeft > 1 then
            heartFrame = 5
        elseif healthLeft == 1 then
            heartFrame = 3
        else
            heartFrame = 1
        end

        love.graphics.draw(gTextures['hearts'], gFrames['hearts'][heartFrame],
            (i - 1) * (TILE_SIZE + 1), 2)
        
        healthLeft = healthLeft - 2
    end
end

