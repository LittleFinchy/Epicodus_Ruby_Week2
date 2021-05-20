class Letter
  attr_accessor :char, :is_found

  def initialize(char)
    @char = char
    @is_found = false
  end

  def check_letter(other_char)
    return unless char == other_char
    self.is_found = true
  end
end
