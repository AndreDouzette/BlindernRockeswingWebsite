import sys, os
import paramiko
from credentials import password, host, user, port

def filesInDir(directory, extensions):
	prefix = "./"
	if len(directory) > 2:
		prefix = directory + "/"
	files = []
	for f in os.listdir(directory):
		for e in extensions:
			if f.endswith("." + e):
				files.append(prefix + f)
				break
	return [f.split("/")[-1] for f in files]

def fixDir(dir):
	if len(dir) == 0:
		dir = "."
	if dir[0] != ".":
		dir = "./" + dir
	if dir[-1] != "/":
		dir += "/"
	return dir

def uploadFilesInDir(dir, remoteDir, extensions):
	files = filesInDir(dir, extensions)
	dir = fixDir(dir)
	remoteDir = fixDir(remoteDir)
	for file in files:
		print(dir + file, "->", remoteDir + file)
		sftp.put(dir + file, remoteDir + file)


if len(sys.argv) < 2:
	filetypesToUpload = ["html"]
elif sys.argv[1] == "all":
	filetypesToUpload = ["html", "jpg", "png", "jpeg", "ico"]
else:
	filetypesToUpload = sys.argv[1:]

client = paramiko.SSHClient()
client.load_system_host_keys()
client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
client.connect(host, port = port, username = user, password = password)
sftp = client.open_sftp()

uploadFilesInDir("dist", "", filetypesToUpload)
uploadFilesInDir("dist/img", "img", filetypesToUpload)
uploadFilesInDir("dist/img/styret", "img/styret", filetypesToUpload)
uploadFilesInDir("dist/img/aro", "img/aro", filetypesToUpload)

sftp.close()
client.close()