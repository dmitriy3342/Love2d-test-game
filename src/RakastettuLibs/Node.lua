local Node = {}

function Node.new()
	print("Node.new() called")

	local node = {}

	node._rect = {
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	}

	node._originPt = {x = 0, y = 0}

	function node:draw()

	end

	function node:setRect(top, bottom, left, right)
		self._rect = {
			top = top,
			bottom = bottom,
			left = left,
			right = right
		}
	end

	function node:_debugDraw()
		love.graphics.setColor(200, 80, 80, 20)
		love.graphics.rectangle("fill",
				self._originPt.x - self._rect.left,
				self._originPt.y - self._rect.top,
				self._rect.right + self._rect.left,
				self._rect.bottom + self._rect.top)
		love.graphics.setColor(200, 80, 80, 200)
		love.graphics.rectangle("line",
				self._originPt.x - self._rect.left,
				self._originPt.y - self._rect.top,
				self._rect.right + self._rect.left,
				self._rect.bottom + self._rect.top)
		love.graphics.setColor(255, 120, 120, 255)
		love.graphics.setLineWidth(0.2)
		local cross_size = 2
		love.graphics.line(
				self._originPt.x + cross_size,
				self._originPt.y + cross_size,
				self._originPt.x - cross_size,
				self._originPt.y - cross_size)
		love.graphics.line(
				self._originPt.x + cross_size,
				self._originPt.y - cross_size,
				self._originPt.x - cross_size,
				self._originPt.y + cross_size)
	end

	function node:move(dx, dy)
		self._originPt.x = self._originPt.x + dx
		self._originPt.y = self._originPt.y + dy
	end


	function node:moveTo(x, y)
		self._originPt.x = x
		self._originPt.y = y
	end

	return node
end

return Node
