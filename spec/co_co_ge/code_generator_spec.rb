require 'spec_helper'

describe CoCoGe::CodeGenerator do
  before do
    allow(generator).to receive(:generate_bytes).and_return 'abdef'.bytes
  end

  let :symbols do
    0..9
  end

  let :generator do
    described_class.new symbols: symbols, length: 5
  end

  context 'with bits as argument' do
    let :generator do
      described_class.new symbols: (0..9), bits: 40
    end

    it 'has correct bits' do
      expect(generator.length).to eq 12
    end

    it 'has correct length' do
      expect(generator.bits).to eq 40
    end

    it 'has correct capacity' do
      expect(generator.capacity).to eq 10 ** 12
    end
  end

  context 'multicharacter symbols' do
    let :symbols do
      %w[ FOO BAR BAZ ]
    end

    describe 'bits and length' do
      it 'can compute the bits that can be expressed' do
        expect(generator.bits).to eq 7
      end

      it 'has the correct length' do
        expect(generator.length).to eq 5
      end

      it 'has correct capacity' do
        expect(generator.capacity).to eq 3 ** 5
      end
    end

    context 'with separator' do
      let :generator do
        described_class.new(symbols: symbols, separator: ?-, length: 5)
      end

      it 'can generate' do
        expect(generator.generate).to eq 'BAR-BAZ-BAR-BAZ-FOO'
      end

      it 'can parse' do
        expect(generator.parse('BAR-BAZ-BAR-BAZ-FOO')).to eq [ 1, 2, 1, 2, 0 ]
      end
    end

    context 'without separator' do
      let :generator do
        described_class.new(symbols: symbols, separator: nil, length: 5)
      end

      it 'can generate without separator' do
        expect(generator.generate).to eq 'BARBAZBARBAZFOO'
      end

      it 'can parse' do
        expect(generator.parse('BARBAZBARBAZFOO')).to eq [ 1, 2, 1, 2, 0 ]
      end
    end
  end

  context 'singlecharacter symbols' do
    let :symbols do
      ?A..?Z
    end

    describe 'bits and length' do
      it 'can compute the bits that can be expressed' do
        expect(generator.bits).to eq 23
      end

      it 'has the correct length' do
        expect(generator.length).to eq 5
      end

      it 'has correct capacity' do
        expect(generator.capacity).to eq 26 ** 5
      end

      it 'can compute duration' do
        expect(
          generator.duration(count: 1_000, attempts_per_second: 26).to_s
        ).to eq '00:07:36'
      end
    end

    context 'singlecharacter symbols with separator' do
      let :generator do
        described_class.new(symbols: symbols, separator: ?-, length: 5)
      end

      it 'can generate' do
        expect(generator.generate).to eq 'T-U-W-X-Y'
      end

      it 'can parse' do
        expect(generator.parse('T-U-W-X-Y')).to eq [ 19, 20, 22, 23, 24 ]
      end
    end

    context 'singlecharacter symbols with separator and parts_per_word' do
      let :generator do
        described_class.new(symbols: symbols, separator: ?-, parts_per_word: 2, length: 5)
      end

      it 'can generate' do
        expect(generator.generate).to eq 'TU-WX-Y'
      end

      it 'can parse' do
        expect(generator.parse('TU-WX-Y')).to eq [ 19, 20, 22, 23, 24 ]
      end
    end

    context 'singlecharacter symbols without separator' do
      let :generator do
        described_class.new(symbols: symbols, separator: nil, length: 5)
      end

      it 'can generate without separator' do
        expect(generator.generate).to eq 'TUWXY'
      end

      it 'can parse' do
        expect(generator.parse('TUWXY')).to eq [ 19, 20, 22, 23, 24 ]
      end
    end
  end
end
