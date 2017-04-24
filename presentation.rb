require './module_singleton_methods'
require './utils/display'

system('clear')
SHOULD_CLEAR = false

def show_source(object, method_name)
  Utils::Display.show_source(object, method_name)
end

system('clear') if SHOULD_CLEAR

puts "Class instance vs singleton methods\n#############"
gets

# Section: 1
puts "Instance methods are found on an instance of a class.\n"
Utils::Display.console_command('Basic.instance_methods') { Utils::Display.my_instance_methods(Basic) }
gets

puts "A singleton method is a method found on a class or module.\n"
Utils::Display.console_command('Basic.singleton_methods')

gets
system('clear') if SHOULD_CLEAR


# Inheritence example
puts "A class can inherit those instance and singleton methods"
puts "\n\tclass BasicChild < Basic\n"
gets
Utils::Display.console_command('BasicChild.instance_methods') { Utils::Display.my_instance_methods(BasicChild, Basic)}
Utils::Display.console_command('BasicChild.singleton_methods')

gets
system('clear') if SHOULD_CLEAR

# Section: 2
# Module Example
puts "Modules defining singleton methods\n#############"

puts "Instance methods are created like the were defined on the class itself."
Utils::Display.console_command('BasicTest.instance_methods') { Utils::Display.my_instance_methods(BasicTest)}
gets

puts "Singleton methods, however, do not behave the same."
Utils::Display.console_command('BasicTest.singleton_methods')

puts 'Wait where are they?'

gets

puts 'The singleton method is on the module `BasicFoo`.'
Utils::Display.console_command('BasicFoo.singleton_methods')

gets
system('clear') if SHOULD_CLEAR

# Section: 3
puts "How do we fix this problem?\n#############"

puts 'The singleton methods need to be extended onto the object including the module'
Utils::Display.console_command('Test.instance_methods') { Utils::Display.my_instance_methods(Test) }
Utils::Display.console_command('Test.singleton_methods')
gets

# Section: 4
puts "What happens when a module is included in another module?\n#############"
Utils::Display.console_command('BarTest.instance_methods') { Utils::Display.my_instance_methods(BarTest) }
Utils::Display.console_command('BarTest.singleton_methods')
puts 'Once again the singleton method is missing.'
gets

puts 'The singleton method was defined on the includer only, in this case that would be the module `Bar`.'
Utils::Display.console_command('Bar.singleton_methods')
gets


# Section: 5
puts "This too can be `fixed`!\n#############"
gets

puts 'The methods from the included module must be extended to any class/module that includes the `FixedBar` module.'
Utils::Display.console_command('FixedBarTest.instance_methods') { Utils::Display.my_instance_methods(FixedBarTest) }
Utils::Display.console_command('FixedBarTest.singleton_methods')
gets

system('clear') if SHOULD_CLEAR
