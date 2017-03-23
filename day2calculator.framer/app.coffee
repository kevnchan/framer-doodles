# layer setup
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

# clear button 
clear = new Layer
	parent: display
	html: "CLEAR"
	x: 10
	y: 2
	width: 40
	height: 20
	backgroundColor: null
	style:
		fontSize: "12px"
		color: "#C15E56"
clear.onClick ->
	input.html = '0'
	calculated.html = null

# button class
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
funcBtn = (btn) ->
	lastInput = input.html.slice(input.html.length - 1)
	if lastInput != '×' and lastInput != '÷' and lastInput != '+' and lastInput != '=' and lastInput != '.'
		input.html += btn.html

multiply = buttons[0][0]
multiply.html = '×'
multiply.color = '#F2C94C'
multiply.onClick ->
	funcBtn(@)

divide = buttons[1][0]
divide.html = '÷'
divide.color = '#BB6BD9'
divide.onClick ->
	funcBtn(@)

add = buttons[2][0]
add.html = '+'
add.color = '#56CCF2'
add.onClick ->
	funcBtn(@)

sub = buttons[3][0]
sub.html = '-'
sub.color = '#F2994A'
sub.onClick ->
	funcBtn(@)

equals = buttons[3][3]
equals.html = '='
equals.color = '#27AE60'
equals.onClick ->
	input.html = calculated.html
	calculated.html = ''

# number buttons
calculate = ->
	replaced = input.html.replace /×/, "*"
	replaced = replaced.replace /÷/, "/"
	calculated.html = eval(replaced)
	
decimal = buttons[3][1]
decimal.html = '.'
decimal.onClick ->
	funcBtn(@)

zero = buttons[3][2]
zero.html = '0'
zero.onClick ->
	if input.html == '0'
		input.html = @html
	else
		input.html += @html
	calculate()

for j in [0..2]
	for i in [1..3]
		buttons[j][i].html = 3 * (2 - j) + i
		buttons[j][i].onClick ->
			# note if input.html = '0' always returns true
			if input.html == '0'
				input.html = @html
			else
				input.html += @html
			calculate()
