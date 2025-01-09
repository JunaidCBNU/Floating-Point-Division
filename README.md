# Floating-Point-Division
## 32-bit Floating Point Division

Brief Operarion Steps: 

Let's say we have:
A(sign_A, exponent_A,mantissa_A): is the number that is being divided
B(sign_B, exponent_B,mantissa_B): is the number that will divide A
C(sign_C, exponent_C,mantissa_C) is the division result: 
### 1.	Sign_C is calculated using the XOR operation as follows:

assign  sign_C = sign_A ^ sign_B;

### 2.	Exponents of A & B are subtracted with each other using below condition:

assign  exponent_C = (A>B) ? (exponent_A - exponent_B + 8'd127) : (exponent_A - exponent_B + 8'd126);

### 3.	To calculate the Mantissa we initially made dividend (mantissa_A) greater than the divisor (mantissa_B) by shifting-left and checking how many times the divisor can be subtracted from the dividend. Then, we calculate the Quotient using the method explained in Comment 8.

### 4.	Once the Quotient is calculated we find the mantissa_C as below:

assign mantissa_C = (A>B) ? {Quotient[Divisor_DW-1:0]} : {(Quotient[Divisor_DW-2:0]),{1'b0}};

### 5.	 After finding all the three parts of C, we merge it as follows:
assign  C_prev = (A == 0 | B == 0) ? 0 : (en) ? {sign_C, exponent_C, mantissa_C} : 0;

