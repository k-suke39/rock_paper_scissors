$cpu_hands = ''
$my_hands = ''
HAND_GU = "g"
HAND_CHOKI = "c"
HAND_PA = "p"
JANKENHANDS = [HAND_GU,HAND_CHOKI,HAND_PA]
NUMBEROFMATCHES = [1,3,5]

def create_number_of_matches
  puts "何本勝負？(press #{NUMBEROFMATCHES.join(' or ')})"
  number = gets.chomp.to_i
  number_exists(number)
end

def do_rock_paper_scissor(number_of_matches)
  victory = 0
  defeat = 0
  num = 0
  while num < number_of_matches do
    puts "#{num + 1}本目"
    puts "じゃんけん…(press #{JANKENHANDS.join(' or ')})"
    @cpu_hands = JANKENHANDS[rand(0..2)]
    @my_hands = gets.chomp.to_s
    hands_exists(@my_hands)
    #結果の判定
    if @my_hands == HAND_GU && @cpu_hands == HAND_CHOKI || @my_hands == HAND_CHOKI && @cpu_hands == HAND_PA || @my_hands == HAND_PA && @cpu_hands == HAND_GU
      victory += 1
      puts "勝ち！"
    end
    if @my_hands == HAND_GU && @cpu_hands == HAND_PA || @my_hands == HAND_CHOKI && @cpu_hands == HAND_GU || @my_hands == HAND_PA && @cpu_hands == HAND_CHOKI
      defeat += 1
      puts "負け！"
    end
      puts "#{victory}勝#{defeat}敗"
      num += 1
  end
    if victory > defeat
      puts "結果\n#{victory}勝#{defeat}敗であなたの勝ち"
    else
      puts "結果\n#{victory}勝#{defeat}敗であなたの負け"
    end
end

def aiko 
  show_hand 
  puts "あいこで...(press #{JANKENHANDS.join(' or ')})"
  @cpu_hands = JANKENHANDS[rand(0..2)]
  @my_hands = gets.chomp.to_s
  hands_exists(@my_hands)
end

def show_hand
  if @cpu_hands == HAND_GU
    puts 'CPU…グー'
  elsif @cpu_hands == HAND_CHOKI
    puts 'CPU…チョキ'
  elsif  @cpu_hands == HAND_PA
    puts 'CPU…パー'
  end
  if @my_hands == HAND_GU
    puts 'あなた…グー'
  elsif @my_hands == HAND_CHOKI
    puts 'あなた…チョキ'
  elsif  @my_hands == HAND_PA
    puts 'あなた…パー'
  end
end  

def number_exists(number)
  if NUMBEROFMATCHES.include?(number)
    puts "#{number}本勝負を選びました"
    number
  else
    puts "#{NUMBEROFMATCHES.join(',')}のいずれかの値を入力してください"
    create_number_of_matches
  end
end

def hands_exists(hands)
  if JANKENHANDS.include?(hands)
    if hands == @cpu_hands 
      aiko
    else
      show_hand
    end
  else
    puts "#{JANKENHANDS.join(',')}のいずれかの値を入力してください"
    hands = gets.chomp.to_s
    hands_exists(hands)
  end
end

number_of_matches = create_number_of_matches
do_rock_paper_scissor(number_of_matches)