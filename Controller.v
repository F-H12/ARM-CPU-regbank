module Controller(insOp,ALUOp,AluSrc,Branch,MemRead,MemWrite,RegWrite,MemtoReg,Reg2Loc);
	input [10: 0] insOp;
	output [1:0]ALUOp;
	output reg AluSrc;
	output reg Branch;
	output reg MemRead;
	output reg MemWrite;
	output reg RegWrite;
	output reg MemtoReg;			
	output reg Reg2Loc;

	always@(insOp)
	begin	
		if(insOp=11'b1xx0101x000)
			begin 
			//R-Type
				 Reg2Loc = 1'b0;
			  	 ALUSrc = 1'b0;
			  	 MemToReg = 1'b0;
			  	 RegWrite = 1'b1;
				 MemRead = 1'b0;
			  	 MemWrite = 1'b0;
				 Branch = 1'b0;
				 ALUOp = 2'b10;
			end
		else if(insOp=11'b11111000010)
			begin				
			//LDUR
				 Reg2Loc = 1'bx;
			  	 ALUSrc = 1'b1;
			  	 MemToReg = 1'b1;
			  	 RegWrite = 1'b1;
				 MemRead = 1'b1;
			  	 MemWrite = 1'b0;
				 Branch = 1'b0;
				 ALUOp = 2'b00;
			end
			
		else if(insOp=11'b11111000000)
			begin
			//STUR
				 Reg2Loc = 1'b1;
			  	 ALUSrc = 1'b1;
			  	 MemToReg = 1'bx;
			  	 RegWrite = 1'b0;
				 MemRead = 1'b0;
			  	 MemWrite = 1'b1;
				 Branch = 1'b0;
				 ALUOp = 2'b10;
			end
		else if(insOp=11'b10110100xxx)
			 begin 
			// CBZ
				 Reg2Loc = 1'b1;
			  	 ALUSrc = 1'b0;
			  	 MemToReg = 1'bx;
			  	 RegWrite = 1'b0;
				 MemRead = 1'b0;
			  	 MemWrite = 1'b0;
				 Branch = 1'b1;
				 ALUOp = 2'b01;
			end
	end	
endmodule