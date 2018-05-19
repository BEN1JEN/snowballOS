local process = {}
local processes = {}

function process.newProcess(newProcess, user, init)

	local pid = #processes .. user.powerLevel .. math.random(0, 99)

	processes[pid] = {user=user, name=newProcess.name, update=newProcess.update}

	if newProcess.draw then
		processes[pid]["draw"] = newProcess.draw
	end
	if newProcess.init then
		newProcess.init(pid)
	end
	if init then
		init(pid)
	end

end

function process.update()
	for pid, prc in pairs(process) do
		prc.update()
	end
end

function process.render()

	windowCanvases = {}           

	for pid, prc in pairs(process) do
		windowCanvases
	end

end
