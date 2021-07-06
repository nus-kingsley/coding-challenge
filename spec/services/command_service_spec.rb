
require 'rails_helper'

RSpec.describe 'CommandService' do
  it 'has correct position' do
    commands = [
      "PLACE 0, 0, NORTH",
      "MOVE"
    ].join("\n")
    result = CommandService.new(commands).call
    expect(result.values).to eq([0, 1, "NORTH"])
  end

  it 'has correct position' do
    commands = [
      "PLACE 0, 0, NORTH",
      "LEFT"
    ].join("\n")
    result = CommandService.new(commands).call
    expect(result.values).to eq([0,0,"WEST"])
  end

  it 'has correct position' do
    commands = [
      "PLACE 0, 0, SOUTH",
      "MOVE"
    ].join("\n")
    result = CommandService.new(commands).call
    expect(result.values).to eq([0,0,"SOUTH"])
  end

  it 'has correct position' do
    commands = [
      "PLACE 1, 2, EAST",
      "MOVE",
      "MOVE",
      "LEFT",
      "MOVE"
    ].join("\n")
    result = CommandService.new(commands).call
    expect(result.values).to eq([3,3,"NORTH"])
  end

  it 'has error' do
    commands = [
      "LEFT",
      "PLACE 0, 0, NORTH",
      "MOVE"
    ].join("\n")

    expect {
      result = CommandService.new(commands).call
    }.to raise_error CommandInvalidError
  end

  it 'has correct position' do
    commands = [
      "PLACE 1, 2, EAST",
      "PLACE 5, 100, NORTH",
      "MOVE"
    ].join("\n")

    expect {
      result = CommandService.new(commands).call
    }.to raise_error CommandInvalidError
  end
end