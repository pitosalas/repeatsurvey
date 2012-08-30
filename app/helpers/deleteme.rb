class X
  def hello
    "hello"
  end

  def goodbye
    "goodbye"
  end
end

@x = X.new

def doit m
  @x.send m
end

puts doit :hello

