package com.bean;

import com.Pessoa;
import static com.util.Mensagem.*;
import javax.inject.Named;
import javax.enterprise.context.RequestScoped;

@Named(value = "salarioBean")
@RequestScoped
public class SalarioBean {
    
    private final String titulo;
    
    private Pessoa pessoa;        
    private double salarioBruto;
    private double salarioLiquido;    
    private double salarioLiquidoVirtual; //Salário + VA + VR      
    private double salarioBaseINSS;        
    private double salarioBaseIRPF;            
    private double salarioBaseFGTS;  
    private double valorProventoVR;
    private double valorProventoVA;    
    private double percIRPF;    
    private double percINSS;
    private double percVR;
    private double percVA;    
    private double valorDescIRPF;    
    private double valorDescINSS;
    private double valorDescVR;
    private double valorDescVA;
    private double valorDescPlanoSaude;            
    private double valorDescOdonto;            
    private double valorHoraExtra;
    private double valorFalta;    
    private double totalDesconto;    
    private double totalProvento;  
    
    public SalarioBean() {
      this.titulo = "Programa de Cálculo de Salário".toUpperCase();
    }    

    public String getTitulo() {
        return titulo;
    }
    
    public double getSalarioBruto() {
        return salarioBruto;
    }

    public void setSalarioBruto(double salarioBruto) {
        this.salarioBruto = salarioBruto;
    }

    public double getSalarioLiquido() {
        return salarioLiquido;
    }

    public void setSalarioLiquido(double salarioLiquido) {
        this.salarioLiquido = salarioLiquido;
    }

    public double getSalarioLiquidoVirtual() {
        return salarioLiquidoVirtual;
    }

    public void setSalarioLiquidoVirtual(double salarioLiquidoVirtual) {
        this.salarioLiquidoVirtual = salarioLiquidoVirtual;
    }

    
    
    public double getSalarioBaseINSS() {
        return salarioBaseINSS;
    }

    public void setSalarioBaseINSS(double salarioBaseINSS) {
        this.salarioBaseINSS = salarioBaseINSS;
    }

    public double getSalarioBaseIRPF() {
        return salarioBaseIRPF;
    }

    public void setSalarioBaseIRPF(double salarioBaseIRPF) {
        this.salarioBaseIRPF = salarioBaseIRPF;
    }

    public double getSalarioBaseFGTS() {
        return salarioBaseFGTS;
    }

    public void setSalarioBaseFGTS(double salarioBaseFGTS) {
        this.salarioBaseFGTS = salarioBaseFGTS;
    }

    public double getValorProventoVR() {
        return valorProventoVR;
    }

    public void setValorProventoVR(double valorProventoVR) {
        this.valorProventoVR = valorProventoVR;
    }

    public double getValorProventoVA() {
        return valorProventoVA;
    }

    public void setValorProventoVA(double valorProventoVA) {
        this.valorProventoVA = valorProventoVA;
    }
    
    public double getPercIRPF() {
        return percIRPF;
    }

    public void setPercIRPF(double percIRPF) {
        this.percIRPF = percIRPF;
    }

    public double getPercINSS() {
        return percINSS;
    }

    public void setPercINSS(double percINSS) {
        this.percINSS = percINSS;
    }

    public double getPercVR() {
        return percVR;
    }

    public void setPercVR(double percVR) {
        this.percVR = percVR;
    }

    public double getPercVA() {
        return percVA;
    }

    public void setPercVA(double percVA) {
        this.percVA = percVA;
    }

    public double getValorDescIRPF() {
        return valorDescIRPF;
    }

    public void setValorDescIRPF(double valorDescIRPF) {
        this.valorDescIRPF = valorDescIRPF;
    }

    public double getValorDescINSS() {
        return valorDescINSS;
    }

    public void setValorDescINSS(double valorDescINSS) {
        this.valorDescINSS = valorDescINSS;
    }

    public double getValorDescVR() {
        return valorDescVR;
    }

    public void setValorDescVR(double valorDescVR) {
        this.valorDescVR = valorDescVR;
    }

    public double getValorDescVA() {
        return valorDescVA;
    }

    public void setValorDescVA(double valorDescVA) {
        this.valorDescVA = valorDescVA;
    }

    public double getValorDescPlanoSaude() {
        return valorDescPlanoSaude;
    }

    public void setValorDescPlanoSaude(double valorDescPlanoSaude) {
        this.valorDescPlanoSaude = valorDescPlanoSaude;
    }

    public double getValorDescOdonto() {
        return valorDescOdonto;
    }

    public void setValorDescOdonto(double valorDescOdonto) {
        this.valorDescOdonto = valorDescOdonto;
    }

    public double getValorHoraExtra() {
        return valorHoraExtra;
    }

    public void setValorHoraExtra(double valorHoraExtra) {
        this.valorHoraExtra = valorHoraExtra;
    }

    public double getValorFalta() {
        return valorFalta;
    }

    public void setValorFalta(double valorFalta) {
        this.valorFalta = valorFalta;
    }
    
    public double getTotalDesconto() {
        return totalDesconto;
    }

    public void setTotalDesconto(double totalDesconto) {
        this.totalDesconto = totalDesconto;
    }

    public double getTotalProvento() {
        return totalProvento;
    }

    public void setTotalProvento(double totalProvento) {
        this.totalProvento = totalProvento;
    }

    public Pessoa getPessoa() {
        return pessoa;
    }

    public void setPessoa(Pessoa pessoa) {
        this.pessoa = pessoa;
    }

    private double getPercINSSTabela(double Salario){
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

    private double getPercIRPFTabela(double Salario){
      double Perc = 0.0;  
      double[] tabela = new double[6];  
      tabela[0] = 0.0;      tabela[1] = 1903.98; //0.0%
      tabela[2] = 1903.99;  tabela[3] = 2826.65; //7.5% - R$ 142,80
      tabela[4] = 2826.66;  tabela[5] = 3751.05; //15.0% - R$ 354,80
      tabela[6] = 3751.06;  tabela[7] = 4664.68; //22.5% - R$ 636,13
      tabela[8] = 4664.68;  tabela[9] = 99999.99; //27.5% - R$ 869,36
      if (Salario <= tabela[1] ) {
        Perc = 7.5;  
      } else if (Salario >= tabela[2] && Salario <= tabela[3] ) {
        Perc = 15.0;            
      } else if (Salario >= tabela[4] && Salario <= tabela[5] ) {
        Perc = 22.5;            
      } else if (Salario >= tabela[6] && Salario <= tabela[7] ) {
        Perc = 27.5;            
      }
      return Perc;    
    }
    
    private double getValorAbonoDependentes(){
        return 0.0 * pessoa.getQtdeDependentes();
    }
    
    private void calculaDescontosINSS(){  
      this.salarioBaseINSS = this.salarioBruto + this.valorHoraExtra;      
      this.percINSS = getPercINSSTabela(this.salarioBaseINSS);            
      this.valorDescINSS = this.salarioBaseINSS * (this.percINSS / 100);        
    }    
    
    private void calculaDescontosIRPF(){  
      this.salarioBaseIRPF = this.salarioBruto + this.valorHoraExtra - 
                             this.valorDescINSS - getValorAbonoDependentes();      
      //this.percIRPF = getPercIRPFTabela(this.salarioBaseIRPF);                  
      this.valorDescIRPF = this.salarioBaseIRPF * (this.percIRPF / 100);      
    }    
    
    private void calculaDescontos(){  
      calculaDescontosINSS();
      calculaDescontosIRPF();
      //VA
      this.valorDescVA = this.valorProventoVA * (this.percVA / 100);
      //VR
      this.valorDescVR = this.valorProventoVR * (this.percVR / 100);
    }
    
    public void calculaFolha(){
      calculaDescontos();      
      this.totalDesconto = this.valorDescIRPF + this.valorDescINSS + 
                  this.valorDescVR + this.valorDescVA + 
                  this.valorDescPlanoSaude + this.valorDescOdonto +
                  this.valorFalta;         
      this.totalProvento = this.valorHoraExtra;
      this.salarioLiquido = this.salarioBruto - this.totalDesconto + this.totalProvento;
      this.salarioLiquidoVirtual = this.salarioLiquido + 
                                   this.valorProventoVA + 
                                   this.valorProventoVR;
      
      MsgCalculoOk();
    }
    
    public void limparDados(){
        MsgLimpezaOK();
    }
    
}
