require 'spec_helper'

describe CoCoGe::WordsSymbolGenerator do
  let :corpus do
    <<~end
      In the beginning God created the Heaven, and the Earth.
    end
  end

  let :generator do
    described_class.new(
      corpus: corpus,
      filter: -> w { w.size > 3 },
      post_process: -> w { w.upcase.delete '^A-Z' }
    )
  end

  it 'can compute symbols' do
    expect(generator.compute.sort).to eq %w[BEGINNING CREATED HEAVEN EARTH].sort
  end
end
