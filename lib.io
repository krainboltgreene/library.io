doFile("lib/library.io")

LibraryIo := Library Specification clone do(
  setDetails("This is a library manager and tool for Io")
  setAuthor("Kurtis Rainbolt-Greene (@krainboltgreene)")
  setVersion(Library Version clone setMajor(1) setMinor(0) setPatch(0))
  setRepository("http://github.com/krainboltgreene/library.io/")
  setDocumentation("http://krainboltgreene.github.com/library.io/documentation/")
  setChangelog("http://krainboltgreene.github.com/library.io/changelog/")
  setDependencies(list(
    "krainboltgreene/ostruct.io"
  ))
) setupUsing("git://github.com")
