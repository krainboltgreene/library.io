Library Scaffold := Object clone do(
  new := method()
  update := method()
  test := method()
  name ::= nil

  create_root := method(
    Directory createSubdirectory(path)
  )

  create_directory := method(
    path := Path with(message arguments) interpolate
    Directory createSubdirectory(path)
  )

)
