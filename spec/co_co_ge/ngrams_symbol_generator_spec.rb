require 'spec_helper'

describe CoCoGe::NgramsSymbolGenerator do
  let :corpus do
    <<~end
      In the beginning God created the Heaven, and the Earth.
    end
  end

  let :generator do
    described_class.new(
      corpus: corpus,
      length: 3,
      filter: -> w { w.size > 3 },
      post_process: -> w { w.upcase.delete '^A-Z' }
    )
  end

  it 'can compute symbols' do
    expect(generator.compute.sort).to eq\
      %w[RTH EGI GIN INN NNI NIN ING CRE REA EAT ATE TED HEA EAV AVE VEN EAR
         ART BEG].sort
  end
end
