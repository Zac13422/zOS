local fileList = fs.list("")
local number = table.getn(fileList, "rom")
table.remove(fileList, number)
number = table.getn(fileList, "disk")
table.remove(fileList, number)
number = table.getn(fileList, "tmp")
table.remove(fileList, number)
libinstall.setProgress(1)
for i=1, #fileList do
	libinstall.setStep("Deleting /"..fileList[i])
	fs.delete(fileList[i])
end
libinstall.setProgress(2)