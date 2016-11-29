package com;

import java.math.BigDecimal;

public class BigDemicalDemo {

  public static double Arredonda(Double value, int scale) {
    BigDecimal bd1 = new BigDecimal(value);
    BigDecimal bd2 = bd1.setScale(scale, BigDecimal.ROUND_HALF_UP);    
    return bd2.doubleValue();
  }
  
  public static void main(String args[]) {
    System.out.println(Arredonda(1.6672, 2));
  }
}
