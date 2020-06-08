require "./politician.rb"
require "./voter.rb"

class Database
  def initialize
    @voters = []
    @politicians = []
  end

  def create type, name, alignment
    if type == "p"
      @politicians << Politician.new(name, alignment)
    elsif type == "v"
      @voters << Voter.new(name, alignment)
    end
  end

  def read type
    if type == "p"
      @politicians.map do |politician|
        "#{politician.name}, #{politician.party}"
      end
    elsif type == "v"
      @voters.map do |voter|
        "#{voter.name}, #{voter.politics}"
      end
    end
  end

  def update type, name, new_name
    # @politicians  = [Politician.new("mike", "dem"), Politician.new("stacey", "rep"), Politician.new("joe", "dem")]
    # @politicians[1].name => #<Politician:789dsui9y9> name:"stacey" party:"rep"
    if type == "p"
      p_index = @politicians.index { |politician| name == politician.name }
      @politicians[p_index].name = new_name

    elsif type == "v"
      v_index = @voters.index { |voter| name == voter.name }
      @voters[v_index].name = new_name

    end
  end

  def delete type, name
    if type == "p"
      p_index = @politicians.index { |politician| name == politician.name }
      @politicians.delete_at(p_index)
    elsif type == "v"
      v_index = @voters.index { |voter| name == voter.name }
      @voters.delete_at(v_index)
    end
  end

end
