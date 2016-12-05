package com.bean;

import static com.util.Constantes.*;
import static com.util.Funcoes.*;
import static com.util.Mensagem.*;
import javax.inject.Named;
import javax.enterprise.context.RequestScoped;

@Named(value = "salarioBean")
@RequestScoped
public class SalarioBean {
    private String tituloGeral = "Geral";    
    private String tituloProvento = "Proventos";
    private String tituloDesconto = "Descontos";
    private String tituloOutrosDesconto = "Outros descontos";    
    private final String titulo;
    private String funcionario;
    private int qtdeDependentes;    
    private double salarioBruto;
    private double salarioLiquido;    
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
    private double totalProventoGeral;
    private final double valorDeducaoDependente = 189.59;
    private double valorOutrosProventos1;
    private double valorOutrosProventos2;
    private double valorOutrosDescontos1;
    private double valorOutrosDescontos2;
    
    public SalarioBean() {
      this.titulo = "Programa de Cálculo de Salário".toUpperCase();
    }    

    public String getTituloGeral() {
        return tituloGeral;
    }

    public void setTituloGeral(String tituloGeral) {
        this.tituloGeral = tituloGeral;
    }

    public String getTituloProvento() {
        return tituloProvento;
    }

    public void setTituloProvento(String tituloProvento) {
        this.tituloProvento = tituloProvento;
    }

    public String getTituloDesconto() {
        return tituloDesconto;
    }

    public void setTituloDesconto(String tituloDesconto) {
        this.tituloDesconto = tituloDesconto;
    }

    public String getTituloOutrosDesconto() {
        return tituloOutrosDesconto;
    }

    public void setTituloOutrosDesconto(String tituloOutrosDesconto) {
        this.tituloOutrosDesconto = tituloOutrosDesconto;
    }
    
    public String getFuncionario() {
        return funcionario;
    }

    public void setFuncionario(String funcionario) {
        this.funcionario = funcionario;
    }

    public int getQtdeDependentes() {
        return qtdeDependentes;
    }

    public void setQtdeDependentes(int qtdeDependentes) {
        this.qtdeDependentes = qtdeDependentes;
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

    public double getTotalProventoGeral() {
        return totalProventoGeral;
    }

    public void setTotalProventoGeral(double totalProventoGeral) {
        this.totalProventoGeral = totalProventoGeral;
    }

    public double getValorOutrosProventos1() {
        return valorOutrosProventos1;
    }

    public void setValorOutrosProventos1(double valorOutrosProventos1) {
        this.valorOutrosProventos1 = valorOutrosProventos1;
    }

    public double getValorOutrosProventos2() {
        return valorOutrosProventos2;
    }

    public void setValorOutrosProventos2(double valorOutrosProventos2) {
        this.valorOutrosProventos2 = valorOutrosProventos2;
    }

    public double getValorOutrosDescontos1() {
        return valorOutrosDescontos1;
    }

    public void setValorOutrosDescontos1(double valorOutrosDescontos1) {
        this.valorOutrosDescontos1 = valorOutrosDescontos1;
    }

    public double getValorOutrosDescontos2() {
        return valorOutrosDescontos2;
    }

    public void setValorOutrosDescontos2(double valorOutrosDescontos2) {
        this.valorOutrosDescontos2 = valorOutrosDescontos2;
    }

    private void calculaDescontosINSS(){  
      this.salarioBaseINSS = this.salarioBruto + this.valorHoraExtra;      
      this.salarioBaseINSS = ArredondaDuasCasas(this.salarioBaseINSS);      
      this.percINSS = getPercINSSTabela(this.salarioBaseINSS);            
      this.valorDescINSS = this.salarioBaseINSS * (this.percINSS / 100);        
      this.valorDescINSS = ArredondaDuasCasas(this.valorDescINSS);
    }    
    
    private void calculaDescontosIRPF(){  
      double valorAbonoDep;
      valorAbonoDep = this.valorDeducaoDependente * this.qtdeDependentes;      
      valorAbonoDep = ArredondaDuasCasas(valorAbonoDep);
      
      this.salarioBaseIRPF = this.salarioBruto + this.valorHoraExtra - 
                             this.valorDescINSS - valorAbonoDep;
      this.salarioBaseIRPF = ArredondaDuasCasas(this.salarioBaseIRPF);
      
      this.percIRPF = getPercIRPFTabela(this.salarioBaseIRPF);                  
      
      this.valorDescIRPF = (this.salarioBaseIRPF * (this.percIRPF / 100)) - getDeducaoIRPFTabela(this.percIRPF); 
      this.valorDescIRPF = ArredondaDuasCasas(this.valorDescIRPF);
    }    
    
    private void calculaDescontosVA(){  
      this.valorDescVA = this.valorProventoVA * (this.percVA / 100);
      this.valorDescVA = ArredondaDuasCasas(this.valorDescVA);
    }
    
    private void calculaDescontosVR(){  
      this.valorDescVR = this.valorProventoVR * (this.percVR / 100);
      this.valorDescVR = ArredondaDuasCasas(this.valorDescVR);      
    }
    
    private void calculaDescontos(){
        calculaDescontosVA();  
        calculaDescontosVR();        
        calculaDescontosINSS();
        calculaDescontosIRPF();        
        this.totalDesconto = this.valorDescIRPF + this.valorDescINSS + 
                             this.valorDescVR + this.valorDescVA + 
                             this.valorDescPlanoSaude + this.valorDescOdonto +
                             this.valorFalta + this.valorOutrosDescontos1 + 
                             this.valorOutrosDescontos2;          
    }
    
    private void calculaProventos(){
        //Total Proventos
        this.totalProvento = this.salarioBruto + this.valorHoraExtra + 
                             this.valorOutrosProventos1 + this.valorOutrosProventos2;
        this.totalProvento = ArredondaDuasCasas(this.totalProvento);
        //Salario Liquido
        this.salarioLiquido = this.totalProvento - this.totalDesconto;
        this.salarioLiquido = ArredondaDuasCasas(this.salarioLiquido);
        //Total Proventos geral        
        this.totalProventoGeral = this.totalProvento + this.valorProventoVA + 
                                  this.valorProventoVR;
        this.totalProventoGeral = ArredondaDuasCasas(this.totalProventoGeral);                
    }   
    
    public void calculaFolha(){
      if (this.salarioBruto > 0.0){
        calculaDescontos();       
        calculaProventos();
      } else {
        MsgCalculoErro(validaSalarioBruto);          
      }  
    }
    
    public void limparDados(){
      //
    }

    public String getMensagemHTML(){
        String html = "";
        html = "<span class=\"badge badge-warning\"> MENSAGEM DE TESTE </span>";
        return html;
    }  

    public String getMsgSalarioBruto(){
        return validaSalarioBruto;
    }
    
}
