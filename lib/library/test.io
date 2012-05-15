# Test := Object clone do(
#   # Looking for true
#   assert := method(value, print_result(value))

#   # Looking for false
#   refute := method(value, print_result(!value))

#   # Compares both values and checks to see if they are equal
#   assert_equal := method(expected, actual, assert(expected == actual))

#   # Compares both values and checks to see if they aren't equal
#   refute_equal := method(expected, actual, assert(expected != actual))

#   # Prints out a nifty ✓ if the passed value is true, or an ✗ if it's false.
#   print_result := method(boolean, if(boolean, passing; "✓", failing; "✗") print)

#   # The initial passing count and the holder for the count
#   pass := 0

#   # The initial failing count and the holder for the count
#   fail := 0

#   # Ups the passing count by one
#   passing := method(pass = pass + 1)

#   # Ups the failing count by one
#   failing := method(fail = fail + 1)


#   # At the end of the test print out the stats
#   report := method("\nPassing: #{pass}, Failing: #{fail}, Total: #{pass + fail}" interpolate println)
# )
