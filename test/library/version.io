VersionTest := UnitTest clone do(
  setUp := method(
    super(setUp)
    self object := Library Version clone
  )

  tearDown := method(
    super(tearDown)
    self object := nil
  )

  testMajorDefault := method(
    expected := 0
    actual := object major
    assertEquals(expected, actual)
  )
)
