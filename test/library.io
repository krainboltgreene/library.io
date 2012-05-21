doRelativeFile("../lib/library.io")

# TODO: This should be in some task somewhere
Directory at("library") files foreach(file,
  doFile(file path) run
)
