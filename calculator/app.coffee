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

display = new Layer
    parent: device
    width: device.width
    height: device.height - device.width
    backgroundColor: null

input = new Layer
    parent: display
    width: device.width - 18
    height: 60
    y: 60
    backgroundColor: null
    color: 'white'
    opacity: .9
    style:
        fontFamily: "Roboto Mono"
        fontWeight: '300'
        textAlign: 'right'
        fontSize: '56px'
    html: '0'

calculated = new Layer
    parent: display
    width: input.width - 4
    height: 60
    y: Align.bottom
    backgroundColor: null
    color: 'white'
    opacity: .6
    style:
        paddingTop: '8px'
        fontFamily: "Roboto Mono"
        fontWeight: '400'
        textAlign: 'right'
        fontSize: '18px'
    html: null


class Button extends Layer
    constructor: (options) ->
        super _.defaults options,
            parent: btnGroup
            width: device.width / 4
            height: device.width / 4
            color: 'rgba(255, 255, 255, .8)'
            style:
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
        @animate
            backgroundColor: '#465566'
            options:
                time: .2

    deactivate: ->
        @animate
            backgroundColor: '#384452'
            options:
                time: .2

# initialize 2d array of buttons
buttons = []

for j in [0..3]
    row = []
    buttons.push(row)
    for i in [0..3]
        button = new Button
            x: i * 80
            y: j * 80
        row.push(button)

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
        buttons[j][i].onClick ->
            # note if input.html = '0' always returns true
            if input.html == '0'
                input.html = @html
            else
                input.html += @html

            calculated.html = eval(input.html)

one = buttons[2][1]

two = buttons[2][2]

three = buttons[2][3]

four = buttons[1][1]

five = buttons[1][2]

six = buttons[1][3]

seven = buttons[0][1]

eight = buttons[0][2]

nine = buttons[0][3]

# can use the eval() function to turn string into numba
