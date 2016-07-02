targets = $stdin.readlines.drop(1).map { |line| line.strip.to_i }

def is_possible(target, new_flag, counter = 1, output = 1)
  if new_flag
    @target = target
  end
  @output = output
  @counter = counter
  if @target == @output
    @counter
  elsif @target < @output
    false
  else 
    @counter += 1
    @output = @output + @counter
    is_possible(@output, false, @counter, @output)
  end
end

targets.each do |target|
  if is_possible(target, true)
    puts "Go On Bob #{@counter}"
  else
    puts "Better Luck Next Time"
  end 
end
