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
    # NOTE: This is because nil asString #=> "nil"
    if(root == nil, root = "")
    dependencies foreach(library,
      fetch(source, library, root)
      doFile(path_from(root, library) .. path_delimiter .. libfile) setupUsing(source, path_delimiter .. library .. path_delimiter .. libdir)
    )
  )

  fetch := method(source, library, root,
    System system(command_from(source, library, root))
  )

  uri_from := method(source, library,
    source .. path_delimiter .. library .. source_ext
  )

  path_from := method(root, library,
    libdir .. root .. path_delimiter .. library
  )

  command_from := method(source, library, root,
    clone_command .. " " .. uri_from(source, library) .. " " .. path_from(root, library)
  )
)
