module senoide #(parameter FREQUENCIA = 10*10**6, CLOCK_IN=50*10**6, POSICAO = 4095, BITS_ENDERECO = 12, PASSOS=1) 
(
  input clk,
  input rst_n,
  output reg [11:0] saida
);
  
  reg [11:0] memoria [0:POSICAO-1];
  reg [BITS_ENDERECO-1:0] endereco;
  reg [$clog2(CLOCK_IN/FREQUENCIA):0] contador;


  initial begin
    $readmemh ("seno.txt", memoria);
    endereco <= 0;
    contador <= 0;
  end

  always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
      endereco <= 0;
      contador <= 0;
    end
    else if (contador >= (CLOCK_IN/FREQUENCIA)-1) begin 
      endereco <= endereco + PASSOS;
      contador <= 0;
      if (endereco >= (POSICAO-1)) 
        endereco <= 0;
  end
    else 
      contador <= contador + 1;
  end

  always @(*) begin
    if (~rst_n)
      saida = 0;
    else
      saida = memoria[endereco];
  end
endmodule


