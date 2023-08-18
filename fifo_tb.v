`timescale 1ns / 1ps
module tb_fifo() ; 

parameter ADDRSIZE  = 4 ;
parameter DATASIZE  = 8 ; 
  reg    rrst_n   ; 
  reg    rclk   ; 
  reg    rinc   ; 
  wire  [DATASIZE-1:0]  rdata   ; 
  reg    wrst_n   ; 
  reg    wclk   ; 
  reg    winc   ; 
  reg  [DATASIZE-1:0]  wdata   ; 
  wire    rempty   ; 
  wire    wfull   ; 
  fifo1    #(  DATASIZE ,ADDRSIZE  )
   DUT  ( 
       .rrst_n (rrst_n ) ,
      .rclk (rclk ) ,
      .rinc (rinc ) ,
      .rdata (rdata ) ,
      .wrst_n (wrst_n ) ,
      .wclk (wclk ) ,
      .winc (winc ) ,
      .wdata (wdata ) ,
      .rempty (rempty ) ,
      .wfull (wfull ) ); 

initial begin
rclk=0;
wclk=0;
 winc = 1'b1;
rinc =1'b0;
 wrst_n = 1;
rrst_n = 1;
end

always #20 rclk =  ~rclk;
always  #10 wclk = ~wclk;

  
  initial 
	begin 
		#5 wrst_n = 0;
		rrst_n = 0;
		#5 wrst_n = 1;
		#10 rrst_n = 1;
	//	#20 winc = 1'b1;
	//	rinc =1'b1;
		#20 wdata =8'h00;
		@(negedge wclk) wdata = 8'hFF;
		@(negedge wclk) wdata = 8'hF1;
		@(negedge wclk) wdata = 8'hF2; 
		@(negedge wclk) wdata = 8'hF3;
		@(negedge wclk) wdata = 8'hF4;
		@(negedge wclk) wdata = 8'hF5;
		@(negedge wclk) wdata = 8'hF6;
		@(negedge wclk) wdata = 8'hF7;
		@(negedge wclk) wdata = 8'hFF;
		@(negedge wclk) wdata = 8'hF1;
		@(negedge wclk) wdata = 8'hF2; 
		@(negedge wclk) wdata = 8'hF3; 
		@(negedge wclk) wdata = 8'hF4;
		@(negedge wclk) wdata = 8'hF5; //
		@(negedge wclk) wdata = 8'hF6;
		@(negedge wclk) wdata = 8'hF7;
		@(negedge wclk) wdata = 8'hF4;
		@(negedge wclk) wdata = 8'hF5;
		@(negedge wclk) wdata = 8'hF6;
		@(negedge wclk) wdata = 8'hF7; 
		rinc =1'b1;
		winc =1'b0;
		#5000 winc =1'b0;
		#10000 $finish;
	end
	
endmodule