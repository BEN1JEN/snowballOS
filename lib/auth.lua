local auth = {}
local users = {}

function auth.newUser(username, password, powerlevel, currentUser)

	if auth.authenticate(currentUser) and ((currentUser.powerLevel >= powerLevel and powerLevel ~= -1) or currentUser.powerLevel == -1) then
		users[username] = {password=sha256(password), powerLevel=powerLevel}
	end

end

function auth.authenticate(user)

	login = false
	if users[user.name]["password"] == sha256.hash256(user.password) then
		login = true
	end

	return login
end

function auth.import(passwordFile)
	os.execute("cp " .. passwordFile .. " tmp/psswd.lua")
	local import = require "tmp.psswd"
	users = import()
	os.execute("rm tmp/psswd.lua")
end

return auth
