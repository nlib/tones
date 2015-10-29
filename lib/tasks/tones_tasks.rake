namespace :tones do

  desc "Take all translation-strings from database and search in application, if any unused string is found then remove it from database and update tones.csv"
  task :delete_unused => :environment do
    unused_string = []
    files = Dir['app/**/helpers/**/*', 'app/**/controllers/**/*', 'app/**/models/**/*', 'app/**/views/**/*', 'app/**/mailers/**/*'].select{|f| File.file?(f)}
    Tones::Tone.all.each do |tone|
      is_found = false
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
    unused_string << tone unless is_found
    end
    if unused_string.present? 
      puts "#{unused_string.size} unused translation #{'string'.pluralize(unused_string.size)} found in database \n\n"
      puts unused_string.map(&:name)
      Tones::Tone.where(id: unused_string.map(&:id)).delete_all
      Tones::Tone.write_tones
      puts "\n\n #{unused_string.size} unused translation #{'string'.pluralize(unused_string.size)} successfully removed from database"
    else
      puts "All translation strings are used in the application"
    end
  end

end
