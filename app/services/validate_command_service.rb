class ValidateCommandService
  def valid_command?(commands)
    return true if commands.present? && commands.first.include?("PLACE")

    false
  end

  def valid_place_command?(commands)
    x = commands.first.to_i
    y = commands.second.to_i
    f = commands.last

    if x >= 0 && y >= 0 && x < Board::WIDTH && y < Board::HEIGHT && Board::FACES.include?(f)
      return true
    end

    false
  end
end