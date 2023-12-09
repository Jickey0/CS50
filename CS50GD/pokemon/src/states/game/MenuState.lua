--[[
    GD50
    Pokemon

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

MenuState = Class{__includes = BaseState}

function MenuState:init(gainedHP, previousHP)
    self.statMenu = Menu {
        x = VIRTUAL_WIDTH - 300,
        y = VIRTUAL_HEIGHT - 64,
        width = 300,
        height = 64,
        cursor = false,
        test = true,
        items = {
            {
                text = 'HP increased by'  .. tostring(gainedHP) .. ' HP from ' .. tostring(previousHP),
            },
            {
                text = 'Current HP = ' .. tostring(previousHP + gainedHP),
            }
        }
    }
end

function MenuState:update(dt)
    --self.statMenu:update(dt)
end

function MenuState:render()
    self.statMenu:render(false)
end