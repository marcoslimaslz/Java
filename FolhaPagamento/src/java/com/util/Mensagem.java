package com.util;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

public class Mensagem {
    public static void ShowMessage(String Titulo, String Detalhe){
      FacesMessage mensagem = new FacesMessage(Titulo, Detalhe);
      FacesContext.getCurrentInstance().addMessage(null, mensagem);     
    }
    
    public static void MsgLimpezaOK(){
      ShowMessage("[Informação] ", "Dados limpos!");
    }    
    
    public static void MsgCalculoOk(){
      ShowMessage("[Informação] ", "Calculo realizado com sucesso!");
    }      
    
    public static void MsgCalculoErro(String Detalhe){
      ShowMessage("[Erro de validação] ", Detalhe);
    }      
    
}
