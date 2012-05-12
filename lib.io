doFile("lib/library.io")

LibraryIo := Library Specification clone do(
  setDetails("This is a library manager and tool for Io")
  setAuthor("Kurtis Rainbolt-Greene (@krainboltgreene)")
  setVersion( Library Version clone setMajor(1) )
  setPage("http://library-io.io")
  setDependencies(list(
    "krainboltgreene/ostruct.io"
  ))
) setupUsing("git://github.com")
