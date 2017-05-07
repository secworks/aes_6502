module gm_tables();

  function [7 : 0] gm2(input [7 : 0] op);
    begin
      gm2 = {op[6 : 0], 1'b0} ^ (8'h1b & {8{op[7]}});
    end
  endfunction // gm2

  function [7 : 0] gm3(input [7 : 0] op);
    begin
      gm3 = gm2(op) ^ op;
    end
  endfunction // gm3

  initial
    begin : generator
      reg [8 : 0] ctr;
      $display("Generating gm2 and gm3 tables");
      $display("-----------------------------");

      $display("GM2:");
      for (ctr = 0 ; ctr < 256 ; ctr = ctr + 1)
        begin
          $display("gm2(0x%02x) = 0x%02x", ctr[7 : 0], gm2(ctr[7 : 0]));
        end
      $display("");

      $display("GM3:");
      for (ctr = 0 ; ctr < 256 ; ctr = ctr + 1)
        begin
          $display("gm3(0x%02x) = 0x%02x", ctr[7 : 0], gm3(ctr[7 : 0]));
        end
    end
endmodule // gm_tables
