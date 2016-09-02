file = fs.open("etc/usrdata/userlist", "w")
file.close()
file = fs.open("etc/usrdata/usernumber", "w")
file.write("0")
file.close()

libinstall.setProgress(18)

os.loadAPI("/api/text")
os.loadAPI("/api/api")
libinstall.setProgress(20)
api.loadAll(1)
libinstall.setProgress(24)

term.setCursorPos(1,3)
write("Enter your computer name:")
compName = read()
os.setComputerLabel(compName)
libinstall.setProgress(25)

function ask(stra,stre,xpos,ypos,var)
	term.setCursorPos(1,ypos)
	local done = false
	while not done do
		write(stra)
		value = read()
		if value=="" then
			term.setCursorPos(xpos,ypos)
			print(stre)
			os.sleep(1)
			term.setCursorPos(1,ypos)
			write("                                                   ")
		else
			done = true
		end
	end
	if var=="rootpass" then
		user.passwd(root,value)
	end
	if var=="user" then
		user.add(value)
		user = value
	end
	if var=="userpass" then
		user.passwd(user,value)
	end
end

ask("Enter root password:","Invalid password",35,4,rootpass)
libinstall.setProgress(28)
ask("Enter your username:","Invalid username",35,5,user)
libinstall.setProgress(31)
ask("Enter the password for"..user..":","Invalid password",35,6,userpass)
libinstall.setProgress(34)