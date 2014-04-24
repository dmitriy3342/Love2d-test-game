rkstlib.scene = require "RakastettuLibs.Scene"
rkstlib.layer = require "RakastettuLibs.Layer"
rkstlib.node = require "RakastettuLibs.Node"

local Game = {} --game with one scene

function Game:resizeWindow(width, height)
	local cam = self.scene._camera
	cam._sizes.width = width
	cam._sizes.height = height

	--send event to layers? -- no
end

function Game:init(width, height)
	print("Game:init() called")

	self.scene = rkstlib.scene.new()

	self:resizeWindow(width, height)
	self:_initTestScene()
end

--[[
Тестовая сцена
Один слой с двумя нодами
Вращение и зум камеры
]]--
function Game:_initTestScene()
	--test----------------
	local mainLayer = rkstlib.layer.new()

	local node1 = rkstlib.node.new()
	node1:setRect(50, 50, 30, 40)
	node1:moveTo(0, 0)
	mainLayer:addNode(node1)

	local node2 = rkstlib.node.new()
	node2:setRect(10, 20, 30, 40)
	node2:moveTo(100, -150)
	mainLayer:addNode(node2)

	self.scene:addLayer(mainLayer)

	function game.scene:update(dt)
		local phi = 2
		local zv = 1
		self._camera._angle = (self._camera._angle + dt * phi * 0.2) % (2 * math.pi)
		self._camera._zoom = self._camera._zoom + zv * dt
		self._camera._zoom_aspect = 1 + 0.3*math.sin(self._camera._angle*20.0)
		if self._camera._zoom > 2 then
			self._camera._zoom = 0.5
			print("over")
		end
	end
	----------------------
end

return Game
