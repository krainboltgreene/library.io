doRelativeFile("../lib/library.io")

Directory at("library") files foreach(file, doFile(file) println)
