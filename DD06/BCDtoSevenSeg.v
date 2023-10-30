`timescale 1ns / 1ps

module BCDtoSevenSeg(a,b,c,d,e,f,g,BCDIn);

output reg a,b,c,d,e,f,g;
input [3:0] BCDIn;

always @(BCDIn)
begin
    convert_time(a, b, c, d, e, f, g, BCDIn);
end

task convert_time;
output reg A,B,C,D,E,F,G;
input [3:0] in;
begin
    case(in)
        0: begin A = 1'b1; B = 1'b1; C = 1'b1; D = 1'b1; E = 1'b1; F = 1'b1; G = 1'b0; end
        1: begin A = 1'b0; B = 1'b1; C = 1'b1; D = 1'b0; E = 1'b0; F = 1'b0; G = 1'b0; end
        2: begin A = 1'b1; B = 1'b1; C = 1'b0; D = 1'b1; E = 1'b1; F = 1'b0; G = 1'b1; end
        3: begin A = 1'b1; B = 1'b1; C = 1'b1; D = 1'b1; E = 1'b0; F = 1'b0; G = 1'b1; end    
        4: begin A = 1'b0; B = 1'b1; C = 1'b1; D = 1'b0; E = 1'b0; F = 1'b1; G = 1'b1; end
        5: begin A = 1'b1; B = 1'b0; C = 1'b1; D = 1'b1; E = 1'b0; F = 1'b1; G = 1'b1; end
        6: begin A = 1'b1; B = 1'b0; C = 1'b1; D = 1'b1; E = 1'b1; F = 1'b1; G = 1'b1; end
        7: begin A = 1'b1; B = 1'b1; C = 1'b1; D = 1'b0; E = 1'b0; F = 1'b0; G = 1'b0; end
        8: begin A = 1'b1; B = 1'b1; C = 1'b1; D = 1'b1; E = 1'b1; F = 1'b1; G = 1'b1; end
        9: begin A = 1'b1; B = 1'b1; C = 1'b1; D = 1'b1; E = 1'b0; F = 1'b1; G = 1'b1; end
        default: begin A = 1'b0; B = 1'b0; C = 1'b0; D = 1'b0; E = 1'b0; F = 1'b0; G = 1'b0; end
    endcase

end
endtask


endmodule
