Library Specification := Object clone do(
  details ::= nil
  author ::= nil
  version ::= nil
  page ::= nil
  dependencies ::= list()
  location ::= ".libraries"

  setupUsing := method(source, root,
    if(root == nil, root = "")
    dependencies foreach(library,
      fetch(source, library, root)
      doFile("#{location}/#{root}/#{library}/lib.io" interpolate) setupUsing(source, "/#{library}/#{location}" interpolate)
    )
  )

  fetch := method(source, library, root,
    System system(command_from(source, library, root))
  )

  uri_from := method(source, library,
    source .. "/" .. library .. ".git"
  )

  path_from := method(root, library,
    location .. root .. "/" .. library
  )

  command_from := method(source, library, root,
    "git clone " .. uri_from(source, library) .. " " .. path_from(root, library)
  )
)
