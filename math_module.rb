# acos : This method calculate the arc cosine of given value a. It return in the range[0..PI]. The return type of this method is float.
puts Math.acos(0) # 1.5707963267948966
puts Math.acos(0) == Math::PI/2 # true

# acosh : This method calculate the inverse hyperbolic cosine of given value a. The return type of this method is float.
# Math.acosh(a)
# asin : This method calculate the arc sine of given value a. It return in the range[-PI/2..PI/2]. The return type of this method is float.
# Math.asin(a)
# asinh : This method calculate the inverse hyperbolic sine of given value a. The return type of this method is float.
# Math.asinh(a)
# Example: 
puts Math.asinh(2) # 1.4436354751788103
# atan : This method calculate the arc of tangent of given of given value a. It returns in the range[-PI..PI]. The return type of this method is the float.
# Math.atan(a)
# atanh : This method calculate the inverse hyperbolic tangent of given value a. The return type of this method is float.
# Math.atanh(a)

puts Math.atanh(0.5) # 0.5493061443340548
# atan2 : This method calculate the arc of tangent of given value a and b. It returns in the range[-PI..PI]. The return type of this method is float.
# Math.atan2(a, b)
# cos : This method calculate the cosine of given value a, expressed in radians and return in the range[-1.0..1.0]. The return type of this method is float.
# Math.cos(a)

# Ruby code to illustrate the 
# cos method
puts Math.cos(1) # 0.5403023058681398
# cosh : This method calculate the hyperbolic cosine of given value a and expressed in radians. The return type of this method is float.
# Math.cosh(a)
# erf : This method returns the error function of given value a. The return type of this method is float.
# Math.erf(a)
# erfc : This method returns the complementary error function of given value a. The return type of this method is float.
# Math.erfc(a)
# exp : This method returns the value of ea. The return type of this method is float.
# Math.exp(a)

# Ruby code to illustrate the 
# exp method
puts Math.exp(2) # 7.38905609893065
# frexp : This method returns a two-element array that consisting the normalized fraction and exponent of numeric.
# Math.frexp(numeric)
# hypot :This method returns √a2+b2. Or in other words it returns the hypotenuse of right-angle triangle with sides a and b. The return type of this method is float.
# Math.hypot(a, b)

# Ruby code to illustrate the 
# hypot method
puts Math.hypot(4,5) # 6.4031242374328485
# Idexp : This method returns the value of float * 2 integer. The return type of this method is float.
# Math.Idexp(float, integer)
# log : This method returns the natural logarithm of numeric. The return type of this method is float.
# Math.log(numeric)
# log10 : This method return the base 10 of the logarithm of numeric. The return type of this method is float.
# Math.log10(numeric)
# sin : This method calculate the sine of numeric and expressed in radians. It return in the range[-1.0..1.0 ]. The return type of this method is float.
# Math.sin(numeric)

# Ruby code to illustrate the 
# sin method
puts Math.sin(0) # 0.0
puts Math.log(10) # 2.302585092994046
puts Math.log10(a) # 0.36221568869946325
# sinh : This method calculate the hyperbolic sine of numeric and expressed in radians. The return type of this method is float.
# Math.sinh(numeric)
# sqrt : This method return the non-negative square root of numeric and raise ArgError if numeric is less than zero. The return type of this method is float.
# Math.sqrt(numeric)
# tan : This method return the tangent of numeric and expressed in radians. The return type of this method is float.
# Math.tan(numeric)
# tanh : This method calculate the hyperbolic tangent of numeric and expressed in radians. The return type of this method is float.
# Math.tanh(numeric)

# Ruby code to illustrate the 
# tanh method
puts Math.tanh(1) # 0.7615941559557649
puts Math.sqrt(25) # 5