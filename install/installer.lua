----------------------------------------
--	      zOS Installer           --
-- Create the system directories      --
--Copy the system programs & apis     --
-- btw:it formats your computer       --
--remember to use update after install--
--to keep your system updated 	      --
----------------------------------------

local finished = false
_branch = "master"

os.loadAPI("/tmp/libinstall")
repeat

	function Work(xp,yp)
		local oxp, oyp = term.getCursorPos()
		if term.isColor() then
			term.setTextColor(colors.blue)
		end
		term.setCursorPos(xp,yp)
		print("WORK")
		term.setCursorPos(oxp,oyp)
		if term.isColor() then
			term.setTextColor(colors.blue)
		end
	end

	function Done(xp,yp)
		local oxp, oyp = term.getCursorPos()
		if term.isColor() then
			term.setTextColor(colors.lime)
		end
		term.setCursorPos(xp,yp)
		print("DONE")
		term.setCursorPos(oxp,oyp)
		if term.isColor() then
			term.setTextColor(colors.blue)
		end
	end




	libinstall.callInterface()
	finished = true
	
	term.setCursorPos(23,4)
	libinstall.testColor(colors.yellow)
	print("Warning")
	
	term.setCursorPos(3,6)
	print("Installing zOS delete your entire actual system.")
	
	term.setCursorPos(14,7)
	print("Do you want to continue?")
	
	term.setCursorPos(20,9)
	write("Yes")
	
	term.setCursorPos(30,9)
	write("No")
	
	term.setCursorPos(29,9)
	write(" ")
	term.setCursorPos(32,9)
	write(" ")	
	term.setCursorPos(19,9)
	write(">")
	term.setCursorPos(23,9)
	write("<")
	
	selected = false
	local selection = "y"
	local state = 2
	
	
	while not selected do
		event, key = os.pullEvent("key")
		if event=="key" then
			if key==203 then
				state = 1
			end
		
			if key==205 then
				state = 1
			end
			
			if key==28 then
				selected = true
				state = 2
			end
		end
		if state==1 and selection=="y" then
			selection = "n"
			state = 0
		end
		if state==1 and selection=="n" then		
			selection = "y"
			state = 0
		end
		
		if state==0 then 
			if selection=="y" then
				term.setCursorPos(29,9)
				write(" ")
				term.setCursorPos(32,9)
				write(" ")
				
				term.setCursorPos(19,9)
				write(">")
				term.setCursorPos(23,9)
				write("<")
			end
			if selection=="n" then
				term.setCursorPos(19,9)
				write(" ")
				term.setCursorPos(23,9)
				write(" ")
				
				term.setCursorPos(29,9)
				write(">")
				term.setCursorPos(32,9)
				write("<")
			end
		end
	end

	if selection=="y" then
		libinstall.callInterface()
		shell.run("/tmp/setbranch.lua")
		libinstall.callInterface()
		
		term.setCursorPos(7,7)
		write("[    ]Formatting computer")
		term.setCursorPos(7,8)
		write("[    ]Making system directories")
		term.setCursorPos(7,9)
		write("[    ]Copying cc unchanged binaries")
		term.setCursorPos(7,10)
		write("[    ]Gathering base system")
		Work(8,7)
		shell.run("/tmp/format.lua")
		Done(8,7)
		Work(8,8)
		shell.run("/tmp/mksysdir.lua")
		Done(8,8)
		Work(8,9)
		shell.run("/tmp/copyccbin.lua")
		Done(8,9)
		Work(8,10)
		shell.run("/tmp/installbase.lua")
		Done(8,10)
		
		
		shell.run("/tmp/usersetup.lua")
		
		libinstall.setStep("Rebooting in 3 seconds")
		os.sleep(1)
		libinstall.setStep("Rebooting in 2 seconds")
		os.sleep(1)
		libinstall.setStep("Rebooting in 1 second")
		os.sleep(1)
		libinstall.setStep("Rebooting...")
		os.reboot()
		
	elseif selection=="n" then
		term.setBackgroundColor(colors.black)
		term.clear()
		term.setCursorPos(1,1)
		break
	end
	
until finished==true
