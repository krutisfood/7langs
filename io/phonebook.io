OperatorTable addAssignOperator(":","atPutNumber")
curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
       #writeln("Executing curly brackets arg:",arg, ", type:", arg type)
       #r doMessage(atPutNumber(arg))
       r doMessage(arg)
       )
  r
)
Map atPutNumber := method(
  writeln("We're inspecting",call message name, "Zero arg")
  self atPut(
       call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""), call evalArgAt(1))
)
#Sequence atPutNumber := Map getSlot("atPutNumber")

#s := File with("phonebook.txt") openForReading contents
#phoneNumbers := doString(s)
#phoneNumbers keys   println
#phoneNumbers values println

#phoneNumbers keys foreach(key,
  #phoneNumbers at(key) println
  #)

Sequence : := method(
#  writeln("We're inspecting",call message name, "Zero arg",evalArgAt(0))
  self atPut(
       call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""), call evalArgAt(1))
)
#Sequence : := method(arg,
  #call message arguments foreach(arg,
    #writeln("This is your arg:", arg)
    #))

writeln({
  "Joe Bloggs": "555 555 555",
  "Josephine Bloggs": "555 555 551"})

