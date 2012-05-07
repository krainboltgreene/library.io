Library Specification := Object clone do(
  details ::= nil
  author ::= nil
  version ::= nil
  repository ::= nil
  documentation ::= nil
  changelog ::= nil
  dependencies ::= list()
  location ::= ".libraries"

  setupUsing := method( source, root,
    if(root == nil, root = "")
    dependencies foreach(library,
      fetch(source, library, root)
      doFile("#{location}/#{root}/#{library}/lib.io" interpolate) setupUsing(source, "/#{library}/#{location}" interpolate)
    )
  )

  fetch := method( source, library, root,
    uri := "#{source}/#{library}.git" interpolate
    path := "#{location}#{root}/#{library}" interpolate
    command := "git clone #{uri} #{path}" interpolate
    System system(command)
  )
)
