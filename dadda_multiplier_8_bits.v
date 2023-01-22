`timescale 1ns / 1ps

module dadda_multiplier_8_bits(
    input [7:0] a,
    input [7:0] b,
    output [16:0] out
    
    );

wire [42:1]s,c;
wire [15:0] sum_term1;
wire [15:0] sum_term2;
Half_adder ha1(.a(b[0]&a[6]),.b(b[1]&a[5]),.s(s[1]),.c_out(c[1]));

full_adder_verilog fa1(.a(b[0]&a[7]),.b(b[1]&a[6]),.c_in(b[2]&a[5]),.s(s[2]),.c_out(c[2]));
Half_adder ha2(.a(b[3]&a[4]),.b(b[4]&a[3]),.s(s[3]),.c_out(c[3]));

full_adder_verilog fa2(.a(b[1]&a[7]),.b(b[2]&a[6]),.c_in(b[3]&a[5]),.s(s[4]),.c_out(c[4]));
Half_adder ha3(.a(b[4]&a[4]),.b(b[5]&a[3]),.s(s[5]),.c_out(c[5]));

full_adder_verilog fa3(.a(b[2]&a[7]),.b(b[3]&a[6]),.c_in(b[4]&a[5]),.s(s[6]),.c_out(c[6]));
// first step d=6 done 

Half_adder ha4(.a(b[0]&a[4]),.b(b[1]&a[3]),.s(s[7]),.c_out(c[7]));

full_adder_verilog fa4(.a(b[0]&a[5]),.b(b[1]&a[4]),.c_in(b[2]&a[3]),.s(s[8]),.c_out(c[8]));
Half_adder ha5(.a(b[3]&a[2]),.b(b[4]&a[1]),.s(s[9]),.c_out(c[9]));

full_adder_verilog fa5(.a(s[1]),.b(b[2]&a[4]),.c_in(b[3]&a[3]),.s(s[10]),.c_out(c[10]));
full_adder_verilog fa6(.a(b[4]&a[2]),.b(b[5]&a[1]),.c_in(b[6]&a[0]),.s(s[11]),.c_out(c[11]));

full_adder_verilog fa7(.a(s[2]),.b(s[3]),.c_in(b[5]&a[2]),.s(s[12]),.c_out(c[12]));
full_adder_verilog fa8(.a(b[6]&a[1]),.b(b[7]&a[0]),.c_in(c[1]),.s(s[13]),.c_out(c[13]));

full_adder_verilog fa9(.a(s[4]),.b(s[5]),.c_in(b[6]&a[2]),.s(s[14]),.c_out(c[14]));
full_adder_verilog fa10(.a(b[7]&a[1]),.b(c[2]),.c_in(c[3]),.s(s[15]),.c_out(c[15]));

full_adder_verilog fa11(.a(s[6]),.b(b[5]&a[4]),.c_in(b[6]&a[3]),.s(s[16]),.c_out(c[16]));
full_adder_verilog fa12(.a(b[7]&a[2]),.b(c[4]),.c_in(c[5]),.s(s[17]),.c_out(c[17]));

full_adder_verilog fa13(.a(b[3]&a[7]),.b(b[4]&a[6]),.c_in(b[5]&a[5]),.s(s[18]),.c_out(c[18]));
full_adder_verilog fa14(.a(b[7]&a[3]),.b(b[6]&a[4]),.c_in(c[6]),.s(s[19]),.c_out(c[19]));

full_adder_verilog fa15(.a(b[4]&a[7]),.b(b[5]&a[6]),.c_in(b[6]&a[5]),.s(s[20]),.c_out(c[20]));
//second step with d=4 done 

Half_adder ha6(.a(b[0]&a[3]),.b(b[1]&a[2]),.s(s[21]),.c_out(c[21]));

full_adder_verilog fa16(.a(s[7]),.b(b[2]&a[2]),.c_in(b[3]&a[1]),.s(s[22]),.c_out(c[22]));

full_adder_verilog fa17(.a(s[8]),.b(s[9]),.c_in(b[5]&a[0]),.s(s[23]),.c_out(c[23]));

full_adder_verilog fa18(.a(s[10]),.b(s[11]),.c_in(c[8]),.s(s[24]),.c_out(c[24]));

full_adder_verilog fa19(.a(s[12]),.b(s[13]),.c_in(c[10]),.s(s[25]),.c_out(c[25]));

full_adder_verilog fa20(.a(s[14]),.b(s[15]),.c_in(c[12]),.s(s[26]),.c_out(c[26]));

full_adder_verilog fa21(.a(s[16]),.b(s[17]),.c_in(c[14]),.s(s[27]),.c_out(c[27]));

full_adder_verilog fa22(.a(s[18]),.b(s[19]),.c_in(c[16]),.s(s[28]),.c_out(c[28]));

full_adder_verilog fa23(.a(s[20]),.b(b[7]&a[4]),.c_in(c[18]),.s(s[29]),.c_out(c[29]));

full_adder_verilog fa24(.a(b[5]&a[7]),.b(b[6]&a[6]),.c_in(b[7]&a[5]),.s(s[30]),.c_out(c[30]));
// third step with d=3 done 

Half_adder ha7(.a(b[0]&a[2]),.b(b[1]&a[1]),.s(s[31]),.c_out(c[31]));

full_adder_verilog fa25(.a(s[21]),.b(b[2]&a[1]),.c_in(b[3]&a[0]),.s(s[32]),.c_out(c[32]));

full_adder_verilog fa26(.a(s[22]),.b(b[4]&a[0]),.c_in(c[21]),.s(s[33]),.c_out(c[33]));

full_adder_verilog fa27(.a(s[23]),.b(c[7]),.c_in(c[22]),.s(s[34]),.c_out(c[34]));

full_adder_verilog fa28(.a(s[24]),.b(c[9]),.c_in(c[23]),.s(s[35]),.c_out(c[35]));

full_adder_verilog fa29(.a(s[25]),.b(c[11]),.c_in(c[24]),.s(s[36]),.c_out(c[36]));

full_adder_verilog fa30(.a(s[26]),.b(c[13]),.c_in(c[25]),.s(s[37]),.c_out(c[37]));

full_adder_verilog fa31(.a(s[27]),.b(c[15]),.c_in(c[26]),.s(s[38]),.c_out(c[38]));

full_adder_verilog fa32(.a(s[28]),.b(c[17]),.c_in(c[27]),.s(s[39]),.c_out(c[39]));

full_adder_verilog fa33(.a(s[29]),.b(c[19]),.c_in(c[28]),.s(s[40]),.c_out(c[40]));

full_adder_verilog fa34(.a(s[30]),.b(c[20]),.c_in(c[29]),.s(s[41]),.c_out(c[41]));

full_adder_verilog fa35(.a(b[7]&a[6]),.b(b[6]&a[7]),.c_in(c[30]),.s(s[42]),.c_out(c[42]));
// fourth step with d=2 done 


// final addition using cla

//cla_16bits cla1(.a(b[0]&a[1]),.a(s[32]),.a(s[42:32]),.a(b[7]&a[7]),.a(0),.b(b[1]&a[0]),.b(b[2]&a[0]),.out(out),.c_out(),c_in(0));
assign sum_term1[0]=b[0]&a[0];
assign sum_term1[1]=b[0]&a[1];
assign sum_term1[2]=s[31];
assign sum_term1[3]=s[32];
assign sum_term1[4]=s[33];
assign sum_term1[5]=s[34];
assign sum_term1[6]=s[35];
assign sum_term1[7]=s[36];
assign sum_term1[8]=s[37];
assign sum_term1[9]=s[38];
assign sum_term1[10]=s[39];
assign sum_term1[11]=s[40];
assign sum_term1[12]=s[41];
assign sum_term1[13]=s[42];
assign sum_term1[14]=b[7]&a[7];
assign sum_term1[15]=0;

assign sum_term2[0]=0;
assign sum_term2[1]=b[1]&a[0];
assign sum_term2[2]=b[2]&a[0];
assign sum_term2[3]=c[31];
assign sum_term2[4]=c[32];
assign sum_term2[5]=c[33];
assign sum_term2[6]=c[34];
assign sum_term2[7]=c[35];
assign sum_term2[8]=c[36];
assign sum_term2[9]=c[37];
assign sum_term2[10]=c[38];
assign sum_term2[11]=c[39];
assign sum_term2[12]=c[40];
assign sum_term2[13]=c[41];
assign sum_term2[14]=c[42];
assign sum_term2[15]=0;


cla_16bits cla1 (.a(sum_term1),.b(sum_term2),.c_in(0),.c_out(out[16]),.out(out[15:0]));
endmodule
     

