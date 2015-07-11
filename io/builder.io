Builder := Object clone

writeSpaces := method(numberOfSpaces,
  for(i, 0, numberOfSpaces, write(" "))
)

indent := 0
Builder forward := method(
  writeSpaces(indent)
  writeln("<", call message name, ">")
  indent = indent + 2
  call message arguments foreach(
    arg,
    content := self doMessage(arg);
    # Should be able to do this betterer
    if(content type == "Sequence",
      writeSpaces(indent)
      writeln(content)))
  indent = indent - 2
  writeSpaces(indent)
  writeln("</", call message name, ">"))

Builder ul(
  li("Io"),
  li("Lua"),
  li("Javascript"))

