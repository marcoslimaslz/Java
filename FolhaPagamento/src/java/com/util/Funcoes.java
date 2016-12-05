package com.util;

import java.math.BigDecimal;

public class Funcoes {
    
    public static double getPercIRPFTabela(double Salario){    
      double Perc = 0.0;  
      double[] tabela = new double[10];  
      tabela[0] = 0.0;      tabela[1] = 1903.98; //0.0%
      tabela[2] = 1903.99;  tabela[3] = 2826.65; //7.5%
      tabela[4] = 2826.66;  tabela[5] = 3751.05; //15.0%
      tabela[6] = 3751.06;  tabela[7] = 4664.68; //22.5%
      tabela[8] = 4664.69;  tabela[9] = 99999.99; //27.5%
      if (Salario >= tabela[0] && Salario <= tabela[1] ) {
        Perc = 0.0;  
      } else if (Salario >= tabela[2] && Salario <= tabela[3] ) {
        Perc = 7.5;            
      } else if (Salario >= tabela[4] && Salario <= tabela[5] ) {
        Perc = 15.0;            
      } else if (Salario >= tabela[6] && Salario <= tabela[7] ) {
        Perc = 22.5;            
      } else if (Salario >= tabela[8] && Salario <= tabela[9] ) {
        Perc = 27.5;            
      }
      return Perc;    
    }
    
    public static double getDeducaoIRPFTabela(double Percentual){    
        double Valor = 0.0;  
        if (Percentual == 7.5) {
          Valor = 142.80;
        } else if (Percentual == 15.0) {
          Valor = 354.80;
        } else if (Percentual == 22.5) {
          Valor = 636.13;
        } else if (Percentual == 27.5) {
          Valor = 869.36;
        }
        return Valor;    
    }
    
    public static double getPercINSSTabela(double Salario){
      double Perc = 0.0;  
      double[] tabela = new double[6];  
      tabela[0] = 0.0;      tabela[1] = 1556.94; //8.0%
      tabela[2] = 1556.95;  tabela[3] = 2594.92; //9.0%
      tabela[4] = 2594.93;  tabela[5] = 999999.99; //11.0%
      if (Salario <= tabela[1] ) {
        Perc = 8.0;  
      } else if (Salario >= tabela[2] && Salario <= tabela[3] ) {
        Perc = 9.0;            
      } else if (Salario >= tabela[4] && Salario <= tabela[5] ) {
        Perc = 11.0;            
      }
      return Perc;    
    }   
    
    public String getEspaco(String Texto, int Qtde){
        String Espaco = "";
        int Tam = Qtde - Texto.length();
        for (int j = 0; j < Tam; j++) {
            Espaco += "&nbsp;";            
        }
        return Texto + Espaco;
    }
    
    public static double Arredonda(Double value, int scale) {
        BigDecimal bd1 = new BigDecimal(value);
        BigDecimal bd2 = bd1.setScale(scale, BigDecimal.ROUND_HALF_UP);    
        return bd2.doubleValue();
    }
    
    public static double ArredondaDuasCasas(Double value) {
        return Arredonda(value, 2);
    }
    
    public static double ArredondaTresCasas(Double value) {
        return Arredonda(value, 3);
    }
    
}
