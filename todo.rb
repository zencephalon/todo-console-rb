class Parser
  def parse(input)
    cmd = nil
    return cmd
  end

end

class App
  def initialize
    @parser = Parser
  end

  def run
    @parser.parse(ARGV)
  end

end

# Models
class Task

end

class List

end
