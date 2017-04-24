require 'method_source'
require 'pry'

module Utils
  module Display
    def self.my_instance_methods(klass, super_klass = nil)
      if super_klass
        klass.instance_methods - super_klass.superclass.instance_methods
      else
        klass.instance_methods - klass.superclass.instance_methods
      end
    end

    def self.console_command(command)
      puts " > #{command}"
      puts "=> #{block_given? ? yield : eval(command)}"
    end

    # puts Utils::Display.show_source(Klass.new, :method_name)
    # requires https://github.com/banister/method_source
    def self.show_source(object, name)
      object.method(name).source
    end
  end
end
