module senoide_tb;

  reg clk;
  reg rst_n;
  wire [11:0] saida;
  
  senoide # (.FREQUENCIA(5*10**6), .CLOCK_IN(50*10**6), .POSICAO(4096), .BITS_ENDERECO(12), .PASSOS(1)) 
u0 (
    .clk(clk),
    .rst_n(rst_n),
    .saida(saida)
  );
  
 initial begin
 clk = 0;
 while (1) begin
   #10;
   clk = ~ clk;
  end
end

  initial begin
    rst_n = 0;
 #15;
    rst_n = 1; 
  end


  
endmodule

