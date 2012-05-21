Library Specification := Object clone do(
  # The version of the library, a Version object
  version ::= nil

  # The package details, a short description
  details ::= nil

  # The author's name (and contact) go, either String or List
  author ::= nil

  # More metadata for the library, a website to the repo or docs
  page ::= nil

  # The list of dependencies
  # TODO: We'll need to account for version
  dependencies ::= list()

  # Where the library directory is going to be located
  libDir ::= ".libraries"

  # What file to look for in searching library metadata
  libFile ::= "lib.io"

  # What exact scm command to use for downloading code
  cloneCommand ::= "git clone"

  # This is the extention scm, if any
  sourceExt ::= ".git"

  # FIXME: Find out how to switch
  pathDelimiter ::= "/"

  setupUsing := method(source, root,
    dependencies foreach(library,
      fetch(source, library, root)
      gather(library)
    )
  )

  gather := method(library,
    path := path_from(root, library)
    spec := doFile(Path with(path, libFile))
    newPath := pathDelimiter .. Path with(library, libDir)
    spec setupUsing(source, newPath)
  )

  fetch := method(source, library, root,
    System system(commandFrom(source, library, root))
  )

  uriFrom := method(source, library,
    Path with(source, library .. sourceExt)
  )

  pathFrom := method(library, root,
    Path with(libDir, root, library)
  )

  commandFrom := method(source, library, root,
    cloneCommand .. " " .. uriFrom(source, library) .. " " .. pathFrom(library, root)
  )
)
