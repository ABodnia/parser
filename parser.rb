class Parser
  FILE_NAME_REGEXP = /[a-zA-Z]\d+_([Aa]ccount|[Aa]ctivity|[Pp]osition|[Ss]ecurity)_\d{8}.txt/

  def initialize(folder_path)
    @folder_path = folder_path
  end

  def parse_and_print
    parse
    print
  end

  def parse
    @parse_data = Hash.new { |h1, k1| h1[k1] = Hash.new { |h2, k2| h2[k2] = [] } }
    entries = Dir.entries(@folder_path).sort
    entries.each do |item|
      if item =~ FILE_NAME_REGEXP
        id, type, date = item.split('_')
        date.sub!(/.txt/, '')

        @parse_data[id.to_sym][date.to_sym] << type
      end
    end
    @parse_data
  end

  private
  def print
    raise StandardError.new('You should parse before printing') unless @parse_data
    @parse_data.each do |k, v|
      puts k
      v.each do |k1, v1|
        puts "  #{k1}"
        v1.each { |e| puts "    #{e}" }
      end
    end
  end
end

