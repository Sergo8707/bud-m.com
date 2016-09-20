# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: '_billionaire_session'

# Молодец! Нашел :)
#

# Вот такие изменения можно сделать

# game.rb
#
# def use_help(help_type)
#   help_types = %i(fifty_fifty audience_help friend_call)
#   help_type = help_type.to_sym
#   raise ArgumentError.new('wrong help_type') unless help_types.include?(help_type)
#
#   unless self["#{help_type}_used"]
#     self["#{help_type}_used"] = true
#     current_game_question.apply_help!(help_type)
#     save
#   end
#    # false не нужен — unless вернёт nil, если не будет исполнен
# end

#
# game_question.rb
#
# def apply_help!(help_type)
#   case help_type.to_s
#   when :fifty_fifty
#     add_fifty_fifty
#   when :audience_help
#     add_audience_help
#   when :friend_call
#     add_friend_call
#   end
# end
#
# PS: последний метод можно еще сократить! :)
#