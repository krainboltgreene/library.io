Library Scaffold := Object clone do(
  update := method()
  test := method()
  new := method(arguments, options,
    setName(format_name(arguments third))
    create_root
    create_directory("lib")
    create_file("lib", "#{name}.io")
    create_directory("lib", name)
    create_file("lib", name, "sample.io")
    create_directory("test")
    create_directory("test", name)
    create_file("test", name, "sample.io")
    create_directory("ex")
    create_file("ex", "ex1.io")
    create_directory("bin")
    create_file("bin", name)
  )

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
