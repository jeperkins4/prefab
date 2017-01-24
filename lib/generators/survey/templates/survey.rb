class <%= file_name.camelize %>
  include AskAwesomely::DSL

  title "blah, blah"

  field :statement do
    say ->(user) { "Hello, #{user.name}!" }
  end

  field :multiple_choice do
    ask "What is your favourite language?"
    choice "Ruby"
    choice "Python"
    choice "Javascript"
    choice "COBOL"

    can_specify_other
  end

end
