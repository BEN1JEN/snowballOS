function love.load()
	auth = require "lib/auth"
	login = require "bin/login"
	process = require "lib/process"
	sha256 = require "lib/sha256"
end

function love.update()

	process.update()

end

function love.draw()

	windowCanvases = process.renderCanvases()
	window.drawWindows(windowCanvases)

end
