class alu_seq_item extends uvm_sequence_item;

 rand logic [31:0] A;      // operand 1
 rand logic [31:0] B;      // operand 2
      logic [ 3:0] Opcode; // opcode
      logic [31:0] Result; // Result
       Logic        Error;  // Result

// Constraints 
constraint operand_constraints { 
A > B; // Ensure A is always greater than B 
A < 1000; // Limit A to a maximum of 999 
B < 500; // Limit B to a maximum of 499 
Opcode inside {4'b0000, 4'b0001, 4'b0010, 4'b0011}; // Allowed opcodes 
}

endclass// Constraints
constraint valid_operands {
// Ensure that opA and opB are within reasonable ranges

opA inside {0, 1, 2, 3, 4, 5};
// Can customize these ranges
opB inside {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
}
constraint no_division_by_zero {
// For DIV operation, make sure opB is never zero
if (operation == DIV) { opB != 0; } }
constraint random_operations {
// Randomize operation between ADD, SUB, MUL, and DIV
operation inside {ADD, SUB, MUL, DIV};
}

