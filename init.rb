# Ruby... cause wth
puts "Creating dotfiles..."

class Dotfile
  def initialize(file_name, source_command, path = "") 
    # Not sure about this whole Dir.pwd business...
    @file_name = "#{Dir.pwd}/../#{path}#{file_name}"
    @content = "#{source_command} ~/dotfiles/#{file_name}"
    @file_handler = File.new(@file_name, "w")
  end

  def write_to_file
    @file_handler.puts(@content)
    @file_handler.close
  end

  def feedback
    puts "Created file #{@file_name} containing"
    puts @content
  end
end

files = [
  Dotfile.new(".zshrc", "source"),
  Dotfile.new(".tmux.conf", "source-file"),
  Dotfile.new("init.vim", "so", ".config/nvim/"),
  Dotfile.new(".zshenv", "source")
]

for file in files
  file.write_to_file
  file.feedback
end
