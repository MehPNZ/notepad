require_relative 'post.rb'

class Link < Post

  def initialize
    super
    @url = ''
  end

  def read_from_console
    puts "адрес ссылки:"
    @url =STDIN.gets.chomp

    puts "что за ссылка?"
    @text = STDIN.gets.chomp
  end

  def to_strings
    time_string = "создано: #{@create_at.strftime("%Y.%m.%d, %H:%M:%S")} \n\r \n\r"

    return  [@url, @text, time_string]
  end
end