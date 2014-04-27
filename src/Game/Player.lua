local class = require "bartbes.SECS.full"
rkstlib.texturedNode = require "RakastettuLibs.TexturedNode"

local Player = class:new(); Player:addparent(rkstlib.texturedNode)

function Player:init(originPt, rect, angle, texture)
	rkstlib.node.init(self, originPt, rect, angle)
	self._texture = texture
	self._w = texture:getWidth()
	self._h = texture:getHeight()
	self._rect.top = self._h / 2
	self._rect.bottom = self._h / 2
	self._rect.left = self._w / 2
	self._rect.right = self._w / 2
	self._v = 0
	self._maxv = 0.1
	self._radius = (self._h+self._w)*0.25
end

function Player:_debugDraw()
	love.graphics.push( )
	love.graphics.translate( self._originPt.x, self._originPt.y )
	love.graphics.rotate( self._angle )
	love.graphics.setColor(200, 80, 80, 20)
	love.graphics.rectangle("fill", -self._rect.left, -self._rect.top,
		self._rect.left+self._rect.right, self._rect.top+self._rect.bottom)
	love.graphics.setColor(200, 80, 80, 200)
	love.graphics.rectangle("line", -self._rect.left, -self._rect.top,
		self._rect.left+self._rect.right, self._rect.top+self._rect.bottom)
	love.graphics.circle("line", 0,0, self._radius, 100)
	love.graphics.setColor(255, 120, 120, 255)
	love.graphics.setLineWidth(0.2)
	local cross_size = 2
	love.graphics.line(cross_size, cross_size, -cross_size, -cross_size)
	love.graphics.line(cross_size, -cross_size, -cross_size, cross_size)
	love.graphics.pop( );
end

return Player
