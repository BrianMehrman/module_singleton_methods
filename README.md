# Modules
Modules are commonly used to include new functionality to a class or another module.
Modules can be included in other modules then included into a class.
This can lead to a complex tree structure of included methods.

# Singleton vs Instance Methods

## Instance Methods
An instance method is a method defined on a class that is only available on a instance of the class.
These methods, when defined on a module, will be included with any instance of a class including the module.

```
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
Singleton method is a method defined on a class that is avaible on the class object itself.
When you define a singleton method on a module it

```
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

# Singleton Module Methods
Singleton methods are always on the object itself.
To solve the problem of having a module add a singleton method to a class that is including the module you will need to add some code to the module.

```
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

The `included` method will add the methods from the `ClassMethods` module defined in the `Foo` module to the includer, in this case class `A`.

