doRelativeFile("lib/library.io")
require("library/version")

Library Library := Library cloneWith({
  details := "This is a library manager and tool for Io",
  author := "Kurtis Rainbolt-Greene (@krainboltgreene)",
  version := Version clone setMajor(1) setMinor(0) setPatch(0),
  repository := "http://github.com/krainboltgreene/library.io/",
  documentation := "http://krainboltgreene.github.com/library.io/documentation/",
  changelog := "http://krainboltgreene.github.com/library.io/changelog/"
})
