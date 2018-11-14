require_relative '../../support/tag'
require_relative '../../support/cool_tag'

RSpec.describe Administrate::Field::Tags do
  let(:page) { :show }
  let(:data) { [1, 2, 3] }
  subject { described_class.new(:tags, data, page) }

  describe '#tags' do
    context 'default' do
      it 'gets a list of tags as json' do
        expect(subject.tags).to eq(
          [
            {
              id: 1,
              name: 'Tag 1'
            },
            {
              id: 2,
              name: 'Tag 2'
            },
            {
              id: 3,
              name: 'Tag 3'
            }
          ].to_json
        )
      end
    end

    context 'with options' do
      let(:options) { { tag_list: -> { CoolTag.everything }, id: :identifier, name: :title } }
      subject { described_class.with_options(tags: options).new(:tags, data, page) }

      it 'gets a list of tags as json' do
        expect(subject.tags).to eq(
          [
            {
              identifier: 1,
              title: 'Cool Tag 1'
            },
            {
              identifier: 2,
              title: 'Cool Tag 2'
            },
            {
              identifier: 3,
              title: 'Cool Tag 3'
            }
          ].to_json
        )
      end
    end
  end
end
