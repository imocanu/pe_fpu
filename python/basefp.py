# Rounding

ROUND_UP        = 'ROUND_UP'        # up = always away from 0
ROUND_DOWN      = 'ROUND_DOWN'      # down = always towards 0 (truncate)
ROUND_CEILING   = 'ROUND_CEILING'   # ceiling = always towards +inf
ROUND_FLOOR     = 'ROUND_FLOOR'     # floor = always towards -inf
ROUND_HALF_UP   = 'ROUND_HALF_UP'   # half up = to nearest, 0.1b (0.5d) rounds away from 0 (standard and default)
ROUND_HALF_DOWN = 'ROUND_HALF_DOWN' # half down = to nearest, 0.1 (0.5d) rounds towards 0

roundings = {ROUND_UP: 'U', 
            ROUND_DOWN: 'D', 
            ROUND_CEILING: 'C',
            ROUND_FLOOR: 'F', 
            ROUND_HALF_UP: 'HU', 
            ROUND_HALF_DOWN: 'HD'}

class context:
    def __init__(self):
        self.context = {}

    def __call__(self, exp, sig, rounding):
        return self.create(self, exp, sig, rounding)
    
    def create(self, exp, sig, rounding):
        if rounding not in roundings:
            raise ValueError("Invalid value")
        
