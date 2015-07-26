Builder := Object clone

OperatorTable addAssignOperator(":","atPutAttributeValue")
Builder curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
       r doMessage(arg)
       )
  r
)
curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
       r doMessage(arg)
       )
  r
)
Map atPutAttributeValue := method(
  self atPut(
       call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""), call evalArgAt(1))
)

#strattributed := "{
#  \"Frnak\": \"555 134\",
#  \"Hailey\": \"555 164\"
#}"
#attr := doString(strattributed)
#writeln(attr)

#writeln({
  #"Frnak": "555 134",
  #"Hailey": "555 134"
#})

writeSpaces := method(numberOfSpaces,
  for(i, 0, numberOfSpaces, write(" "))
)

writeIndented := method(
  args := call message arguments
  writeln(args)

  #indenter := call evalArgAt(0)
  #writeln("Indent by ", indenter)
  ##for(i, 0, numberOfSpaces, write(" "))
  ##writeln(",",arguments)
  #numberOfArguments := size(call message arguments)
  #writeln("number", numberOfArguments)
  ##for(j, 1, numberOfArguments,
    ##writeln(evalArgAt(j)))
)

indent := 0
Builder forward := method(
  #writeIndented(indent, "<", call message name, ">")
  writeSpaces(indent)
  write("<", call message name)
  thing_still_open := true
  indent = indent + 2
  call message arguments foreach(
    arg,
    if(call message name == "ul") then (
      #writeln("Arg is:", arg)
      #writeln("Arg type:", arg type)
      #writeln("Arg sltoNmaes:", arg slotNames)
      #frank := doMessage(arg)
      #li(arg) # How do we pass this through as a string and not a message which gets its name printed?!?
      #writeIndented(indent, "<", call message name, ">")
      #li("Javascript")
      #li(arg name)
      #writeSpaces(indent)
      if(thing_still_open) then (
        writeln(">")
        thing_still_open = false
        )
      writeSpaces(indent)
      writeln("<li>", arg, "</li>")
      #doMessage(li arg)
    ) else (
      content := self doMessage(arg);
      if(content type == "Map",
        content keys foreach(key,
          write(" \"", key, "\"=\"", content at(key), "\""))
          writeln(">"))
      if(content type == "Sequence",
        writeSpaces(indent)
        writeln(content))
        ))
  indent = indent - 2
  writeSpaces(indent)
  writeln("</", call message name, ">"))


#writeln(OperatorTable)

#Builder ul(
  #li("Io"),
  #li("Lua"),
  #li("Javascript"))

# Create a list syntax that uses brackets
Builder ul("Io","Lua","Javascript")

# Enhance the XML program to handle attributes: if the first argument is a map (use the curly brackets syntax), add attributes to the XML program.
#For e.g.
attributer := "{
  \"author\": \"Jez Humble\"
}"

# Should print <book author="Tate">...</book>
# This one evaluates the string, creates a map then passes it in to be looped through
Builder book(doString(attributer), "Lean Enterprise")
# This one prints out the thing as a string
#Builder book(attributer, "Lean Enterprise")
# This one tries to call method : on Sequence
#Builder book({"author" : "Jez Humble"},"Lean Enterprise")
