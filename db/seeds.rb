require 'csv'




League.find_or_create_by(name: "National")
League.find_or_create_by(name: "American")


csv_text = File.read('support/odds.csv')
prediction_csv_text = File.read('support/prediction.csv')
csv = CSV.parse(csv_text, :headers => true)
prediction_csv = CSV.parse(prediction_csv_text, :headers => true)

# Check if viewership data is null.
# If so, take overall average from row 32
def check_null(number, prediction_csv, team_count)
  if prediction_csv[team_count][number].to_f == 0.0
    prediction_csv[30][number].to_f
  else
    prediction_csv[team_count][number].to_f
  end
end


team_count = 0
csv.each do |row|
  Team.find_or_create_by(
  name: row[0],
  odds: row[1],
  league: (League.find_by name: row[2]),
  one_to_four_viewership: check_null(1, prediction_csv, team_count),
  game_five_viewership: check_null(2, prediction_csv, team_count),
  game_six_viewership: check_null(3, prediction_csv, team_count),
  game_seven_viewership: check_null(4, prediction_csv, team_count)
  )
team_count += 1
end
