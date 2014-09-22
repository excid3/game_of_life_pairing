class Cell
  attr_accessor :alive, :neighbors

  def initialize(orig_alive)
    @alive = orig_alive
  end

  def tick!
    @alive = (alive && neighbors == 2) || neighbors == 3
  end

  def alive?
    alive
  end
end

describe Cell do

  context "when dead" do
    let(:cell) { Cell.new(false) }
    it "is remain dead if it has two neighbors" do
      cell.neighbors = 2
      cell.tick!
      cell.should_not be_alive
    end

    it "comes to life if it has exactly three neighbors" do
      cell.neighbors = 3
      cell.tick!
      cell.should be_alive
    end

    it "stays dead if has more than three neighbors" do
      cell.neighbors = 8
      cell.tick!
      cell.should_not be_alive
    end
  end

  context "when alive" do
    let(:cell) { Cell.new(true) }
    it "lives on if it has two neighbors" do
      cell.neighbors = 2
      cell.tick!
      cell.should be_alive
    end

    it "lives on if it has three neighbors" do
      cell.neighbors = 3
      cell.tick!
      cell.should be_alive
    end

    it "dies if it has less than two neighbors" do
      cell.neighbors = 1
      cell.tick!
      cell.should_not be_alive
    end


    it "dies if has more than three neighbors" do
      cell.neighbors = 8
      cell.tick!
      cell.should_not be_alive
    end
  end

end
