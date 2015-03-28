require 'csv'


League.find_or_create_by(name: "National")
League.find_or_create_by(name: "American")

csv_text = File.read('support/odds.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  Team.find_or_create_by(
  name: row[0],
  odds: row[1],
  league: (League.find_by name: row[2])
  )
end
