
# =================================
# 1
# Basic Method Concepts

class Basic
  # instance method
  def i_bar
    "I'm an instance_method"
  end

  # singleton methods
  def self.s_bar
    "I'm a singleton_method"
  end

  # also singleton methods
  class << self
    def s_bar2
      "I'm also a singleton_method"
    end
  end
end




# Basic inheritence example
class BasicChild < Basic
end






# =================================
# 2
# Extending Classes through modules
module BasicFoo
  def i_bar
    'instance method'
  end

  def self.s_bar
    'singleton method'
  end
end

class BasicTest
  include BasicFoo
end












# =================================
# 3
# Solution to extending through modules
module Foo
  def self.included(base)
    base.include InstanceMethods
    base.extend ClassMethods
  end

  module InstanceMethods
    def bar1
      'bar1'
    end
  end

  module ClassMethods
    def bar2
      'bar2'
    end
  end
end

class Test
  include Foo
end






# =================================
# 4
# What happens when you include the module in another module
module Bar
  include Foo

  def bar3
    'bar3'
  end
end

class BarTest
  include Bar
end













# =================================
# 5
# What happens when you include the module in another module
# If you need to keep adding this singleton method each time the module is included
# you will need to manually extend the method in each module you have included the
# module.
module FixedBar
  include Foo

  def self.included(base)
    base.extend Foo::ClassMethods
  end
end

class FixedBarTest
  include FixedBar
end









