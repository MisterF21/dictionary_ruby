require './lib/dictionary.rb'

def main_menu
  print "Main Menu"
  print ">"
  main_choice = gets.chomp
  if main_choice == 'w'
    system "clear"
    add_word
  elsif main_choice == 'e'
    system "clear"
    edit_word
  elsif main_choice == 'n'
    system "clear"
    new_entry
  elsif main_choice == 'l'
    Term.all_terms.each do |term|
      puts term.word_array.join(", ") + ": " + term.definition_array.join(", ")
    end
  elsif main_choice == 'f'
    system "clear"
    add_definition
  elsif main_choice =='g'
    system "clear"
    edit_definition
  elsif main_choice == 'y'
    system "clear"
    delete_definition
  elsif main_choice == 'd'
    system "clear"
    delete_word
  elsif main_choice == 'v'
    system "clear"
    view_entry
  elsif main_choice == 'h'
    system "clear"
    help
  elsif main_choice =='x'
    system "clear"
    exit
  else
    system "clear"
    main_menu
  end
end

def help
  puts "Welcome to Alex and Marty's dictionary!"
  puts "Please press e to edit a word."
  puts "Please press n to enter a new entry."
  puts "Please press x to exit the dictionary."
  puts "Please press l to list all of the words in the dictionary."
  puts "Please press h to display all commands again."
end

def new_entry
  puts "Please enter a new word for your dictionary."
  print ">"
  new_word = gets.chomp
  puts "Please enter a definition for #{new_word}."
  print ">"
  new_def = gets.chomp
  Term.new(new_word, new_def)
  puts "Term #{new_word} added with the definition #{new_def}."
end

def view_entry
  puts "Please choose which entry you would like to edit."
  help
  Term.all_terms.each_with_index do |term, index|
    puts (index + 1).to_s + ": " + term.word
  end

  edit_choice = gets.chomp.to_i

  Term.all_terms.each_with_index do |term, index|
    if index + 1 == edit_choice
      edit_menu(term)
    end
  end
end

def edit_menu(entry)
  puts "Please press a to add a new word to this entry."
  puts "Please press f to add a definition to this entry."
  puts "Please press e to edit one of this entry's words."
  puts "Please press h to edit one of this entry's definitions."
  puts "Please press y to delete one of this entry's words."
  puts "Please press d to delete one of this entry's definitions."
  puts "Please press x to return to the main menu."

  choice = gets.chomp
  case choice
  when 'a'
    puts "Please enter a word to add:"
    print ">"
    entry.add_words(gets.chomp)
  when 'f'
    puts "Please enter a definition to add:"
    print ">"
    entry.add_definition(gets.chomp)
  when 'x'
    main_menu
  end
end

help

loop do
  main_menu
end
