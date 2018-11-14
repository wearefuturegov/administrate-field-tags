class Tag
  attr_accessor :id
  attr_accessor :name

  def initialize(options = {})
    @id = options[:id]
    @name = options[:name]
  end

  def self.all
    [
      Tag.new(id: 1, name: 'Tag 1'),
      Tag.new(id: 2, name: 'Tag 2'),
      Tag.new(id: 3, name: 'Tag 3')
    ]
  end
end
