proc_object = proc do |event, file, line, id, binding, klass| 
  puts "#{event} in #{file}/#{line} #{id} #{klass}"
end

set_trace_func(proc_object)

# Since date is apparently already loaded, we will also
# load treetop to generate some serious tracing.
#
require 'date'
require 'treetop'
