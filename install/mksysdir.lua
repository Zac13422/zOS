fs.delete("/tmp/format.lua")

libinstall.setStep("Making directory /api")
fs.makeDir("/api")

libinstall.setStep("Making directory /bin")
fs.makeDir("/bin")

libinstall.setStep("Making directory /boot")
fs.makeDir("/boot")

libinstall.setStep("Making directory /etc")
fs.makeDir("/etc")

libinstall.setStep("Making directory /etc/usrlist")
fs.makeDir("/etc/usrlist")

libinstall.setProgress(3)

libinstall.setStep("Making directory /etc/usrdata")
fs.makeDir("/etc/usrdata")

libinstall.setStep("Making directory /home        ")
fs.makeDir("/home")

libinstall.setStep("Making directory /root")
fs.makeDir("/root")

libinstall.setProgress(4)

libinstall.setStep("Making directory /tmp")
fs.makeDir("/tmp")

libinstall.setStep("Making directory /usr")
fs.makeDir("/usr")

libinstall.setStep("Making directory /usr/api")
fs.makeDir("/usr/api")

libinstall.setStep("Making directory /usr/bin")
fs.makeDir("/usr/bin")

libinstall.setProgress(5)