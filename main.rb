
$cpu_hands = ''
$my_hands = ''
JANKENHANDS = ['g','c','p']
NUMBEROFMATCHES = [1,3,5]

def create_number_of_matchs
 puts '何本勝負？(press 1 or 3 or 5)'
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
      puts 'じゃんけん…(press g or c or p)'
      $cpu_hands = JANKENHANDS[rand(0..2)]
      $my_hands = gets.chomp.to_s

      if $my_hands == $cpu_hands 
        aiko
      end

      if $my_hands != $cpu_hands 
        show_hand
      end
      #グーの場合
      if $my_hands == 'g' && $cpu_hands == 'c'
        victory += 1
      elsif  $my_hands == 'g' && $cpu_hands == 'p'
        defeat += 1
      end

      #チョキの場合
      if $my_hands == 'c' && $cpu_hands == 'p'
        victory += 1
      elsif  $my_hands == 'c' && $cpu_hands == 'g'
        defeat += 1
      end

      #パーの場合
      if $my_hands == 'p' && $cpu_hands == 'g'
        victory += 1
      elsif  $my_hands == 'p' && $cpu_hands == 'c'
        defeat += 1
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
    puts 'あいこで…(press g or c or p)'
    $cpu_hands = JANKENHANDS[rand(0..2)]
    $my_hands = gets.chomp.to_s
    if $my_hands == $cpu_hands 
        aiko
    end
end

def show_hand
    if $cpu_hands == 'g'
        puts 'CPU…グー'
    elsif $cpu_hands == 'c'
        puts 'CPU…チョキ'
    elsif  $cpu_hands == 'p'
        puts 'CPU…パー'
    end

    if $my_hands == 'g'
        puts 'あなた…グー'
    elsif $my_hands == 'c'
        puts 'あなた…チョキ'
    elsif  $my_hands == 'p'
        puts 'あなた…パー'
    end
end

number_of_matchs = create_number_of_matchs
do_rock_paper_scissor(number_of_matchs)
