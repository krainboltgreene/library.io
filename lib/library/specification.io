Library Specification := Object clone do(
  details ::= nil
  author ::= nil
  version ::= nil
  page ::= nil
  dependencies ::= list()
  libdir ::= ".libraries"
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
