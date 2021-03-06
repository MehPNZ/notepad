require_relative 'link.rb'
require_relative 'memo.rb'
require_relative 'post.rb'
require_relative 'task.rb'

require 'optparse'

options = {}

OptionParser.new do |opt|
  opt.banner = 'Usage: read.rb [options]'
  opt.on('-h', 'Prints this help') do
    puts opt
    exit
  end

  opt.on('--type POST_TYPE', 'какой тип постов показывать ' \
         '(по умолчанию любой)') { |o| options[:type] = o }

  opt.on('--id POST_ID', 'если задан id — показываем подробно ' \
         ' только этот пост') { |o| options[:id] = o }

  opt.on('--limit NUMBER', 'сколько последних постов показать ' \
         '(по умолчанию все)') { |o| options[:limit] = o }

end.parse!

result = Post.find(options[:limit], options[:type], options[:id])

if result.is_a? Post
  puts "Record #{result.class.name}, id = #{options[:id]}"
  result.to_strings.each do |line|
    puts line
  end
else
  print '| id                 '
  print '| @type              '
  print '| @created_at        '
  print '| @text              '
  print '| @url               '
  print '| @due_date          '
  print '|'

  result.each do |row|
    puts

    row.each do |element|
      print"| #{element.to_s.delete("\\n\\r")[0..40]}\t"
    end

  end
end

puts

