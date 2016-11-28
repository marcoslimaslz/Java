package com.bean;

import static com.util.Mensagem.*;
import javax.inject.Named;
import javax.enterprise.context.RequestScoped;

@Named(value = "calculoBean")
@RequestScoped
public class CalculoBean {
    /* Nomenclaturas e Siglas
       -> DF = Domingo e Feriado Fator 100%
       -> Normal =  Fator 50%
       -> Noite = Fator 70%    
    */
    private final double Fator50;
    private final double Fator70;
    private final double Fator100;    
    
    private double salarioBruto;
    private double cargaHorariaMensal;
    private double valorHoraNormal;
    private double valorHoraNoite;
    private double valorHoraDF; 
    private double qtdeHorasTrabalhadaNormal; 
    private double qtdeHorasTrabalhadaNoite; 
    private double qtdeHorasTrabalhadaDF; 
    private double subTotalNormal;
    private double subTotalNoite;
    private double subTotalDF; 
    private double valorTotal;   
    
    public CalculoBean() {
        cargaHorariaMensal = 200.00;        
        this.Fator50 = 0.50;
        this.Fator70 = 0.70;
        this.Fator100 = 1.0;
    }

    public double getSalarioBruto() {
        return salarioBruto;
    }

    public void setSalarioBruto(double salarioBruto) {
        this.salarioBruto = salarioBruto;
    }

    public double getCargaHorariaMensal() {
        return cargaHorariaMensal;
    }

    public void setCargaHorariaMensal(double cargaHorariaMensal) {
        this.cargaHorariaMensal = cargaHorariaMensal;
    }

    public double getValorHoraNormal() {
        return valorHoraNormal;
    }

    public void setValorHoraNormal(double valorHoraNormal) {
        this.valorHoraNormal = valorHoraNormal;
    }

    public double getValorHoraNoite() {
        return valorHoraNoite;
    }

    public void setValorHoraNoite(double valorHoraNoite) {
        this.valorHoraNoite = valorHoraNoite;
    }

    public double getValorHoraDF() {
        return valorHoraDF;
    }

    public void setValorHoraDF(double valorHoraDF) {
        this.valorHoraDF = valorHoraDF;
    }

    public double getQtdeHorasTrabalhadaNormal() {
        return qtdeHorasTrabalhadaNormal;
    }

    public void setQtdeHorasTrabalhadaNormal(double qtdeHorasTrabalhadaNormal) {
        this.qtdeHorasTrabalhadaNormal = qtdeHorasTrabalhadaNormal;
    }

    public double getQtdeHorasTrabalhadaNoite() {
        return qtdeHorasTrabalhadaNoite;
    }

    public void setQtdeHorasTrabalhadaNoite(double qtdeHorasTrabalhadaNoite) {
        this.qtdeHorasTrabalhadaNoite = qtdeHorasTrabalhadaNoite;
    }

    public double getQtdeHorasTrabalhadaDF() {
        return qtdeHorasTrabalhadaDF;
    }

    public void setQtdeHorasTrabalhadaDF(double qtdeHorasTrabalhadaDF) {
        this.qtdeHorasTrabalhadaDF = qtdeHorasTrabalhadaDF;
    }

    public double getSubTotalNormal() {
        return subTotalNormal;
    }

    public void setSubTotalNormal(double subTotalNormal) {
        this.subTotalNormal = subTotalNormal;
    }

    public double getSubTotalNoite() {
        return subTotalNoite;
    }

    public void setSubTotalNoite(double subTotalNoite) {
        this.subTotalNoite = subTotalNoite;
    }

    public double getSubTotalDF() {
        return subTotalDF;
    }

    public void setSubTotalDF(double subTotalDF) {
        this.subTotalDF = subTotalDF;
    }

    public double getValorTotal() {
        return valorTotal;
    }

    public void setValorTotal(double valorTotal) {
        this.valorTotal = valorTotal;
    }

    public void calcularValorHE() {        
      double vlrHora;     
      vlrHora = (this.salarioBruto / this.cargaHorariaMensal);
      if (Double.isNaN(vlrHora)){
        vlrHora = 0.0;
      }
      this.valorHoraNormal = vlrHora + (vlrHora * 0.5);      
      this.valorHoraNoite = vlrHora + (vlrHora * 0.7);      
      this.valorHoraDF = vlrHora + (vlrHora * 1.0);            
    }   
    
    public void calcularSalario() {
      boolean continua = true;
      calcularValorHE();
      if (this.salarioBruto == 0.0){
        ShowMessage("Informe o salário bruto!");
        continua = false;
      } else if (this.cargaHorariaMensal == 0.0){
          ShowMessage("Informe a carga horária!");
          continua = false;
      } else if (this.qtdeHorasTrabalhadaNormal == 0.0 || 
                 this.qtdeHorasTrabalhadaNoite == 0.0 || 
                 this.qtdeHorasTrabalhadaDF == 0.0){
          ShowMessage("Informe pelo menos uma hora extra (normal, noite ou domingo/feriado!");
          continua = false;
      }      
      if (continua){
        this.subTotalNormal = this.valorHoraNormal * this.qtdeHorasTrabalhadaNormal;
        this.subTotalNoite = this.valorHoraNoite * this.qtdeHorasTrabalhadaNoite;
        this.subTotalDF = this.valorHoraDF * this.qtdeHorasTrabalhadaDF;
        this.valorTotal = this.subTotalNormal + this.subTotalNoite + this.subTotalDF;     
        MsgCalculoOk();                      
      }
    }
    
    public void LimparDados() {
      this.salarioBruto = 0.0;
      this.cargaHorariaMensal = 0.0;
      this.qtdeHorasTrabalhadaNormal = 0.0;
      this.qtdeHorasTrabalhadaNoite = 0.0;
      this.qtdeHorasTrabalhadaDF = 0.0;
      
      MsgLimpezaOK();
    }    
    
}
