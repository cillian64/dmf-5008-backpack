import time
from board import pins
from sed1335 import Sed1335

lcd = Sed1335(
    cs=pins['cs'],
    a0=pins['a0'],
    wr=pins['wr'],
    rd=pins['rd'],
    reset=pins['reset'],
    data=[
        pins['d0'],
        pins['d1'],
        pins['d2'],
        pins['d3'],
        pins['d4'],
        pins['d5'],
        pins['d6'],
        pins['d7'],
    ]
)

# lcd.puts("Hello, world!")
i = 0

time.sleep(5)

while True:
    #pins['led'].toggle()
    time.sleep(0.5)

    lcd.puts("LOOK AROUND YOU")
