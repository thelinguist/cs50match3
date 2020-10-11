--[[
    GD50
    Match-3 Remake

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    - GameOverState Class-

    State that simply shows us our score when we finally lose.
]]

GameOverState = Class{__includes = BaseState}

function GameOverState:init()

end

function GameOverState:enter(params)
    self.score = params.score
end

function GameOverState:update(dt)
    local selectPressed = love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return')
    if gLocation.x and gLocation.y then
        -- find where it is in relation to tiles

        local boardXMin = gLocation.x
        local boardYMin = gLocation.y
        if boardXMin >= 0 and boardYMin >= 0 then
            selectPressed = true
        end

        -- clear so we don't repeat this
        gLocation = {
            x = nil,
            y = nil
        }
    end

    if selectPressed then
        gStateMachine:change('start')
    end

    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end
end

function GameOverState:render()
    love.graphics.setFont(gFonts['large'])

    love.graphics.setColor(.22, .22, .22, .912)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 64, 64, 128, 136, 4)

    love.graphics.setColor(.388, .608, 1, 1)
    love.graphics.printf('GAME OVER', VIRTUAL_WIDTH / 2 - 64, 64, 128, 'center')
    love.graphics.setFont(gFonts['medium'])
    love.graphics.printf('Your Score: ' .. tostring(self.score), VIRTUAL_WIDTH / 2 - 64, 140, 128, 'center')
    love.graphics.printf('Press Enter', VIRTUAL_WIDTH / 2 - 64, 180, 128, 'center')
end
