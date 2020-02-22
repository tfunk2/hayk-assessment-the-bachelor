require 'pry'

def get_first_name_of_season_winner(data, season)
  contestants = data[season]

  season_winner = contestants.find do |contestant|
    contestant["status"] == "Winner"
  end
  season_winner["name"].split.first
end

def get_contestant_name(data, occupation)
  contestants_array = data.values.flatten
  contestant_matching_occupation = contestants_array.find do |contestant|
    contestant["occupation"] == occupation
  end
  contestant_matching_occupation["name"]
end

def all_contestants_ever(data)
  data.values.flatten
end

def count_contestants_by_hometown(data, hometown)
  # --Alternate Solution--
  # counter = 0
  # all_contestants_ever(data).each do |contestant|
  #   if contestant["hometown"] == hometown
  #     counter += 1
  #   end
  # end
  # counter

  all_contestants_ever(data).reduce(0) do |memo, contestant|
    if contestant["hometown"] == hometown
      memo + 1
    else
      memo
    end
  end
end

def get_occupation(data, hometown)
  contestant_hometown_match = all_contestants_ever(data).find do |contestant|
    contestant["hometown"] == hometown
  end
  contestant_hometown_match["occupation"]
end

def get_average_age_for_season(data, season)
  age_sum = data[season].reduce(0) do |memo, contestant|
    memo + contestant["age"].to_f
  end
  (age_sum / data[season].length).round(0)
end

# ------FIRST ATTEMPT BELOW-------
# def get_first_name_of_season_winner(data, season)
#   data[season].find do |contestant|
#     if contestant["status"] == "Winner" 
#       return contestant["name"].split.first
#     end
#   end
# end

# def get_contestant_name(data, occupation)
#   data.each do |season, contestant|
#     contestant.select do |attributes|
#       if attributes["occupation"] == occupation
#         return attributes["name"]
#       end
#     end
#   end
# end

# def all_season_data(data)
#   #Jack was showing me how to use flatten here
#   #as a helper method to the following methods
#   data.values.flatten
# end

# def count_contestants_by_hometown(data, hometown)
#   contestants_from_hometown = []
#   all_season_data(data).select do |contestant, attributes|
#     if contestant["hometown"] == hometown
#       contestants_from_hometown << contestant
#     end
#   end
#   contestants_from_hometown.size
# end

# def get_occupation(data, hometown)
#   all_season_data(data).find do |contestant|
#     if contestant["hometown"] == hometown
#       return contestant["occupation"]
#     end
#   end
# end

# def get_average_age_for_season(data, season)
#   season_age_sum = 0
  
  
#   data[season].map do |contestants|
#       season_age_sum += (contestants["age"]).to_i
#   end
#  (season_age_sum.to_f / data[season].length).round(0)
# end