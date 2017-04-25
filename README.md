# Modules
Modules are commonly used to include new functionality to a class or another module.
Modules can be included in other modules then included into a class.
This can lead to a complex tree structure of included methods.

# Singleton vs Instance Methods

## Instance Methods
An `instance_method` is a method defined on a class that is only available on an instance of the class.
These methods, when defined on a module, will be included with any instance of a class including the module.

```ruby
module Foo
  def bar
    'bar'
  end
end

class A
  include Foo
end

# A.new.bar => 'bar'
```

## Singleton Methods
A `singleton_method` is a method defined on a class that is available on the class object itself.
When you define a singleton method on a module it will not be available on the class including it.
The singleton method is only available on the module.

```ruby
module Foo
  def self.bar
    'bar'
  end
end

class A
  include Foo
end

# A.bar => NoMethodError
# Foo.bar => 'bar'
```

# Module Singleton Methods
Singleton methods are always defined on the object itself.
Singleton methods defined on a module will not be available on the class including them.
To solve this problem you will need to use `self.included` to add some code to the module.

```ruby
module Foo
  self.included(base) do
    base.extend :ClassMethods
  end

  module ClassMethods
    def bar
      'bar'
    end
  end
end

class A
  include Foo
end

# A.bar => 'bar'
```

The `included` method will add the methods from the `ClassMethods` module defined on the `Foo` module to the class including it, in this case class `A`.

# How to use

This repo is a presentation of how to have a module define a singleton method on the including `class`/`module`.

```bash
ruby presentation.rb
```

User `enter` to step through presentation.

```
Module singleton methods
#############
#############

What is a singleton method?

Instance methods are found on an instance
of a class.
 > Basic.instance_methods
=> [:i_bar]
```
