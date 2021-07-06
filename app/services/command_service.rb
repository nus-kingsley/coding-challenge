class CommandService
  def initialize(commands)
    @commands = commands.split("\n")
  end

  def call
    validate_command_service = ValidateCommandService.new

    raise CommandInvalidError unless validate_command_service.valid_command?(@commands)

    raise CommandInvalidError unless validate_command_service.valid_place_command?(extract_place_command(@commands.first))

    @robot = Robot.new({x: @place_command[0].to_i, y: @place_command[1].to_i, face: @place_command[2]})

    @commands.drop(1).each do |command|
      if command.include? "PLACE"
        raise CommandInvalidError unless validate_command_service.valid_place_command?(extract_place_command(command))

        @robot = Robot.new({x: @place_command[0].to_i, y: @place_command[1].to_i, face: @place_command[2]})
      else
        @robot.send(command.downcase)
      end
    end

    @robot.report
  end

  private

  def extract_place_command(command)
    @place_command = command.split('PLACE ').last.split(', ')
  end
end

class CommandInvalidError < StandardError
  def message
    "Command is not valid"
  end
end