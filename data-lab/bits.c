/* 
 * CS:APP Data Lab 
 * 
 * <Please put your name and userid here>
 * 
 * bits.c - Source file with your solutions to the Lab.
 *          This is the file you will hand in to your instructor.
 *
 * WARNING: Do not include the <stdio.h> header; it confuses the dlc
 * compiler. You can still use printf for debugging without including
 * <stdio.h>, although you might get a compiler warning. In general,
 * it's not good practice to ignore compiler warnings, but in this
 * case it's OK.  
 */

#if 0
/*
 * Instructions to Students:
 *
 * STEP 1: Read the following instructions carefully.
 */

You will provide your solution to the Data Lab by
editing the collection of functions in this source file.

INTEGER CODING RULES:
 
  Replace the "return" statement in each function with one
  or more lines of C code that implements the function. Your code 
  must conform to the following style:
 
  int Funct(arg1, arg2, ...) {
      /* brief description of how your implementation works */
      int var1 = Expr1;
      ...
      int varM = ExprM;

      varJ = ExprJ;
      ...
      varN = ExprN;
      return ExprR;
  }

  Each "Expr" is an expression using ONLY the following:
  1. Integer constants 0 through 255 (0xFF), inclusive. You are
      not allowed to use big constants such as 0xffffffff.
  2. Function arguments and local variables (no global variables).
  3. Unary integer operations ! ~
  4. Binary integer operations & ^ | + << >>
    
  Some of the problems restrict the set of allowed operators even further.
  Each "Expr" may consist of multiple operators. You are not restricted to
  one operator per line.

  You are expressly forbidden to:
  1. Use any control constructs such as if, do, while, for, switch, etc.
  2. Define or use any macros.
  3. Define any additional functions in this file.
  4. Call any functions.
  5. Use any other operations, such as &&, ||, -, or ?:
  6. Use any form of casting.
  7. Use any data type other than int.  This implies that you
     cannot use arrays, structs, or unions.

 
  You may assume that your machine:
  1. Uses 2s complement, 32-bit representations of integers.
  2. Performs right shifts arithmetically.
  3. Has unpredictable behavior when shifting an integer by more
     than the word size.

EXAMPLES OF ACCEPTABLE CODING STYLE:
  /*
   * pow2plus1 - returns 2^x + 1, where 0 <= x <= 31
   */
  int pow2plus1(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     return (1 << x) + 1;
  }

  /*
   * pow2plus4 - returns 2^x + 4, where 0 <= x <= 31
   */
  int pow2plus4(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     int result = (1 << x);
     result += 4;
     return result;
  }

FLOATING POINT CODING RULES

For the problems that require you to implent floating-point operations,
the coding rules are less strict.  You are allowed to use looping and
conditional control.  You are allowed to use both ints and unsigneds.
You can use arbitrary integer and unsigned constants.

You are expressly forbidden to:
  1. Define or use any macros.
  2. Define any additional functions in this file.
  3. Call any functions.
  4. Use any form of casting.
  5. Use any data type other than int or unsigned.  This means that you
     cannot use arrays, structs, or unions.
  6. Use any floating point data types, operations, or constants.


NOTES:
  1. Use the dlc (data lab checker) compiler (described in the handout) to 
     check the legality of your solutions.
  2. Each function has a maximum number of operators (! ~ & ^ | + << >>)
     that you are allowed to use for your implementation of the function. 
     The max operator count is checked by dlc. Note that '=' is not 
     counted; you may use as many of these as you want without penalty.
  3. Use the btest test harness to check your functions for correctness.
  4. Use the BDD checker to formally verify your functions
  5. The maximum number of ops for each function is given in the
     header comment for each function. If there are any inconsistencies 
     between the maximum ops in the writeup and in this file, consider
     this file the authoritative source.

/*
 * STEP 2: Modify the following functions according the coding rules.
 * 
 *   IMPORTANT. TO AVOID GRADING SURPRISES:
 *   1. Use the dlc compiler to check that your solutions conform
 *      to the coding rules.
 *   2. Use the BDD checker to formally verify that your solutions produce 
 *      the correct answers.
 */


#endif
/* 
 * bitAnd - x&y using only ~ and | 
 *   Example: bitAnd(6, 5) = 4
 *   Legal ops: ~ |
 *   Max ops: 8
 *   Rating: 1
 */
int bitAnd(int x, int y)  {
  // de morgan
  return ~(~x|~y);
}
/* 
 * getByte - Extract byte n from word x
 *   Bytes numbered from 0 (LSB) to 3 (MSB)
 *   Examples: getByte(0x12345678,1) = 0x56
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 6
 *   Rating: 2
 */
int getByte(int x, int n) {
  int m = n << 3;
  int a1 = 0xff << m;
  int a2 = x & a1;
  int a3 = a2 >> m;
  // important
  int a4 = a3 & 0xff;
  return a4;
}
/* 
 * logicalShift - shift x to the right by n, using a logical shift
 *   Can assume that 0 <= n <= 31
 *   Examples: logicalShift(0x87654321,4) = 0x08765432
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 20
 *   Rating: 3 
 */
int logicalShift(int x, int n) {
  int arith_ans = x >> n;
  // compute 1..[n]..10..[32-n]..0
  int mask1 = ((1 << 31) >> n) << 1;
  int mask = ~mask1;
  return arith_ans & mask;
}
/*
 * bitCount - returns count of number of 1's in word
 *   Examples: bitCount(5) = 2, bitCount(7) = 3
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 40
 *   Rating: 4
 */
int bitCount(int x) {
  int m1_ = 0x55 + (0x55 << 8);
  int m1 = m1_ | (m1_ << 16);

  int m2_ = 0x33 + (0x33 << 8);
  int m2 = m2_ | (m2_ << 16);

  int m3_ = 0x0f + (0x0f << 8);
  int m3 = m3_ | (m3_ << 16);

  int m4 = 0xff + (0xff << 16);
  int m5 = 0xff + (0xff << 8);
  x = ((x & m1) + ((x>>1) & m1)) ;
  x = ((x & m2) + ((x>>2) & m2)) ;
  x = ((x & m3) + ((x>>4) & m3)) ;
  x = ((x & m4) + ((x>>8) & m4)) ;
  x = ((x & m5) + ((x>>16) & m5)) ;
  return x;
}
/* 
 * bang - Compute !x without using !
 *   Examples: bang(3) = 0, bang(0) = 1
 *   Legal ops: ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 4 
 */
int bang(int x) {
  // Hard for me
  int neg_x = ~x + 1;
  int tmp = neg_x | x;
  return (~(tmp >> 31)) & 1;
}
/* 
 * tmin - return minimum two's complement integer 
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 4
 *   Rating: 1
 */
int tmin(void) {
  return (1 << 31);
}
/* 
 * fitsBits - return 1 if x can be represented as an 
 *  n-bit, two's complement integer.
 *   1 <= n <= 32
 *   Examples: fitsBits(5,3) = 0, fitsBits(-4,3) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15
 *   Rating: 2
 */
int fitsBits(int x, int n) {
  int mask = (1 << 31) >> (32 + ~n + 1);
  int sgn_bit = x >> 31;
  int p = sgn_bit << 31 >> 31;
  return !((x ^ p) & mask);
}
/* 
 * divpwr2 - Compute x/(2^n), for 0 <= n <= 30
 *  Round toward zero
 *   Examples: divpwr2(15,1) = 7, divpwr2(-33,4) = -2
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15
 *   Rating: 2
 */
int divpwr2(int x, int n) {
  int mask = x >> 31;
  // if neg, m == 0xffffffff; if pos, m = 0
  int offset = ((1 << n) + ~0) & mask;
  return (x + offset) >> n;
}
/* 
 * negate - return -x 
 *   Example: negate(1) = -1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 5
 *   Rating: 2
 */
int negate(int x) {
  return (~x) + 1;
}
/* 
 * isPositive - return 1 if x > 0, return 0 otherwise 
 *   Example: isPositive(-1) = 0.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 8
 *   Rating: 3
 */
int isPositive(int x) {
  return !(x >> 31) & (!!x) ;
}
/* 
 * isLessOrEqual - if x <= y  then return 1, else return 0 
 *   Example: isLessOrEqual(4,5) = 1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 24
 *   Rating: 3
 */
int isLessOrEqual(int x, int y) {
  int sgn_x = x >> 31;
  int sgn_y = y >> 31;
  int do_cmp = ~(sgn_x ^ sgn_y);
  int cmp_res = y + (~x + 1);
  int sgn_res = cmp_res >> 31;
  int cmp_ans = !sgn_res;
  int no_cmp_ans = !!sgn_x;
  int ans = (cmp_ans & do_cmp) | (no_cmp_ans & ~do_cmp);
  return ans & 1;
}
/*
 * ilog2 - return floor(log base 2 of x), where x > 0
 *   Example: ilog2(16) = 4
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 90
 *   Rating: 4
 */
int ilog2(int x) {
  int ans = 0;
  int _0xffff = (0xff << 8) + 0xff;

  // 16
  int up = (x >> 16) & _0xffff;
  int down = x & _0xffff;
  int j = !!up;
  int m = ~(j + ~0);
  ans = ans + (j << 4);
  x = (m & up) | (~m & down);

  // 8
  up = (x >> 8) & 0xff;
  down = x & 0xff;
  j = !!up;
  ans = ans + (j << 3);
  m = ~(j + ~0);
  x = (m & up) | (~m & down);

  // 4
  up = (x >> 4) & 0xf;
  down = x & 0xf;
  j = !!up;
  ans = ans + (j << 2);
  m = ~(j + ~0);
  x = (m & up) | (~m & down);

  // 3 2 1 0
  ans = ans + (!! x);
  x = (x >> 1) & 0x7;
  ans = ans + (!! x);
  x = (x >> 1) & 0x3;
  ans = ans + (!! x);
  x = (x >> 1) & 0x1;
  ans = ans + x;
  ans = ans + ~0;
  return ans;
}
/* 
 * float_neg - Return bit-level equivalent of expression -f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representations of
 *   single-precision floating point values.
 *   When argument is NaN, return argument.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 10
 *   Rating: 2
 */
unsigned float_neg(unsigned uf) {
  if(((uf & 0x7f800000) == 0x7f800000) && (uf & 0x007fffff)) return uf;
  return uf ^ 0x80000000;
}
/* 
 * float_i2f - Return bit-level equivalent of expression (float) x
 *   Result is returned as unsigned int, but
 *   it is to be interpreted as the bit-level representation of a
 *   single-precision floating point values.
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
unsigned float_i2f(int x) {
  unsigned f, s, ux;
  unsigned prec = 0;
  int e, flag = 0;
  int half, mov, tmp;
  if(x == 0) return 0;
  if(x == 0x80000000) return 0xcf000000;
  ux = (x < 0) ? -x : x;
  f = ux;
  s = x & 0x80000000;
  while(ux){
    prec++;
    ux >>= 1;
  }
  e = prec + 127 - 1;
  if(prec <= 23){
    f <<= (24 - prec);
  }else if(prec > 24){
    mov = (prec - 24);
    half = 1 << mov;
    tmp = (f & (half - 1));
    half /= 2;
    if(tmp > half){
      flag = 1;
    }
    f >>= mov;
    if (tmp == half && (f & 1))
        flag = 1;
  }
  f &= 0x7fffff;
  e &= 0xff;
  f = (f | (e << 23) | s) + flag;
  return f;
}
/* 
 * float_twice - Return bit-level equivalent of expression 2*f for
 *   floating point argument f.
 *   Both the argument and result are passed as unsigned int's, but
 *   they are to be interpreted as the bit-level representation of
 *   single-precision floating point values.
 *   When argument is NaN, return argument
 *   Legal ops: Any integer/unsigned operations incl. ||, &&. also if, while
 *   Max ops: 30
 *   Rating: 4
 */
unsigned float_twice(unsigned uf) {
  unsigned s = uf & 0x80000000;
  unsigned e = uf & 0x7f800000;
  unsigned f = uf & 0x007fffff;
  if (e == 0x7f800000)
  {
    return uf;
  } else if((uf | 0x807fffff) == 0x807fffff){
    if (uf & 0x400000){
      e+=0x800000;
      f <<= 1;
    }else{
      f <<= 1;
    }
  } else{
    if (e == 0x7f800000){
      // overflow natually to Inf
      f <<= 1;
    }else{
      e+=0x800000;
    }
  }
  f = (f | e | s);
  return f;
}
