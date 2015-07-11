Builder := Object clone

writeSpaces := method(numberOfSpaces,
  for(i, 0, numberOfSpaces, write(" "))
)

writeIndented := method(
  varName := (call message arguments) first
  indentBy := call message indent
  writeln("Indent by ", indentBy)
  #for(i, 0, numberOfSpaces, write(" "))
  writeln("Rest of string here")
)

indent := 0
Builder forward := method(
  #writeIndented(indent, "<", call message name, ">")
  writeSpaces(indent)
  writeln("<", call message name, ">")
  indent = indent + 2
  call message arguments foreach(
    arg,
    if(call message name == "ul") then (
      writeln("Arg is:", arg)
      #writeln("Arg type:", arg type)
      #writeln("Arg sltoNmaes:", arg slotNames)
      li(arg) # How do we pass this through as a string?!?
      #doMessage(li arg)
    ) else (
      content := self doMessage(arg);
      # Should be able to do this betterer
      if(content type == "Sequence",
        writeSpaces(indent)
        writeln(content))))
  indent = indent - 2
  writeSpaces(indent)
  writeln("</", call message name, ">"))


# This is for the attributes
Sequence atPutNumber := method(
  self atPut(
    call evalArgAt(0) as Mutable removePrefix("\"") removeSuffix("\""),
      call evalArgAt(1))
)

# Makes : an assignment operator for the "key": "value" syntax
OperatorTable addAssignOperator(":", "atPutNumber")

# Returns a map created from "key": "value" syntax
Builder curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
    r doMessage(arg))
  r
)

#Builder ul(
  #li("Io"),
  #li("Lua"),
  #li("Javascript"))

# Create a list syntax that uses brackets
Builder ul("Io","Lua","Javascript")

# Enhance the XML program to handle attributes: if the first argument is a map (use the curly brackets syntax), add attributes to the XML program.
#For e.g.
Builder book({"author":"Jez Humble"},"Lean Enterprise")
# Should print <book author="Tate">...</book>
