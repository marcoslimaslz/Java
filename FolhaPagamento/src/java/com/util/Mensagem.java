package com.util;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

public class Mensagem {
    public static void ShowMessage(String Titulo){
      FacesMessage mensagem = new FacesMessage(Titulo);
      FacesContext.getCurrentInstance().addMessage(null, mensagem);     
    }
    
    public static void MsgLimpezaOK(){
      ShowMessage("Dados limpos!");
    }    
    
    public static void MsgCalculoOk(){
      ShowMessage("Calculo realizado com sucesso!");
    }      
    
}
