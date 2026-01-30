# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Seeding positions..."
positions = %w["Forward", "Guard", "Center", "Shooting-Guard", "Power-Forward"].map do |name|
  Position.create!(name: name)
end

puts "Seeding athletes..."
athletes = [
  { name: 'John Quick', initials: 'JQ' },
  { name: 'Jane Fast', initials: 'JF' },
  { name: 'Jim Strong', initials: 'JS' },
  { name: 'Sarah Swift', initials: 'SS' },
  { name: 'Mike Power', initials: 'MP' },
  { name: 'Emma Grace', initials: 'EG' }
].map { |data| Athlete.create!(data) }

puts "Creating match sessions and session participations..."
5.times do |i|
  ms = MatchSession.create!(
    startTime: "2024-01-#{(i + 1).to_s.rjust(2, '0')} 10:00:00",
    our_team: "Team #{i + 1}",
    opponent: "Opponent #{i + 1}",
    score: rand(50..100),
    opponentScore: rand(50..100)
  )

  # create a few session participations for this match session
  3.times do |j|
    athlete = athletes.sample
    position = positions.sample

    sp = SessionParticipation.create!(
      athlete: athlete,
      match_session: ms,
      position: position,
      startingSquad: [ true, false ].sample
    )  end
  end
  puts "Seed summary: Athletes=#{Athlete.count}, Positions=#{Position.count}, MatchSessions=#{MatchSession.count}, SessionParticipations=#{SessionParticipation.count}"
