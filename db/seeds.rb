# frozen_string_literal: true

%w[Sam Jhon Lukas Ben Muller].each do |user|
  User.find_or_create_by(name: user, email: "#{user}@gmail.com")
end

goals = [
  { name: 'Grow our engineering team', key_result: 'Hire ROR Developer' },
  { name: 'Web Onboarding funnel', key_result: 'React base' },
  { name: 'Q-meeting', key_result: 'Malta' }
]

goals.each do |goal|
  created_goal = Goal.find_or_create_by(title: goal[:name], user_id: User.all.sample.id)

  KeyResult.find_or_create_by(title: goal[:key_result], goal_id: created_goal.id)
end

p '====== Seed Done! ======'
