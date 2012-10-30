require 'rubygems'
require 'nokogiri'
require 'yaml'

# http://www.uke.gov.pl/tablice/home.do?execution=e1s1 download xml file

data = {}
doc = Nokogiri::XML.parse(File.read(ARGV[0]))

doc.xpath('//numery/plmn').each do |node|
  number = node.xpath('numer').inner_text
  operator = node.xpath('operator').inner_text

  m = number.match /([0-9]+)\(([0-9,-]+)\)/
  numbers = []

  data[operator] = [] unless data.has_key?(operator)

  if m
    number = m[1]
    m[2].split(',').each do |i|
      range = i.split('-')

      if range.length > 1
        Range.new(range[0].to_i,range[1].to_i == 0 ? 10 : range[1].to_i).each do |i|
          numbers.push "#{number}#{i == 10 ? 0 : i}"
        end
      else
        numbers.push "#{number}#{i}"
      end
    end

    data[operator].push numbers
    data[operator].flatten!(1)
  else
    data[operator].push number
  end
end

File.open("yaml/operators.yml", "w") do |file|
  file.write data.to_yaml
end
