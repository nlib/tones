namespace :tones do

  desc "Read tones from tones.csv"
  task :read => :environment do
    puts ""
    puts "Reading tones.csv"
    Tones::Tone.read_tones
  end

  desc "Write tones from database to tones.csv"
  task :write => :environment do
    puts ""
    puts "Writing tones.csv"
    Tones::Tone.write_tones
  end

  desc "Take all translation-strings from database and search in application, if any unused string is found then remove it from database and update tones.csv"
  task :delete_unused => :environment do
    puts ""
    puts "Reading tones.csv"
    Tones::Tone.read_tones

    puts "Searching for unused strings..."
    puts ""
    unused_strings = []
    files = Dir['app/**/helpers/**/*', 'app/**/controllers/**/*', 'app/**/models/**/*', 'app/**/views/**/*', 'app/**/mailers/**/*'].select{|f| File.file?(f)}
    Tones::Tone.all.each do |tone|
      is_found = false
      # Find all variations of how string is called
      tone_strings = []
      tone_strings << 'to\(:' + tone.name
      tone_strings << 'to\(\"' + tone.name
      tone_strings << 'to\(\'' + tone.name
      tone_strings << 'Tones::Tone.content\(:' + tone.name
      tone_strings << 'Tones::Tone.content\(\"' + tone.name
      tone_strings << 'Tones::Tone.content\(\'' + tone.name
      files.each do |f|
        tone_strings.each do |tnst|
          is_found = open(f).grep(/#{tnst}/).present?
          break if is_found
        end
        break if is_found
      end
      unless is_found
        puts tone.name
        unused_strings << tone
      end
    end

    if unused_strings.present?
      puts ""
      puts "#{unused_strings.size} unused translation #{'string'.pluralize(unused_strings.size)} found in database."
      puts "Deleting from database and writing tones.csv"
      Tones::Tone.where(id: unused_strings.map(&:id)).delete_all
      Tones::Tone.write_tones
      puts "Done!"
    else
      puts "All translation strings are used in the application"
    end

  end

end
