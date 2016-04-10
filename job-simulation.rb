require './Stack.rb'
require './Queue.rb'

waiting = Queue.new
working = Stack.new

### Initial Waiting List: ###
waiting.enqueue(1)
waiting.enqueue(2)
waiting.enqueue(3)
waiting.enqueue(4)
waiting.enqueue(5)
waiting.enqueue(6)
waiting.enqueue(7)
waiting.enqueue(8)
waiting.enqueue(9)
waiting.enqueue(10)
waiting.enqueue(11)
waiting.enqueue(12)

### Initial hired workers: ###
hire_1 = waiting.dequeue
working.hire(hire_1)

hire_2 = waiting.dequeue
working.hire(hire_2)

hire_3 = waiting.dequeue
working.hire(hire_3)

hire_4 = waiting.dequeue
working.hire(hire_4)

hire_5 = waiting.dequeue
working.hire(hire_5)

hire_6 = waiting.dequeue
working.hire(hire_6)

#### Program start: ####
puts "Hello, Mister Manager! Welcome to Insane Co., where we fire people based on whim and random happenstance! Every three months we ask you to roll a die, and when you do, Insane Co. will fire and subsequently hire that many people. Turns out, it's been three months... are you ready to roll the dice? Please enter y for yes, and n for no."

roll_or_no = gets.chomp

until roll_or_no == "n"
  if roll_or_no == "y"
    roll_result = rand(1..6)
    fired_workers = []
    hired_workers = []
    puts "Ok, you rolled #{ roll_result }, meaning we have fired and then hired #{ roll_result } people."

    roll_result.times do
      fired = working.fire
      fired_workers << fired
      puts "We have fired #{ fired }."
    end

    roll_result.times do
      hired = waiting.dequeue
      hired_workers << hired
      puts "We have hired #{ hired }."
    end

    fired_workers.each do |fired|
      waiting.enqueue(fired)
    end

    hired_workers.each do |hired|
      working.hire(hired)
    end

    puts "We now have #{ waiting.store } waiting for work."

    puts "It's been three months again! Are you ready to roll the dice? Please enter y for yes, and n for no."
    roll_or_no = gets.chomp
  end
end

if roll_or_no == "n"
  puts "Ok, Mister Manager, since you are unable to perform the duties of your job, YOU are fired. Security will lead you out."
end
