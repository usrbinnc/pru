#!/usr/bin/ruby

Dir.glob("*.txt").each do |filename|
  puts "// Generating #{filename}..."

  basename = File.basename(filename, ".*")

  commands = [
    %Q{say -f #{filename} -v Daniel -o #{basename}.aiff >/dev/null},
    %Q{lame -b 192 #{basename}.aiff #{basename}.mp3}
  ]

  commands.each do |command|
    puts "\t--> #{command}"
    system(command)
  end
end
