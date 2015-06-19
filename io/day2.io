# ************************** Day 2 ****************************

###############################################################
# 1. Fibonacci Series
###############################################################
maths := Object clone

# Looping solution
maths fib_loop := method(index,
         current := 1; last := 0;
         while (index >= 2, index = index - 1; 
                outgoing_current := current;
                current = current + last; 
                last = outgoing_current); 
         current)

# Elixir inspired recursive solution
maths fib_recurse := method(index,
                            _fib_recurse(index, 1, 0))
maths _fib_recurse := method(index, current, last,
                            if(index <= 1, current, _fib_recurse(index - 1, current + last, current)))

"I proudly bring to you the fibonacci series" println
for(i, 1, 10, 1, maths fib_loop(i) println)
"And now the recursive solution" println
for(i, 1, 10, 1, maths fib_recurse(i) println)

###############################################################
# 2. Monkey patch divide by zero
###############################################################

# Figure out where / is defined, is it on the integers?
1 slotNames
# Nope, what's the type of an integer?
1 type
# aha! Number, that seems like a good place for it to be...
Number slotNames
# Found it! Now to get it
original_div := Number getSlot("/")

# Now to redefine it!
Number / := method(denominator, 
                   if(denominator == 0, 0, self original_div(denominator)))
#self / denominator)

"5 / 0 = " println
5 / 0 println
"5 / 2 =" println
5 / 2 println

