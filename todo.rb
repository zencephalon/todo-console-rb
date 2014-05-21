class Parser
  def parse(input)
    return :interactive if input.empty?

    if input[0] == "add"
      return {cmd: :add, input: input[1..-1]}
    elsif input[0] == "list"
      return {cmd: :list, input: input[1..-1]}
    end
  end

end

class App
  def initialize
    @parser = Parser.new
  end

  def run
    parsed = @parser.parse(ARGV)
    
    interactive if parsed[:cmd] == :interactive
    add(parsed[:input]) if parsed[:cmd] == :add
    list(parsed[:input]) if parsed[:cmd] == :list
  end

end

# Models
class Task
  def initialize(description, todo = true)
    @description = description
    @todo = todo
  end

  def to_s
    str = ""
    if @todo
      str << "[ ] "
    else
      str << "[X] "
    end
    str << description
  end

  def self.parse(str)
    if str[0..2] == "[ ]"
      todo = true
    else
      todo = false
    end
    return self.new(str[4..-1], todo)
  end

  def complete
    @todo = false
  end
end

class List
  def initialize
    @tasks = []
  end

  def load
    
  end

  def complete(task)
    @tasks[task].complete
  end

  def add_task(description)
    @tasks << Task.new(description)
  end

  def to_s
    str = ""
    @tasks.each_with_index do |task, index|
      str << "#{index}." + task + "\n"
    end
    str
  end

  def save
    File.open("todos.txt") do |f|
      f.puts to_s
    end
  end
end

app = App.new
app.run
