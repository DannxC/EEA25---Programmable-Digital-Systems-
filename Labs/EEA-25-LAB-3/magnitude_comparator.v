module magnitude_comparator (
  // Inputs
  input [3:0] a, b,
  // Outputs
  output aeqb, agtb, altb
);

  assign aeqb = (a == b) ? 1'b1 : 1'b0;
  assign agtb = (a > b)  ? 1'b1 : 1'b0;
  assign altb = (a < b)  ? 1'b1 : 1'b0;

endmodule



// CHALLENGE

// module magnitude_comparator (
//   // Inputs
//   input [3:0] a, b,
//   // Outputs
//   output aeqb, agtb, altb
// );
//   wire x0, x1, x2, x3;
//   wire gt0, gt1, gt2, gt3;
//   wire lt0, lt1, lt2, lt3;

//   // Equivalent logic for A == B
//   assign x3 = ~(a[3] ^ b[3]);
//   assign x2 = ~(a[2] ^ b[2]);
//   assign x1 = ~(a[1] ^ b[1]);
//   assign x0 = ~(a[0] ^ b[0]);
//   assign aeqb = x3 & x2 & x1 & x0;

//   // Equivalent logic for A > B
//   assign gt3 = a[3] & ~b[3];
//   assign gt2 = ~a[3] & ~b[3] & a[2] & ~b[2];
//   assign gt1 = ~a[3] & ~b[3] & ~a[2] & ~b[2] & a[1] & ~b[1];
//   assign gt0 = ~a[3] & ~b[3] & ~a[2] & ~b[2] & ~a[1] & ~b[1] & a[0] & ~b[0];
//   assign agtb = gt3 | gt2 | gt1 | gt0;

//   // Equivalent logic for A < B
//   assign lt3 = ~a[3] & b[3];
//   assign lt2 = ~a[3] & ~b[3] & ~a[2] & b[2];
//   assign lt1 = ~a[3] & ~b[3] & ~a[2] & ~b[2] & ~a[1] & b[1];
//   assign lt0 = ~a[3] & ~b[3] & ~a[2] & ~b[2] & ~a[1] & ~b[1] & ~a[0] & b[0];
//   assign altb = lt3 | lt2 | lt1 | lt0;

// endmodule