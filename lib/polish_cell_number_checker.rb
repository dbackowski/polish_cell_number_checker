require "polish_cell_number_checker/version"
require 'yaml'

module PolishCellNumber
  class Checker
    private
    def load_data
      @@data ||= YAML.load_file(File.join(File.dirname(__FILE__), '../yaml/operators.yml'))
    end

    def check_number
      @found = @phone_no =~ /[0-9]{9}/ ? @@data.select { |_, pool| pool.find { |e| @phone_no =~ /^#{e}/ } } : []
    end

    public
    def initialize(phone_no)
      @phone_no = phone_no

      @phone_no.gsub!('-', '')
      @phone_no.gsub!(' ', '')
      @phone_no.gsub!('+48', '')

      load_data
      check_number
    end

    def cell_number?
      !@found.empty?
    end

    def operator_name
      @found[0][0] unless @found.empty?
    end
  end
end
