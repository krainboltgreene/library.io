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

  create_file := method(
    path := Path with(message arguments) interpolate
    template := File with(path) contents interpolate

  )

  format_name := method(name,

  )
)
