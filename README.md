# README

TECH STACK
-------------------------
- Ruby on Rails
- Slim
- Bootstrap
- Jquery
- Heroku

GUIDES
-------------------------

### How to launch project
- Install Ruby, follow specific version at `.ruby-version`

- `bundle`

- Install Node, follow specific version at `.nvmrc`

- `yarn install`

- `rails s`

### How to run test cases

- Run Command: `rspec spec/services/command_service_spec.rb`

### Test site
- Heroku: https://robot-simulator-challenge.herokuapp.com/

IMPLEMENTATION NOTE
-------------------------

- `REPORT` command is appended at the end of commands automatically so no need to add it
- The commands input field accept a list of command inputs, seperate by new line, for example:
```
PLACE 0,0,NORTH
LEFT
RIGHT
MOVE
```
- Click `Run` to execute the commands
- The returned response will be an error message if input commands are invalid