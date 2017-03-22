var Button, add, bg, btnGroup, button, buttons, decimal, device, divide, eight, equals, expression, five, four, i, j, k, l, m, multiply, n, nine, one, row1, row2, row3, row4, seven, six, sub, three, two, zero,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

bg = new BackgroundLayer({
  style: {
    width: '100vw',
    height: '100vh'
  }
});

device = new Layer({
  width: 320,
  height: 480,
  backgroundColor: "#3B4755",
  x: Align.center,
  y: Align.center
});

btnGroup = new Layer({
  parent: device,
  width: device.width,
  height: device.width,
  y: Align.bottom,
  backgroundColor: null
});

Button = (function(superClass) {
  extend(Button, superClass);

  function Button(options) {
    Button.__super__.constructor.call(this, _.defaults(options, {
      parent: btnGroup,
      width: device.width / 4,
      height: device.width / 4,
      style: {
        color: 'rgba(255, 255, 255, 0.8)',
        border: 'solid 2px #3B4755',
        textAlign: 'center',
        fontFamily: 'Roboto Mono',
        paddingTop: '24px'
      }
    }));
    this.deactivate();
    this.onTapStart(function() {
      return this.activate();
    });
    this.onTapEnd(function() {
      return this.deactivate();
    });
  }

  Button.prototype.activate = function() {
    return this.backgroundColor = '#465566';
  };

  Button.prototype.deactivate = function() {
    return this.backgroundColor = '#384452';
  };

  return Button;

})(Layer);

row1 = [];

row2 = [];

row3 = [];

row4 = [];

buttons = [row1, row2, row3, row4];

for (j = k = 0; k <= 3; j = ++k) {
  for (i = l = 0; l <= 3; i = ++l) {
    button = new Button({
      x: i * 80,
      y: j * 80
    });
    buttons[j].push(button);
  }
}

expression = '9 + 12.1';

multiply = buttons[0][0];

multiply.html = '×';

multiply.color = '#F2C94C';

divide = buttons[1][0];

divide.html = '÷';

divide.color = '#BB6BD9';

add = buttons[2][0];

add.html = '+';

add.color = '#56CCF2';

sub = buttons[3][0];

sub.html = '-';

sub.color = '#F2994A';

equals = buttons[3][3];

equals.html = '=';

equals.color = '#27AE60';

decimal = buttons[3][1];

decimal.html = '.';

zero = buttons[3][2];

zero.html = '0';

for (j = m = 0; m <= 2; j = ++m) {
  for (i = n = 1; n <= 3; i = ++n) {
    buttons[j][i].html = 3 * (2 - j) + i;
  }
}

one = buttons[2][1];

two = buttons[2][2];

three = buttons[2][3];

four = buttons[1][1];

five = buttons[1][2];

six = buttons[1][3];

seven = buttons[0][1];

eight = buttons[0][2];

nine = buttons[0][3];
