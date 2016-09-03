libinstall.callInterface()
libinstall.setProgress(17)

file = fs.open("etc/usrdata/userlist", "w")
file.close()
file = fs.open("etc/usrdata/usernumber", "w")
file.write("0")
file.close()

libinstall.setProgress(18)



os.loadAPI("/api/text")
os.loadAPI("/api/api")
libinstall.setProgress(20)
term.setCursorPos(1,3)
api.loadAll(1)
libinstall.setProgress(24)

term.setCursorPos(1,5)
write("Enter your computer name:")
compName = read()
os.setComputerLabel(compName)
libinstall.setProgress(25)


term.setCursorPos(1,6)
local done = false
while not done do
	write("Enter root password:")
	rootPass = read()
	if rootPass=="" then
		term.setCursorPos(35,6)
		print("Invalid password")
		os.sleep(1)
		term.setCursorPos(1,6)
		write("                                                   ")
	else
		done = true
		user.passwd(root,rootPass)
	end
end
done = false
libinstall.setProgress(28)


term.setCursorPos(1,7)
local done = false
while not done do
	write("Enter your username:")
	user = read()
	if user=="" then
		term.setCursorPos(35,7)
		print("Invalid username")
		os.sleep(1)
		term.setCursorPos(1,7)
		write("                                                   ")
	else
		done = true
		user.add(user)
	end
end
done = false
libinstall.setProgress(31)


term.setCursorPos(1,8)
local done = false
while not done do
	write("Enter the password for "..user..":")
	pass = read()
	if pass=="" then
		term.setCursorPos(35,8)
		print("Invalid password")
		os.sleep(1)
		term.setCursorPos(1,8)
		write("                                                   ")
	else
		done = true
		user.passwd(user,pass)
	end
end
done = false
libinstall.setProgress(34)