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
  libdir ::= ".libraries"

  # What file to look for in searching through dependencies
  libfile ::= "lib.io"

  # What exact git command this is using listed here
  clone_command ::= "git clone"

  # This is the extention for the repository
  source_ext ::= ".git"

  # This is mainly for windows
  path_delimiter ::= "/"

  setupUsing := method(source, root,
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
