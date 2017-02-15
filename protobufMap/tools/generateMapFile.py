# encoding=utf8
import os
import sys
import shutil

reload(sys)  
sys.setdefaultencoding('utf8')

#path example: "X:\\clientTools\\tools\\generateMapFile\\source\\"
SOURCE_DIR = ""
DEST_DIR = ""


def initPath():
	global SOURCE_DIR
	global DEST_DIR
	SOURCE_DIR = sys.argv[1]
	DEST_DIR = sys.argv[2]


def refreshFolder(directory):
	if os.path.exists(directory):
		shutil.rmtree(directory)
	os.makedirs(directory)
	
class ComposeMapFile:
	def __init__(self):
		self.introduce = '''/*
*
* Copyright 2016
* All rights reserved.
* This file is automatically generated by python script of which 
* the author is wupeng.
*
*/
'''
		self.importPart = ""
		self.scmapPart = ""
		self.csmapPart = ""
		self.currentFilePackageName = ""
		self.completeString = ""
	def readSingleFile(self, filename):
		fname = SOURCE_DIR + filename
		if os.path.isdir(fname):
			return
		f = open(fname, 'rb')
		for line in f:
			if self.whetherIsAMessageLine(line):
				className = ''.join(self.extractClassName(line))
				classId = ''
				if className.endswith("_r") == False:
					if self.filterFollowedZero(line) == True:
						continue
					classId = ''.join(self.extractClassId(line))
					if classId == '':
						continue
					self.csmapPart += "\t\t" + "CSMap[" +  className + "]" + " = 0x" + classId + ";\n"
					self.importPart += "\t" + "import protobuf." + self.currentFilePackageName.strip(';') + "." + className + ";\n"
				elif className.endswith("_r") == True:
					classId = ''.join(self.extractClassId(line))
					if (classId == ""):
						#print className
						classId = ''.join(self.tackleSpecialCase(fname, 'message', className.strip('_r')))
						#print classId
					if classId == '':
						continue

					self.scmapPart += "\t\t" + "SCMap[0x" +  classId + "]" + " = " + className + ";\n"
					self.importPart += "\t" + "import protobuf." + self.currentFilePackageName.strip(';') + "." + className + ";\n"
			elif self.whetherIsAPackageLine(line):
				self.currentFilePackageName = self.extractPackageName(line)
		self.currentFilePackageName = ""
	def filterFollowedZero(self, line):
		doblueSlashFlag = '//'
		doubleSlashPosition = line.find(doblueSlashFlag)
		for i in range(doubleSlashPosition, len(line)):
			if (ord(line[i]) == 48):
				return True
			elif (ord(line[i]) == 49):
				return False
		return False

	def tackleSpecialCase(self, filename, messageFlag, classNameFlag):
		fileContent = open(filename, 'rb')
		for l in fileContent:
			line = l.replace(' ', '')
			if (line.find(messageFlag) == 0) and (line.find(classNameFlag + '//') >= 0):
				classId = self.extractClassId(line)
				return classId
		return ''
	def concatenateParts(self):
		self.completeString = self.introduce + "package protobuf\n" + "{\n" + "\timport flash.utils.Dictionary;\n" + self.importPart
		self.completeString +=  "\tpublic class MessageMap\n\t{\n" + "\t\tpublic static var SCMap:Dictionary = new Dictionary();\n"
		self.completeString += "\t\tpublic static var CSMap:Dictionary = new Dictionary();\n\n"
		self.completeString += self.scmapPart
		self.completeString += '\n'
		self.completeString += self.csmapPart
		self.completeString += "\t}\n" + "}"
		return self.completeString
	def whetherIsAMessageLine(self, line):
		messageLineFlag = "message"
		if (line.find(messageLineFlag) != 0):
			return False
		return True
	def whetherIsAPackageLine(self, line):
		packageFlag = "package"
		if (line.find(packageFlag) != 0):
			return False
		return True
	def extractPackageName(self, line):
		return line.split()[1]
	def extractClassName(self, line):
		className = []
		for i in range(8, len(line)):
			if (line[i] == '/'):
				break
			if (ord(line[i]) == 95) or ((ord(line[i]) >= 48) and (ord(line[i]) <=57)) or ((ord(line[i]) >= 65) and (ord(line[i]) <=90))  or ((ord(line[i]) >= 97) and (ord(line[i]) <=122)):
				className.append(line[i])
		return className
	def extractClassId(self, line):
		classId = []
		hexFlag = '0x'
		hexPosition = line.find(hexFlag)
		if (hexPosition < 0):
			return classId
		for i in range(hexPosition + 2, len(line)):
			if (line[i] == '#'):
			   return classId
			classId.append(line[i])
	def tackleFiles(self):
		for filename in os.listdir(SOURCE_DIR):
			outputName = os.path.splitext(os.path.basename(filename))[0]
			self.readSingleFile(unicode(filename, 'gbk'))
		content = self.concatenateParts()
		outputFile = open(''.join([DEST_DIR, 'MessageMap.as']), 'w')
		outputFile.write(content)
	

initPath()
#refresh_folder(DEST_DIR)
compose = ComposeMapFile()
compose.tackleFiles()
