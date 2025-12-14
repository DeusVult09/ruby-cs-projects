require './lib/knight'

describe Knight do
  describe "#legal_moves" do
    it "returns legal moves" do 
      knight = Knight.new
      expect(knight.legal_moves([2,1])).to match_array([[4,2], [4,0], [0,2], [0,0],
  [3,3], [1,3]])
    end
  end
  describe "#knight_moves" do
    it "returns correct start and end positions" do
      knight = Knight.new
      path = knight.knight_moves([2,1],[3,2])
      expect(path.first).to eq([2,1])
      expect(path.last).to eq([3,2])
    end
    it "returns correct number of moves" do
      knight = Knight.new
      path = knight.knight_moves([2,1],[3,2])
      expect(path.length - 1).to eq(2)
    end
  end
end