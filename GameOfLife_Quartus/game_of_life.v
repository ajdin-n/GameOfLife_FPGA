module game_of_life(x, y, r, g, b, clock_50);

    input [9:0] x, y;
    output [9:0] r, g, b;
	 input clock_50;
	 reg [29:0] RGB;

    reg [0:64*48-1] cells;
    reg [0:64*48-1] cells_preset;
	
    initial 
	 begin
        // When the program is loaded, start with the first preset
        cells_preset[0    :64*0+63 ] <= 64'b0000000000000000011010100000000000000000011010100000000000000000;
        cells_preset[64*1 :64*1+63 ] <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
        cells_preset[64*2 :64*2+63 ] <= 64'b0000000001101010000000000100000000000000000110101000000000000000;
        cells_preset[64*3 :64*3+63 ] <= 64'b0000000000000000000000010100000000000000000110101000000000000000;
        cells_preset[64*4 :64*4+63 ] <= 64'b0000000000000110000001100000000000011000000000110101000000000000;
        cells_preset[64*5 :64*5+63 ] <= 64'b0000000000001000100001100000000000011000000000000000000000000000;
        cells_preset[64*6 :64*6+63 ] <= 64'b0110000000010000010001100000000011010100000000000000000000000000;
        cells_preset[64*7 :64*7+63 ] <= 64'b0110000000010001011000010100000000011010100000000001101010000000;
        cells_preset[64*8 :64*8+63 ] <= 64'b0000000000010000010000000100000000000000000110101000000000000000;
        cells_preset[64*9 :64*9+63 ] <= 64'b0000000000001000100000000000000000000000000000000000000000000000;
        cells_preset[64*10:64*10+63] <= 64'b0000000000000110000000000000000011010100000000000000000011010100;
        cells_preset[64*11:64*11+63] <= 64'b0000000000000000000000000000000000000000011010100000000000000000;
        cells_preset[64*12:64*12+63] <= 64'b0000000000000000000000000110101000000000000000000000000000000000;
        cells_preset[64*13:64*13+63] <= 64'b0000000000000000000000000110101000000000000000000110101000000000;
        cells_preset[64*14:64*14+63] <= 64'b0000000000000000000000000110101000000000011010100000000000000000;
        cells_preset[64*15:64*15+63] <= 64'b0000000001101010000000000000000001101010000000000110101000000000;
        cells_preset[64*16:64*16+63] <= 64'b0000000000000000011010100000000000000000011010100000000001101010;
        cells_preset[64*17:64*17+63] <= 64'b0000000000000000000000000110101000000000000000000110101000000000;
        cells_preset[64*18:64*18+63] <= 64'b0110101000000000011010100000000001101010000000000110101000000000;
        cells_preset[64*19:64*19+63] <= 64'b0000000001101010000000000110101001101010000000000110101000000000;
        cells_preset[64*20:64*20+63] <= 64'b0000000000000000000000000110101000000000000000000000000000000000;
        cells_preset[64*21:64*21+63] <= 64'b0000000000000000011010100000000000000000011010100000000000000000;
        cells_preset[64*22:64*22+63] <= 64'b0000000000000000011010100000000110000000001100000000011010100000;
        cells_preset[64*23:64*23+63] <= 64'b0000000000000000000000000000001010000000001101101010000000000000;
        cells_preset[64*24:64*24+63] <= 64'b0000000011000000011000000000001100000000011010100000000000000000;
        cells_preset[64*25:64*25+63] <= 64'b0000000011000000101000000000000000001101010000000000000000000000;
        cells_preset[64*26:64*26+63] <= 64'b0000000000000000110000001100000000000000000110101000000000000000;
        cells_preset[64*27:64*27+63] <= 64'b0000000000000000000000001010110101000000000000000000000000000000;
        cells_preset[64*28:64*28+63] <= 64'b0000000001101010000000001000000000000000001101010000000000000000;
        cells_preset[64*29:64*29+63] <= 64'b0000000000000000011010100000000000000000000110110101000000000000;
        cells_preset[64*30:64*30+63] <= 64'b0000000000000000011010100000000001101010000101000000000000000000;
        cells_preset[64*31:64*31+63] <= 64'b0000000000000000011010100000000000000000000100000000011010100000;
        cells_preset[64*32:64*32+63] <= 64'b0000000000000000000000000110101000000000000000000110101000000000;
        cells_preset[64*33:64*33+63] <= 64'b0000000000000000011010100000000000000000011010100000000000000000;
        cells_preset[64*34:64*34+63] <= 64'b0000000001101010000000000000000011100000000000000000000000000000;
        cells_preset[64*35:64*35+63] <= 64'b0000000000000000011010100000000010000000000000000000000000000000;
        cells_preset[64*36:64*36+63] <= 64'b0000000000000000011010100000000001000000000000000001101010000000;
        cells_preset[64*37:64*37+63] <= 64'b0000000000000000011010100000000000000000000000000000000001101010;
        cells_preset[64*38:64*38+63] <= 64'b0000000000000000000000000110101000000000000000000000000001101010;
        cells_preset[64*39:64*39+63] <= 64'b0000000001101010000000000110101000000000000000000110101000000000;
        cells_preset[64*40:64*40+63] <= 64'b0000000001101010000000000000000000000000000000000110101000000000;
        cells_preset[64*41:64*41+63] <= 64'b0000000000000000011010100000000000000000000000000000000000000000;
        cells_preset[64*42:64*42+63] <= 64'b0000000000000000000000000000000000000000011010100000000000000000;
        cells_preset[64*43:64*43+63] <= 64'b0000000000000000000001101010000000000000000001101010011010100000;
        cells_preset[64*44:64*44+63] <= 64'b0110101001101010000000000110101000000000000000000000000000000000;
        cells_preset[64*45:64*45+63] <= 64'b0000000001101010000000000110101001101010011010100000000000000000;
        cells_preset[64*46:64*46+63] <= 64'b0110101001101010011010100110101001101010011010100110101000000000;
        cells_preset[64*47:64*47+63] <= 64'b0110101001101010011010100000000001101010000000000000000000000000;
	 end
	 
initial
cells = cells_preset;

reg [3:0] population;

reg [11:0] i;
initial 
i = 11'd0;

	 wire Clk;
    clock(Clk, clock_50);
	 
always@(posedge clock_50)
begin

        if (i == 0) 
				begin
                // Top-left square
					  population <= cells_preset[64*48 - 1] + 
												cells_preset[64*48 - 64] +
												cells_preset[64*48 - 64 + 1] +
												cells_preset[i     + 64 - 1] +
												cells_preset[i     + 1] +
												cells_preset[64    + 64 - 1] +
												cells_preset[64] +
												cells_preset[64    + 1];
            end
				
				else if (i == 63) 
				begin
                // Top-right square
                  population <= cells_preset[64*48 - 1 - 1] +
												 cells_preset[64*48 - 1] +
												 cells_preset[64*48 - 64] +
												 cells_preset[i     - 1] +
										 		 cells_preset[0] +
												 cells_preset[i     + 64 - 1] +
												 cells_preset[i     + 64] +
												 cells_preset[i     + 1];
            end 
				
				else if (i == 64*48 - 64) 
				begin
                // Bottom-left square
                  population <= cells_preset[i - 1] +
												 cells_preset[i - 64] +
												 cells_preset[i - 64 + 1] +
												 cells_preset[i + 64 - 1] +
												 cells_preset[i + 1] +
												 cells_preset[0 + 64 - 1] +
												 cells_preset[0] +
												 cells_preset[0 + 1];
            end 
				
				else if (i == 64*48 - 1) 
				begin
                // Bottom-right square
                  population <= cells_preset[i - 64 - 1] +
												 cells_preset[i - 64] +
												 cells_preset[i - 64 - 64 + 1] +
												 cells_preset[i - 1] +
												 cells_preset[i - 64 + 1] +
												 cells_preset[0 + 64 - 1 - 1] +
												 cells_preset[0 + 64 - 1] +
												 cells_preset[0];
            end 
				
				else if (i < 63) 
				begin
                // Top row
                  population <= cells_preset[64*48 - 64 + i - 1] +
												 cells_preset[64*48 - 64 + i] +
												 cells_preset[64*48 - 64 + i + 1] +
												 cells_preset[i - 1] +
												 cells_preset[i + 1] +
												 cells_preset[i + 64 - 1] +
												 cells_preset[i + 64] +
												 cells_preset[i + 64 + 1];
            end 
				
				else if (i > 64*48 - 64) 
				begin
                // Bottom row
                  population <= cells_preset[i - 64 - 1] +
												 cells_preset[i - 64] +
												 cells_preset[i - 64 + 1] +
												 cells_preset[i - 1] +
												 cells_preset[i + 1] +
												 cells_preset[0 + i - 1] +
												 cells_preset[0 + i] +
												 cells_preset[0 + i + 1];
            end 
				
				else if (i % 64 == 0) 
				begin
                // Leftmost column
                  population <= cells_preset[i - 1] +
												 cells_preset[i - 64] +
												 cells_preset[i - 64 + 1] +
												 cells_preset[i + 64 - 1] +
												 cells_preset[i + 1] +
												 cells_preset[i + 64 + 64 - 1] +
												 cells_preset[i + 64] +
												 cells_preset[i + 64 + 1];
            end 
				
				else if ((i + 1) % 64 == 0) 
				begin
                // Rightmost column
                  population <= cells_preset[i - 64 - 1] +
												 cells_preset[i - 64] +
												 cells_preset[i - 64 - 64 + 1] +
												 cells_preset[i - 1] +
												 cells_preset[i - 64 + 1] +
												 cells_preset[i + 64 - 1] +
												 cells_preset[i + 64] +
												 cells_preset[i + 1];
            end 
				
				else 
				begin
                // Middle squares
                  population <= cells_preset[i - 64 - 1] +
												 cells_preset[i - 64] +
												 cells_preset[i - 64 + 1] +
												 cells_preset[i - 1] +
												 cells_preset[i + 1] +
												 cells_preset[i + 64 - 1] +
												 cells_preset[i + 64] +
												 cells_preset[i + 64 + 1];
            end
				
		 cells[i] <= ((cells_preset[i] & (population == 2)) | (population == 3));
				
		if(i==64*48)
		begin
			i <= 0;
			cells_preset = cells;
		end
		else
			i <= i + 1;
end
	 
	 
	 always @(x or y) 
	 begin
        if (cells[(y / 10) * 64 + (x / 10)])
            RGB = 30'b111111111111111111111111111111;
        else 
            RGB = 30'b000000000000000000000000000000;
    end
		
		
     assign r = RGB[29:20];
     assign g = RGB[19:10];
    assign b = RGB[9:0];
	 
endmodule


module clock(Clk, Clk_50);
        input Clk_50;
        output Clk;
        reg [31:0] counter;
        
        always @(posedge Clk_50) 
		  begin
            if (counter == 32'd1600)
                counter <= 0;
            else
                counter <= counter + 32'd1;
        end
        assign Clk = (counter == 32'd1600);
endmodule