Builder := Object clone
Builder n := 0
Builder forward := method(
  for(i, 0, n, write("  "))
  n = n + 1
  writeln("<", call message name, ">")
  call message arguments foreach(
    arg,
    content := self doMessage(arg);
    if(content type == "Sequence", 
      for(i, 0, n, write("  "));
      writeln(content)))
  n = n - 1
  for(i, 0, n, write("  "))
  writeln("</", call message name, ">"))

Builder ul(
  li("Io"),
  li("Lua"),
  li("Javascript"))
