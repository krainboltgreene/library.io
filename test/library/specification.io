SpecificationTest := UnitTest clone do(
  setUp := method(
    super(setUp)
    self specification := Library Specification clone
  )

  tearDown := method(
    super(tearDown)
    self specification := nil
  )

  testUriFrom := method(
    expected := "git://github.com/krainboltgreene/library.io.git"
    actual := specification uriFrom("git://github.com", "krainboltgreene/library.io")
    assertEquals(expected, actual)
  )

  testPathFrom := method(
    expected := ".libraries/krainboltgreene/library.io"
    actual := specification pathFrom("krainboltgreene/library.io")
    assertEquals(expected, actual)
  )

  testPathFromWithRoot := method(
    expected := ".libraries/jason/iosamples.io/krainboltgreene/library.io"
    actual := specification pathFrom("krainboltgreene/library.io", "jason/iosamples.io")
    assertEquals(expected, actual)
  )

  testCommandFrom := method(
    expected := "git clone git://github.com/krainboltgreene/library.io.git .libraries/krainboltgreene/library.io"
    actual := specification commandFrom("git://github.com", "krainboltgreene/library.io")
    assertEquals(expected, actual)
  )

  testCommandFromWithRoot := method(
    expected := "git clone git://github.com/krainboltgreene/library.io.git .libraries/json/iosamples.io/krainboltgreene/library.io"
    actual := specification commandFrom("git://github.com", "krainboltgreene/library.io", "json/iosamples.io")
    assertEquals(expected, actual)
  )

)
