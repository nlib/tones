module Tones
  class Tone < ActiveRecord::Base

    validates :name, :uniqueness => true
    validates :name, :presence => true

    def self.content(name, params=[])
      content = cache_content(name)
      content = content.present? ? content : name.to_s.humanize
      add_params(content, params)
    end

    def self.cache_content(name)
      Rails.cache.fetch(name.to_s + "_" + I18n.locale.to_s) {
          get_content(name)
        }
    end

    def self.get_content(name)
      return unless content = find_by(name: name)
      case I18n.locale.to_s
      when "de"
        content = content.de_short.present? ? content.de_short : content.de_body
      else
        content = content.short.present? ? content.short : content.body
      end
    end

    def self.clear_cache_content(locale)
      Tone.all.each do |content|
        Rails.cache.delete(content.name.to_s + "_" + locale.to_s)
      end
    end

    def self.add_params(content, params)
      i = 1
      params.each do |p|
        content = content.gsub("%#{i}", p)
        i += 1
      end
      content
    end

    require 'csv'

    def self.write_tones
      CSV.open(File.join(Rails.root, '/public/tones.csv'), 'w') do |writer|
        writer << ["name", "description", "short", "body", "de_short", "de_body"]
        Tone.order("name ASC").each do |c|
          writer << [c.name, c.description, c.short, c.body, c.de_short, c.de_body]
        end
      end
    end

    def self.read_tones
      csv_text = File.open(File.join(Rails.root, '/public/tones.csv'))
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        content = row.to_hash
        Tone.find_or_create_by(name: content["name"]).update_attributes(content)
        if content["description"] == "delete"
          tone = Tone.find_by(name: content["name"])
          tone.destroy if tone.present?
        end
      end
      Rails.cache.clear
    end

  end
end
