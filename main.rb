
$cpu_hands = ''
$my_hands = ''
HAND_GU = "g"
HAND_CHOKI = "c"
HAND_PA = "p"
JANKENHANDS = [HAND_GU,HAND_CHOKI,HAND_PA]
NUMBEROFMATCHES = [1,3,5]

def create_number_of_matchs
 puts "何本勝負？(press #{NUMBEROFMATCHES.join(' or ')})"
 number = gets.chomp.to_i
 puts "#{number}本勝負を選びました"
 return number 
end

def do_rock_paper_scissor(number_of_matchs)
    victory = 0
    defeat = 0
    num = 0
    while num < number_of_matchs  do
      puts "#{num + 1}本目"
      puts "じゃんけん…(press #{JANKENHANDS.join(' or ')})"
      $cpu_hands = JANKENHANDS[rand(0..2)]
      $my_hands = gets.chomp.to_s

      if $my_hands == $cpu_hands 
        aiko
      end

      if $my_hands != $cpu_hands 
        show_hand
      end

      #結果の判定
      if $my_hands == HAND_GU && $cpu_hands == HAND_CHOKI ||$my_hands == HAND_CHOKI && $cpu_hands == HAND_PA || $my_hands == HAND_PA && $cpu_hands == HAND_GU
        victory += 1
        puts "勝ち！"
      end

      if $my_hands == HAND_GU && $cpu_hands == HAND_PA || $my_hands == HAND_CHOKI && $cpu_hands == HAND_GU || $my_hands == HAND_PA && $cpu_hands == HAND_CHOKI
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
    $cpu_hands = JANKENHANDS[rand(0..2)]
    $my_hands = gets.chomp.to_s
    if $my_hands == $cpu_hands 
        aiko
    end
end

def show_hand
    if $cpu_hands == HAND_GU
        puts 'CPU…グー'
    elsif $cpu_hands == HAND_CHOKI
        puts 'CPU…チョキ'
    elsif  $cpu_hands == HAND_PA
        puts 'CPU…パー'
    end

    if $my_hands == HAND_GU
        puts 'あなた…グー'
    elsif $my_hands == HAND_CHOKI
        puts 'あなた…チョキ'
    elsif  $my_hands == HAND_PA
        puts 'あなた…パー'
    end
end
number_of_matchs = create_number_of_matchs
do_rock_paper_scissor(number_of_matchs)