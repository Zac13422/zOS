term.setCursorPos(13,6)
write("Please select your branch")

term.setCursorPos(17,8)
write("Master")

term.setCursorPos(27,8)
write("Testing")

selected = false
local selection = "master"
local state = 0
	
repeat
	if state==1 and selection=="master" then
		selection = "testing"
		state = 0
	end
	if state==1 and selection=="testing" then			
		selection = "master"
		state = 0
	end
		
	if state==0 then 
		if selection=="master" then
			term.setCursorPos(26,8)
			write(" ")
			term.setCursorPos(34,8)
			write(" ")
			
			term.setCursorPos(16,8)
			write(">")
			term.setCursorPos(23,8)
			write("<")
		end
		if selection=="testing" then
			term.setCursorPos(16,8)
			write(" ")
			term.setCursorPos(23,8)
			write(" ")
			
			term.setCursorPos(26,8)
			write(">")
			term.setCursorPos(34,8)
			write("<")
		end
	end
		
	local event, key = os.pullEvent("key")
	if event=="key" then
		if key==203 then
			state = 1
		end
		
		if key==205 then
			state = 1
		end
			
		if key==28 then
			_branch = selection
			selected = true
		end
	end
until selected==true