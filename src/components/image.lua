local squeak = require 'lib.squeak'
local Component = squeak.component
local images = require 'services.images'

local lg = love.graphics

local Image = Component:extend()

function Image:new(frameName, x, y, r)
  Image.super.new(self)

  self:setFrameName(frameName)
  self.x = x or 0
  self.y = y or 0
  self.r = r or 0
end

function Image:setFrameName(frameName)
  self.quad = images:getQuad(frameName)
  self.w, self.h = images:getSize(frameName)
end

function Image:draw()
  local parent = self.parent

  local x = self.x + parent.x - self.w/2
  local y = self.y + parent.y - self.h/2

  lg.push()
  lg.setColor(1, 1, 1)
  lg.draw(images.image, self.quad, x, y, self.r)
  lg.pop()
end

function Image:__tostring()
  return 'Image'
end

return Image
