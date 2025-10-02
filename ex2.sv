class alu_seq_item extends uvm_sequence_item;
`uvm_object_utils(alu_seq_item)

  // Data Members 
 rand logic [31:0] A;      // operand 1
 rand logic [31:0] B;      // operand 2
      logic [ 3:0] Opcode; // opcode
      logic [31:0] Result; // Result
       Logic        Error;  // Result

  // Constructor
  function new(string name = "alu_seq_item");
    super.new(name);
  endfunction

endclass
