class CoolTag
  attr_accessor :identifier
  attr_accessor :title

  def initialize(options = {})
    @identifier = options[:id]
    @title = options[:name]
  end

  def self.everything
    [
      CoolTag.new(id: 1, name: 'Cool Tag 1'),
      CoolTag.new(id: 2, name: 'Cool Tag 2'),
      CoolTag.new(id: 3, name: 'Cool Tag 3')
    ]
  end
end
