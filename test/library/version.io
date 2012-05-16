VersionTest := UnitTest clone do(
  setUp := method(
    super(setUp)
    self version := Library Version clone
  )

  tearDown := method(
    super(tearDown)
    self version := nil
  )

  testMajorDefault := method(
    expected := 0
    actual := version major
    assertEquals(expected, actual)
  )

  testMinorDefault := method(
    expected := 0
    actual := version minor
    assertEquals(expected, actual)
  )

  testPatchDefault := method(
    expected := 0
    actual := version patch
    assertEquals(expected, actual)
  )
)
