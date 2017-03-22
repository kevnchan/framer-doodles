bg = new BackgroundLayer
  style :
    width: '100vw'
    height: '100vh'

device = new Layer
  width: 320
  height: 480
  backgroundColor: "#3B4755"
  x: Align.center
  y: Align.center

btnGroup = new Layer
  parent: device
  width: device.width
  height: device.width
  y: Align.bottom
  backgroundColor: null

class Button extends Layer
  constructor: (options) ->
    super _.defaults options,
      parent: btnGroup
      width: device.width / 4
      height: device.width / 4
      style:
        color: 'rgba(255, 255, 255, 0.8)'
        border: 'solid 2px #3B4755'
        textAlign: 'center'
        fontFamily: 'Roboto Mono'
        paddingTop: '24px'

    @deactivate()

    @onTapStart ->
      @activate()

    @onTapEnd ->
      @deactivate()

  activate: ->
    @backgroundColor = '#465566'

  deactivate: ->
    @backgroundColor = '#384452'

row1 = []
row2 = []
row3 = []
row4 = []
buttons = [row1, row2, row3, row4]

for j in [0..3]
  for i in [0..3]
    button = new Button
      x: i * 80
      y: j * 80
    buttons[j].push(button)

expression = '9 + 12.1'

# function buttons
multiply = buttons[0][0]
multiply.html = '×'
multiply.color = '#F2C94C'

divide = buttons[1][0]
divide.html = '÷'
divide.color = '#BB6BD9'

add = buttons[2][0]
add.html = '+'
add.color = '#56CCF2'

sub = buttons[3][0]
sub.html = '-'
sub.color = '#F2994A'

equals = buttons[3][3]
equals.html = '='
equals.color = '#27AE60'

# number buttons
decimal = buttons[3][1]
decimal.html = '.'

zero = buttons[3][2]
zero.html = '0'

for j in [0..2]
  for i in [1..3]
    buttons[j][i].html = 3 * (2 - j) + i

one = buttons[2][1]

two = buttons[2][2]

three = buttons[2][3]

four = buttons[1][1]

five = buttons[1][2]

six = buttons[1][3]

seven = buttons[0][1]

eight = buttons[0][2]

nine = buttons[0][3]
