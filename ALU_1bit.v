module ALU_1bit( result, carryOut, a, b, invertA, invertB, operation, carryIn, less ); 
  
  output wire result;
  output wire carryOut;
  
  input wire a;
  input wire b;
  input wire invertA;
  input wire invertB;
  input wire[1:0] operation;
  input wire carryIn;
  input wire less;
  
  /*your code here*/ 
  wire w1, w2, w3, w4, w5; 
  assign w1 = invertA ? (~a) : a; 
  assign w2 = invertB ? (~b) : b; 

  or o1(w3, w1, w2); 
  and a1(w4, w1, w2); 
  Full_adder add1(w5, carryOut, carryIn, w1, w2); 

  /*
  11: less  10: w5
  01: w4    00: w3
  */
  assign result = operation[1] ? (operation[0] ? (less) : (w5)) : (operation[0] ? (w4) : (w3)); 

  
endmodule