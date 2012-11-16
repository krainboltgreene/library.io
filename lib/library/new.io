name := arguments third

directories := list(
  "#{name}.io",
  Path with("#{name}.io", "lib"),
  Path with("#{name}.io", "test"),
  Path with("#{name}.io", "ex"),
  Path with("#{name}.io", "lib", "#{name}"),
  Path with("#{name}.io", "test", "#{name}")
)

files := list(
  list("README.mdown", "readme.mdown"),
  list(".gitignore", "gitignore"),
  list("LICENSE", "license"),
  list("lib.io", "lib.io"),
  list(Path with("test", "#{name}.io"), "test_library.io"),
  list(Path with("lib", "#{name}.io"), "lib_library.io"),
  list(Path with("lib", "#{name}", ".gitkeep"), "gitkeep"),
  list(Path with("test", "#{name}", ".gitkeep"), "gitkeep"),
  list(Path with("ex", ".gitkeep"), "gitkeep")
)

if(options hasKey("-b"),
  directories append(Path with("#{name}.io", "bin"))
  files append(list(Path with("bin", "#{name}"), ""))
)

directories foreach(directory,
  Directory createSubdirectory(directory interpolate)
)

files foreach(file,
  source_file := File thisSourceFile
  source_directory := source_file parentDirectory
  template_directory := Path with(source_directory path, "templates")
  template_file := File with(Path with(template_directory, file last))
  template := File with(template_file path) contents
  clone_file := File open(Path with("#{name}.io", file first) interpolate)
  clone_file write(template interpolate)
)
