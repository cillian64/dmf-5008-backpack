from machine import Pin

pins = {
    'cs': Pin(0, Pin.OUT),
    'a0': Pin(1, Pin.OUT),
    'wr': Pin(2, Pin.OUT),
    'rd': Pin(3, Pin.OUT),
    'd0': Pin(4, Pin.OUT),
    'd1': Pin(5, Pin.OUT),
    'd2': Pin(6, Pin.OUT),
    'd3': Pin(7, Pin.OUT),
    'd4': Pin(8, Pin.OUT),
    'd5': Pin(9, Pin.OUT),
    'd6': Pin(10, Pin.OUT),
    'd7': Pin(11, Pin.OUT),
    'reset': Pin(12, Pin.OUT),
    'led': Pin("LED", Pin.OUT),
}
