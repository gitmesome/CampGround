desc 'Load Data'
task :load_data => :environment do
  Dir.glob("#{Rails.root}/app/models/*.rb").each { |file| require file }
  csv_file = "#{Rails.root}/db/sample_campground_data.csv"
  return unless File.exists?(csv_file)
  File.open(csv_file, 'r') do |f|
    data = f.read
    data.each_line do |line|
      parts = line.split(',')
      parts[1] = parts[1].delete_prefix('"').delete_suffix('"')
      campground = Campground.find_by(name: parts[0])
      unless campground
        campground = Campground.new(name: parts[0])
        campground.save!
      end
      site = Campsite.new(name: parts[1], campground: campground, price: parts[2].to_f)
      site.save!
    end
  end
  puts "LOADED!!"
end
