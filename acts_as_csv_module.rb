module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
=begin
    def method_missing name, *args
      column_number = @headers.find_index(name.to_s)
      @csv_contents.map {|row| row[column_number]}
    end
=end

    def each
      return enum_for(:each) unless block_given?
      @csv_contents.each do |row|
        mapped_row = Hash.new
        @headers.each_with_index do |heading, index|
          mapped_row[heading] = row[index]
        end
        yield CsvRow.new mapped_row
      end 
    end

    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    attr_accessor :headers, :csv_contents
    def initialize
      read
    end
  end 

  class CsvRow
    def initialize(hash)
      @row_hash = hash 
    end

    def method_missing name, *args
      @row_hash[name.to_s]
    end
  end
end

class RubyCsv # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
#puts m.headers.inspect
#puts m.csv_contents.inspect

m.each do |thing|
  puts "***"
  puts "Profit\t#{thing.profit},\nloss\t#{thing.loss},\nmachine\t#{thing.machine}."
end

my_enum = m.each
puts "First profit is #{my_enum.first.profit}."
