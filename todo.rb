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

end

class List

end

app = App.new
app.run
