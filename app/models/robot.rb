class Robot
  include ActiveModel::Model

  attr_accessor :x, :y, :face

  def left
    face_index = Board::FACES.index(face)
    if face_index == 3
      self.face = Board::FACES[0]
    else
      self.face = Board::FACES[face_index + 1]
    end
  end

  def right
    face_index = Board::FACES.index(face)
    if face_index == 0
      self.face = Board::FACES[3]
    else
      self.face = Board::FACES[face_index - 1]
    end
  end

  def move
    case face
    when "SOUTH"
      self.y -= 1 if y > 0
    when "NORTH"
      self.y += 1 if y < Board::HEIGHT - 1
    when "WEST"
      self.x -= 1 if x > 0
    when "EAST"
      self.x += 1 if x < Board::WIDTH - 1
    end
  end

  def report
    {
      x: x,
      y: y,
      f: face
    }
  end
end
