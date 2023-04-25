# Makefile for HCL Language
PACKAGE = com.harishlangs.
SRC = com\harishlangs\hcl
NAME = Hcl
CP = .;lib\jython-standalone-2.7.3.jar
JAR = HCL.jar

all: compile run

run: compile
	@echo "--> Running HCL"
	@java -cp $(CP) $(PACKAGE)hcl.$(NAME) .\\ $(ARGS)

compile:
	@echo "--> Building HCL Lang"
	@javac -cp $(CP) $(SRC)\\Hcl.java

genast:
	@echo "--> Generating AST Tree"
	@javac com\harishlangs\tools\\*.java
	@java $(PACKAGE)tools.GenAst $(SRC)

export: compile
	@echo "--> Exporting Jar"
	@jar cfm $(JAR) $(SRC)\\manifest.txt $(SRC)\\*.class $(SRC)\\std\\*.class
	@move $(JAR) export
	@xcopy lib export\\lib

clean:
	@echo "--> Cleaning Directory"
	@del /s /q *.class
	@echo "--> Cleaned Directory"