# Truthiness

Computers have a very strict idea of when things are *true* and *false*.

![Truthiness](truthiness.png)

# True or False?

Try the following in irb:

* `1 < 2`
* `2 + 2 < 5`
* `2.even?`
* `4.odd?`
* `"apple".empty?`
* `"".empty?`

# Conditions

The magic word `if` is called a CONDITIONAL.

    if age < 18 then
      puts "Sorry, adults only."
    end

# if... then... else... end

The magic word `else` allows BRANCHING.

    if age >= 18 then
      puts "allowed"
    else
      puts "denied"
    end

Like a fork in the road, the program chooses one path or the other.

(In Ruby, `then` is optional, so we usually leave it off, but if it makes your code clearer, go ahead and use it.)

# The Tragedy of the Equal Sign

* a single equal sign means ASSIGNMENT
  * `name = "Alice"` -- "assign the variable 'name' to the value 'Alice'"
* two equal signs means COMPARISON
  * `name == "Alice"` -- "does the variable 'name' contain the string 'Alice'?"

> This is confusing, and you should feel confused.

# LAB: Good Friend, Bad Friend

* Your `hello.rb` program should currently look something like this:

        puts "What is your name?"
        name = gets.strip
        puts "Hello, " + name + "!"

* Change `hello.rb` so that it doesn't always say hello!
* If the user's name is "Darth" then say "Oh no! It's Darth!"

# Conjunction Junction

* You can make more complicated logical expressions using conjunctions like `and`, `or`, `not`:
  * `X and Y` means "are both X and Y true?"
  * `X or Y` means "is either X or Y (or both) true?"
  * `not X` means "is X false?" (think about it)

* For example:

        if age >= 18 or parent.gave_permission? then
          puts "allowed"
        else
          puts "denied"
        end

# LAB: Enemies List

* Change `hello.rb` so that it says "Oh no!" if the user's name is any one of a number of evil names
* For instance, Voldemort, Satan, Lex Luthor...

