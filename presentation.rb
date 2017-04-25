require './module_singleton_methods'
require './utils/display'

system('clear')
SHOULD_CLEAR = true

def show_source(object, method_name)
  Utils::Display.show_source(object, method_name)
end

system('clear') if SHOULD_CLEAR

puts "Module singleton methods\n#############\n#############"
gets

puts "What is a singleton method?"
gets
# eval('binding.pry')
# Section: 1
puts "Instance methods are found on an instance \nof a class.\n"
Utils::Display.console_command('Basic.instance_methods') { Utils::Display.my_instance_methods(Basic) }
gets

puts "A singleton method is a method found on a \nclass or module.\n"
Utils::Display.console_command('Basic.singleton_methods')

gets
system('clear') if SHOULD_CLEAR


# Inheritence example
puts "A class can inherit those instance and singleton \nmethods"
puts "\n\tclass BasicChild < Basic\n"
gets
Utils::Display.console_command('BasicChild.instance_methods') { Utils::Display.my_instance_methods(BasicChild, Basic)}
Utils::Display.console_command('BasicChild.singleton_methods')

gets
system('clear') if SHOULD_CLEAR

# Section: 2
# Module Example
puts "Modules defining singleton methods\n#############"
gets

puts "Instance methods are available like \nthey were defined on the class itself."
Utils::Display.console_command('BasicTest.instance_methods') { Utils::Display.my_instance_methods(BasicTest)}
gets

puts "Singleton methods, however, do not behave \nthe same."
Utils::Display.console_command('BasicTest.singleton_methods')
gets

puts 'Wait where are they?'
gets

puts "The singleton method is on the module \n`BasicFoo`."
Utils::Display.console_command('BasicFoo.singleton_methods')

gets
system('clear') if SHOULD_CLEAR

# Section: 3
puts "How do we fix this problem?\n#############"
gets

puts "The singleton methods need to be extended \nonto the object including the module."
Utils::Display.console_command('Test.instance_methods') { Utils::Display.my_instance_methods(Test) }
Utils::Display.console_command('Test.singleton_methods')
gets

system('clear') if SHOULD_CLEAR

# Section: 4
puts "What happens when a module is included in \nanother module?\n#############"
gets

Utils::Display.console_command('BarTest.instance_methods') { Utils::Display.my_instance_methods(BarTest) }
Utils::Display.console_command('BarTest.singleton_methods')
puts 'Once again the singleton method is missing.'
gets

puts "The singleton method was defined on the module\n that included the module `Foo`."
Utils::Display.console_command('Bar.singleton_methods')
gets

system('clear') if SHOULD_CLEAR


# Section: 5
puts "This too can be `fixed`!\n#############"
gets

puts "The methods from the included module must be extended\n to any class/module that includes the `FixedBar`\n module."
Utils::Display.console_command('FixedBarTest.instance_methods') { Utils::Display.my_instance_methods(FixedBarTest) }
Utils::Display.console_command('FixedBarTest.singleton_methods')
gets

system('clear') if SHOULD_CLEAR

puts "\n\n\n\n\t\t\tFin.\n\n\n\n\n\n"
gets
gets
system('clear') if SHOULD_CLEAR
