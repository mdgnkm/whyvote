# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create({ first_name: 'A.', last_name: 'Admin', email: 'admin@uwaterloo.ca', password: 'admin123', password_confirmation: 'admin123', admin: true })

c = Party.create({ name: 'Conservative' })
l = Party.create({ name: 'Liberal' })
n = Party.create({ name: 'NDP' })
g = Party.create({ name: 'Green' })

s  = Survey.create({ name: 'Political Systems', description: 'Description of Survey' })
q1 = Question.create({ survey: s, text: 'Which system should Canada use to elect its leaders?', description: 'Canada’s current electoral system is based on the First Past the Post (FPTP) system. FPTP is where the candidate with the most votes in a riding wins a seat (an absolute majority is not necessary) in the House of Commons and represents that riding as its Member of Parliament. The alternative to the FPTP system is Proportional Representation (PR), which includes a range of electoral systems. In PR, the distribution of seats corresponds closely with the proportion of the total votes cast for each party or individual candidate.', format: 'selection' })
Option.create({ question: q1, text: 'The First Past the Post (FPTP) system', party_ids: [c.id] })
Option.create({ question: q1, text: 'Proportional Representation (PR)', party_ids: [l.id, n.id] })
q2 = Question.create({ survey: s, text: 'How should Canada work towards carbon emissions reduction?', description: 'In May 2015, Canada announced its latest pledge to reduce carbon emissions by 30% below 2005 levels by 2030. In the past, Canada has pledged to reduce emissions by 17 per cent below 2005 levels by 2020, but this goal has not yet been met.', format: 'selection' })
Option.create({ question: q2, text: 'Restrict emissions on coal-fired power plants and regulate vehicle emissions standards', party_ids: [c.id] })
Option.create({ question: q2, text: 'No unilateral, carbon pricing national scheme; but work closely with provinces to advance individual carbon pricing schemes', party_ids: [l.id] })
Option.create({ question: q2, text: 'A national, revenue-generating carbon pricing scheme; with exemptions to provinces who are meeting reduction targets', party_ids: [n.id] })
Option.create({ question: q2, text: 'A national revenue-neutral carbon pricing scheme; paying a dividend back to citizens who consume less energy', party_ids: [g.id] })
