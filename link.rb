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

  def to_db_hash
    return super.merge(
      {
        'text' => @text,
        'url' => @url
      }
    )
  end

  def load_data(data_hash)
    super(data_hash)
    @url = data_hash['url']
  end

end