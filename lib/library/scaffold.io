Library Scaffold := Object clone do(
  new := method()
  update := method()
  test := method()
  create_root := method(
    Directory createSubdirectory(path)
  )

)
