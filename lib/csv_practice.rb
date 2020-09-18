require 'csv'
require 'awesome_print'

def get_all_olympic_athletes(filename)
  athlete_fields = %w[ID Name Height Team Year City Sport Event Medal]
  olympic_athletes = []
  CSV.read('../data/athlete_events.csv', headers: true).each do |athlete_row|
    athlete = {}
    athlete_fields.each do |field_name|
      athlete[field_name] = athlete_row[olympic_athletes]
    end  
    olympic_athletes << athlete
  end
  return olympic_athletes
end


def total_medals_per_team(olympic_data)
  athletes_with_medals = olympic_data.filter {|athlete| athlete[:Medal] != 'NA' }
  athletes_grouped_by_team = athletes_with_medals.group_by {|athlete| athlete[:Team]}
  all_teams_with_medals = athletes_grouped_by_team.map {|team, athletes| [team, athletes.length]}
  return all_teams_with_medals.to_h
end

def get_all_gold_medalists(olympic_data)
end
