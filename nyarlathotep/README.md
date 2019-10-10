# nyarlathotep

Implementação do MECI no SHARC

A implementação será feita, num primeiro momento, utilizando
python (por maior acessibilidade do grupo), o pacote sharc para
interface com o openMolcas e o Columbus como pacotes de cálculo
quântico.

Planejamento atual:

0: Definição do nome.
    Nyarlathotep é um nome temporário
   Ler os artigos de implementação do AFIR (MS, SC e DS) e do MESX/MECI no GRRM17
  
1: Implementar o SHARC e os pacotes openMolcas e Columbus.
    Rodar um caso teste e garantir que a implementação está funcional
    Ler os arquivos de saída e saber onde buscar as propriedades necessárias
    
2: Etapa de implementação

  2.1: Montar a interface com o Sharc.
        Escrever a função de leitura do arquivo de saída do Sharc
        e a tirada de informação das propriedades necessárias para o MECI
  
  2.2: Escrever a função projeção do gradiente 
         Implementar o gradiente da força artificial do AFIR
  
  2.3: Preparar as funções de escrita para análise da convergência do método
        .xyz pro molden 
        arquivo de energias (passo  E1  E2  E2-E1)
