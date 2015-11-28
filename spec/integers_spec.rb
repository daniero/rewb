require 'rewb'

describe Integer do
  it "is enumerable!" do
    a=*4
    expect(a).to eq [0, 1, 2, 3]

    expect(5.map { |i| i*10 }).to eql [0, 10, 20, 30, 40]

    expect(3.cycle.take(10)).to eql [0, 1, 2, 0, 1, 2, 0, 1, 2, 0]

    expect(5 % 2).to eql 1
    expect(5.map % 2).to eql [0, 2, 4]
  end
end
