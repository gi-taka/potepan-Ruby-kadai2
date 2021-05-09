#初期値設定
$janken_choices = ["グー", "チョキ", "パー"] #ジャンケンの選択肢
#ジャンケンの勝敗　例）プレイヤー：0（グー）　相手：1（チョキ）なら$janken_result[0][1]で"win"の結果が得られる。
$janken_result = [
  ["draw","win","lose"],
  ["lose","draw","win"],
  ["win","lose","draw"]
  ]
$atchimuite_hoi_choices = ["上","下","右","左"] #あっちむいてほいの選択肢
$draw_flag = false #ジャンケンの結果があいこの場合はtrue
$player_win_flag = false #ジャンケンの結果が勝ちの場合はtrue

#ジャンケンの処理
def janken_game
  $player_win_flag = false
  if $draw_flag == false then
    puts "じゃんけん..."
  end
  puts "0:グー 1:チョキ 2:パー 3:戦わない"
  player_choice = gets.to_s.chomp
  opponent_choice = Random.rand(3).to_s.chomp
  if player_choice != "3"
    if $draw_flag != true then
      puts "ホイ！"
      puts "-----------------------"
    else
      puts "ショ！"
      puts "-----------------------"
    end
  end
  case player_choice
    when "0","1","2"
      puts "あなた：#{$janken_choices[player_choice.to_i]}を出した"
      puts "相手　：#{$janken_choices[opponent_choice.to_i]}を出した"
      case $janken_result[player_choice.to_i][opponent_choice.to_i]
        when "draw"
          $draw_flag = true
          puts "あいこで..."
          janken_game
        when "win"
          $draw_flag = false
          $player_win_flag = true
          atchimuite_hoi_game
        when "lose"
          $draw_flag = false
          atchimuite_hoi_game
      end
    when "3"
      puts "ゲーム終了"
  else
    puts "無効な値です。選び直してください。"
    janken_game
  end
end

#あっちむいてほいの処理
def atchimuite_hoi_game
  puts "あっちむいて..."
  puts "0:上 1:下 2:右 3:左"
  player_choice = gets.to_s.chomp
  opponent_choice = Random.rand(4).to_s.chomp
  puts "ホイ！"
  puts "-----------------------"
  puts "あなた：#{$atchimuite_hoi_choices[player_choice.to_i]}"
  puts "相手　：#{$atchimuite_hoi_choices[opponent_choice.to_i]}"
  if player_choice != opponent_choice then
    janken_game
  elsif
    if $player_win_flag == true then
      puts "あなたの勝ちです"
      puts "-----------------------"
      janken_game
    else
      puts "あなたの負けです"
      puts "-----------------------"
      janken_game
    end
  end
end

janken_game