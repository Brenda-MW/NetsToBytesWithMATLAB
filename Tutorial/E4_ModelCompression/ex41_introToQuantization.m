clear; 
% introduction to data representation and values
var1 = magic(3) 
% quantize to integers
int_var1 = int8(var1)

% does not quite work for non-integer values
var2 = randn(3) 
int_var2 = int8(var2)

fxp_var2 = fi(var2, numerictype(1,8))
fxp_var2.bin

% the same works for integer-only values
fxp_var1 = fi(var1, numerictype(1,8, 0))
fxp_var1.bin

% understand rounding modes and saturation modes
var3 = randn(3) 
fxp_floor_var3 = fi(var2, numerictype(1,8), "RoundingMethod", "floor")
fxp_ceil_var3 = fi(var2, numerictype(1,8), "RoundingMethod", "ceiling")

% doing math with quantized values
b = 10*fxp_var1 + fxp_floor_var3
b_8bit_rnd = fi(b, numerictype(1,8))
b_8bit_sat = fi(b, numerictype(1,8, 1))

c = tanh(fxp_floor_var3)