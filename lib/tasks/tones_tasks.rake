namespace :tones do

  desc "Take all translation string from database and search in appication, if any unused string found then remove from database and update tones.csv"
  task :remove_unused_string => :environment do
    unused_string = []
    files = Dir['app/**/helpers/**/*', 'app/**/controllers/**/*', 'app/**/views/**/*', 'app/**/mailers/**/*'].select{|f| File.file?(f)}
    Tones::Tone.all.each do |tone|
      is_found = false
      tone_string = 'to\(:' + tone.name + '\)'
      files.each do |f|
        is_found = open(f).grep(/#{tone_string}/).present?
        break if is_found
      end
    unused_string << tone unless is_found
    end
    if unused_string.present? 
      puts "#{unused_string.size} unused translation strings found in database"
      puts unused_string.map(&:name)
    end
  end

end