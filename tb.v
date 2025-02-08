
module tb;

reg  clk   ;
reg  rst   ;
reg  ack   ;
reg  mode  ;
reg  in_MSD_CRC ;
wire out_TE_data;

integer cnt;
TURBO_ENCODER_USING_CIA inst_DUT
(
       .clk	   	(clk	   	), // I
       .rst	   	(rst	   	), // I
       .ack	   	(ack	   	), // I
       .mode	   	(mode	   	), // I
       .in_MSD_CRC 	(in_MSD_CRC 	), // I
                                    
       .out_TE_data	(out_TE_data	)  // O
);

initial 
begin
  clk = 1'b0;
  forever
  #2 clk = !clk;
end

// mode 1:parallel 0: serial

initial 
begin
 rst   = 1'b1;
 mode  = 1'b0;
 in_MSD_CRC = 1'b0;
 $display(" ------------------ Running turbo encoder in Serial Mode -----------------\n");
#10;
 rst   = 1'b0;
 $display(" --------------------------  RESET Released ------------------------------\n");
 #100;
 // 1148 bit data is given as an input to task i.e. applied to DUT
 apply_input({{110{10'h2F6}},48'hABCDEFABCDEF});
 $display(" ---------------------- Applying input MSD+CRC ---------------------------\n");
  	
#30000;
 $display(" ------------------------ serial Mode is Done ----------------------------\n");

#10;
 rst   = 1'b1;
 mode  = 1'b1;
 $display(" ------------------ Running turbo encoder in parallell Mode -----------------\n");
#10;
 rst   = 1'b0;
 $display(" --------------------------  RESET Released ------------------------------\n");
 #100;
 // 1148 bit data is given as an input to task i.e. applied to DUT
 apply_input({{110{10'h2F6}},48'hABCDEFABCDEF});
 $display(" ---------------------- Applying input MSD+CRC ---------------------------\n");
  	
#20000;
 $display(" ------------------------ Parallel Mode is Done ----------------------------\n");

#10;
 $display(" ------------------------ END OF SIMULATION ----------------------------\n");
 $finish;

end


// initial
//  begin
//      $recordfile("proj.trn");
//      $recordvars();
//  end
 

always@(posedge clk)
begin	
 if(ack) 
   cnt <= 0;
 else
   cnt <= cnt + 1;
end

task apply_input(input [1147:0] in);
begin
 @(negedge clk);
  ack          = 1'b1;
  in_MSD_CRC   = in[0];
  repeat(1147) begin
 @(negedge clk);
    ack = 1'b0;
    in_MSD_CRC   = in[cnt];
  end
end
endtask

endmodule
