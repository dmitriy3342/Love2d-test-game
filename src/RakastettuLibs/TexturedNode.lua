local class = require "bartbes.SECS.full"
rkstlib.node = require "RakastettuLibs.Node"

local TexturedNode = class:new(); TexturedNode:addparent(rkstlib.node)

function TexturedNode:init(originPt, rect, angle, texture)
	rkstlib.node.init(self, originPt, rect, angle)
	self._texture = texture
	self._w = texture:getWidth()
	self._h = texture:getHeight()
	self._rect.top = self._h / 2
	self._rect.bottom = self._h / 2
	self._rect.left = self._w / 2
	self._rect.right = self._w / 2
end

function TexturedNode:draw()
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.push( )
	love.graphics.translate( self._originPt.x, self._originPt.y )
	love.graphics.rotate( self._angle )
	love.graphics.draw(self._texture, -self._rect.left, -self._rect.top)
	love.graphics.pop( );
end

return TexturedNode
