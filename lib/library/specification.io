Library Specification := Object clone do(
  details ::= nil

  # This is where the author's name (and contact) go, either string or list
  author ::= nil
  version ::= nil

  # This is just some more metadata for the library, a website to the repo or docs
  page ::= nil

  # This is the list of dependencies, normally a empty list
  dependencies ::= list()

  # Where the library directory is going to be located
  libdir ::= ".libraries"

  # What file to look for in searching through dependencies
  libfile ::= "lib.io"
  clone_command ::= "git clone"
  source_ext ::= ".git"
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
