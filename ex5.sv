class alu_seq_item extends uvm_sequence_item;

  typedef enum {ADD, SUB, MUL, DIV} alu_op_type;
  rand alu_op_type operation;
    rand bit [31:0] A, B;
  bit      [31:0] Result;
  bit             Error;
  // Constructor
  function new(string name = "alu_seq_item");
    super.new(name);
  Endfunction

`uvm_object_utils_begin(alu_seq_item) // Begin registration of class `uvm_field_int(A, UVM_DEFAULT)        // Register A 
`uvm_field_int(B, UVM_DEFAULT)        // Register B 
`uvm_field_int(Opcode, UVM_DEFAULT)   // Register Opcode `uvm_field_int(Result, UVM_DEFAULT)   // Register Result `uvm_field_int(Error, UVM_DEFAULT)    // Register Error `uvm_object_utils_end                 // End registration of class

endclass
// do_copy function to copy values from one object to another  

function void do_copy(uvm_object rhs);
    alu_seq_item rhs_;
    if (!$cast(rhs_, rhs)) begin
      uvm_report_error("do_copy:", "Cast failed");
      return;
    end
    super.do_copy(rhs);
    // Copy fields specific to alu_seq_item
    operation = rhs_.operation;
    A = rhs_.A;    B = rhs_.B;
    Result = rhs_.Result;
    Error = rhs_.Error;

  endfunction

function bit do_compare(uvm_object rhs, uvm_comparer comparer); alu_seq_item rhs_; 
// Attempt to cast rhs to alu_seq_item
 if (!$cast(rhs_, rhs))
 begin
 return 0; // Return false if casting fails
 end
 // Compare each member variable
 return (super.do_compare(rhs, comparer) &&
 (operation == rhs_.operation) &&
 (A == rhs_.A) &&
 (B == rhs_.B) &&
 (Result == rhs_.Result)&&
 (Error == rhs_.Error)
 );

 endfunction 
// Convert to string
  function string convert2string();
    string s;
    s = super.convert2string();
    $sformat(s,"%s\n%s\noperation\t%s\nopA\t%0d\nopB\t%0d\nexpected_result\t%0d\n",
             s, this.get_name(), operation.name(), A, B, Result,Error);
    return s;

  endfunction

// do_print method
function void do_print(uvm_printer printer); 

// Print the operation type
 printer.print_string("operation", operation.name());
 // Print the operands and expected result
 printer.print_field("A", A, $bits(A), UVM_DEC);
 printer.print_field("B", B, $bits(B), UVM_DEC); 
 printer.print_field("Result", Result, $bits(Result), UVM_DEC);
 printer.print_field("Error", Error, $bits(Error), UVM_DEC);
 
endfunction

// do_record method
function void do_record(uvm_recorder recorder);
    super.do_record(recorder);
    // Record each field
    `uvm_record_field("operation", operation.name())
    `uvm_record_field("A", A)
    `uvm_record_field("B", B)
    `uvm_record_field("Result", Result)
   `uvm_record_field("Error", Error)
endfunction
// do_pack method
function void do_pack(uvm_packer packer);
    super.do_pack(packer);
    packer.pack_enum(operation);
    packer.pack_field_int(A, 32);
    packer.pack_field_int(B, 32);
    packer.pack_field_int(Result, 32);
   packer.pack_field_int(Error, 1);
endfunction
// do_unpack method
function void do_unpack(uvm_packer packer);
    super.do_unpack(packer);
    packer.unpack_enum(operation);
    packer.unpack_field_int(A, 32);
    packer.unpack_field_int(B, 32);
    packer.unpack_field_int(Result,32);
      packer.unpack_field_int(Error,1);
endfunction
// Define operation types
 typedef enum {ADD, SUB, MUL, DIV} alu_op_type;
 rand alu_op_type operation;
 // Define operands and result
 rand bit [31:0] opA, opB;
 bit [31:0] expected_result;
