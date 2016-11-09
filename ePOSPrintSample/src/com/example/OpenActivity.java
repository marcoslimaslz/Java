package com.example;

import com.epson.eposprint.*;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.WindowManager.LayoutParams;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.ToggleButton;

public class OpenActivity extends Activity implements OnClickListener, StatusChangeEventListener, BatteryStatusChangeEventListener {   
    
	private final int SEND_TIMEOUT = 10 * 1000;
	
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.open);

        //init printer list
        Spinner spinner = (Spinner)findViewById(R.id.spinner_printer);
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        adapter.add(getString(R.string.printername_t20));
        adapter.add(getString(R.string.printername_m10));
        adapter.add(getString(R.string.printername_m30));
        adapter.add(getString(R.string.printername_p20));
        adapter.add(getString(R.string.printername_p60));
        adapter.add(getString(R.string.printername_p60ii));
        adapter.add(getString(R.string.printername_p80));
        adapter.add(getString(R.string.printername_t20ii));
        adapter.add(getString(R.string.printername_t70));
        adapter.add(getString(R.string.printername_t70ii));
        adapter.add(getString(R.string.printername_t81ii));
        adapter.add(getString(R.string.printername_t82));
        adapter.add(getString(R.string.printername_t82ii));
        adapter.add(getString(R.string.printername_t83ii));
        adapter.add(getString(R.string.printername_t88v));
        adapter.add(getString(R.string.printername_t90ii));
        adapter.add(getString(R.string.printername_u220));
        adapter.add(getString(R.string.printername_u330));
        spinner.setAdapter(adapter);

        //init language list
        spinner = (Spinner)findViewById(R.id.spinner_language);
        adapter = new ArrayAdapter<String>(this, android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        adapter.add(getString(R.string.model_ank));
        adapter.add(getString(R.string.model_japanese));
        adapter.add(getString(R.string.model_chinese));
        adapter.add(getString(R.string.model_taiwan));
        adapter.add(getString(R.string.model_korean));
        adapter.add(getString(R.string.model_thai));
        adapter.add(getString(R.string.model_southasia));
        spinner.setAdapter(adapter);
        
        //select default radiobutton
        RadioGroup radio = (RadioGroup)findViewById(R.id.radiogroup_devtype);
        Intent intent = getIntent();
        switch(intent.getIntExtra("devtype", 0)){
        case Print.DEVTYPE_TCP:
            radio.check(R.id.radioButton_tcp);
            break;
        case Print.DEVTYPE_BLUETOOTH:
            radio.check(R.id.radioButton_bluetooth);
            break;
        case Print.DEVTYPE_USB:
            radio.check(R.id.radioButton_usb);
            break;
        default:
            radio.check(R.id.radioButton_tcp);
            break;
        }
        
        //init edit
        TextView textIp = (TextView)findViewById(R.id.editText_ip);
        //textIp.setText(intent.getStringExtra("ipaddress"));
        textIp.setText("10.0.0.250");
        TextView textInterval = (TextView)findViewById(R.id.editText_interval);
        textInterval.setText("1000");

        //Registration ClickListener
        Button button = (Button)findViewById(R.id.button_open);
        button.setOnClickListener(this);

        //hide keyboard
        this.getWindow().setSoftInputMode(LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN);
    }
    
    @Override
    public void onClick(View v) {
    	
     	/*
     	System.out.println(">> Antes de conectar.");    	
    	openPrinter2();
     	System.out.println(">> Antes de imprimir.");
    	printText();
     	System.out.println(">> Antes de cortar.");
    	cut();
    	*/    	
    	
        openPrinter();
    }
    
    private void openPrinter() {
        //get open parameter
        TextView textIp = (TextView)findViewById(R.id.editText_ip);
        if(textIp.getText().toString().isEmpty()){
            ShowMsg.showError(R.string.errmsg_noaddress, this);
            return ;
        }
        
        int deviceType = Print.DEVTYPE_TCP;
        RadioGroup radioGroup = (RadioGroup)findViewById(R.id.radiogroup_devtype);
        switch(radioGroup.getCheckedRadioButtonId()){
        case R.id.radioButton_tcp:
            deviceType = Print.DEVTYPE_TCP;
            break;
        case R.id.radioButton_bluetooth:
            deviceType = Print.DEVTYPE_BLUETOOTH;
            break;
        case R.id.radioButton_usb:
            deviceType = Print.DEVTYPE_USB;
            break;
        default:
            deviceType = Print.DEVTYPE_TCP;
            break;
        }

        int enabled = Print.FALSE;
        ToggleButton toggleStatusMonitor = (ToggleButton)findViewById(R.id.toggleButton_statusmonitor);
        if (toggleStatusMonitor.isChecked()) {
        	enabled = Print.TRUE;
        }
        else {
        	enabled = Print.FALSE;
        }
        
        int interval = 0;
        TextView textInterval = (TextView)findViewById(R.id.editText_interval);
        if(!(textInterval.getText().toString().isEmpty())){
            interval =  Integer.parseInt(textInterval.getText().toString());
        }
        
        //open
        Print printer = new Print(getApplicationContext());
        
        if(printer != null){
        	printer.setStatusChangeEventCallback(this);
            printer.setBatteryStatusChangeEventCallback(this);        	
        }
        
       
        try{
            printer.openPrinter(deviceType, textIp.getText().toString(), enabled, interval);                     
        }catch(Exception e){
            printer = null;
            ShowMsg.showException(e, "openPrinter" , this);
            return;
        }
        
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        System.out.println(">> "+textIp.getText().toString());
        System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
        
        //return settings
        Intent intent = new Intent();
        intent.putExtra("devtype", deviceType);
        intent.putExtra("ipaddress", textIp.getText().toString());       
        
        Spinner spinner = (Spinner)findViewById(R.id.spinner_printer);
        intent.putExtra("printername", (String)spinner.getSelectedItem());

        spinner = (Spinner)findViewById(R.id.spinner_language);
        switch(spinner.getSelectedItemPosition()){
        case 1:
            intent.putExtra("language", Builder.MODEL_JAPANESE);
            break;
        case 2:
            intent.putExtra("language", Builder.MODEL_CHINESE);
            break;
        case 3:
            intent.putExtra("language", Builder.MODEL_TAIWAN);
            break;
        case 4:
            intent.putExtra("language", Builder.MODEL_KOREAN);
            break;
        case 5:
            intent.putExtra("language", Builder.MODEL_THAI);
            break;
        case 6:
            intent.putExtra("language", Builder.MODEL_SOUTHASIA);
            break;
        case 0:
        default:
            intent.putExtra("language", Builder.MODEL_ANK);
            break;
        }
        
        //return main activity
        EPOSPrintSampleActivity.setPrinter(printer);
        setResult(2, intent);
        finish();
    }
    
    private void openPrinter2() {       
        int deviceType = Print.DEVTYPE_TCP;
        int enabled = Print.FALSE;
        int interval = 0;
        TextView textInterval = (TextView)findViewById(R.id.editText_interval);
        if(!(textInterval.getText().toString().isEmpty())){
            interval =  Integer.parseInt(textInterval.getText().toString());
        }
        
        //open
        Print printer = new Print(getApplicationContext());
        
        if(printer != null){
        	printer.setStatusChangeEventCallback(this);
            printer.setBatteryStatusChangeEventCallback(this);        	
        }        
       
        try{
            System.out.println("deviceType: " + deviceType);
            System.out.println("IP: " + "10.0.0.250");
            System.out.println("enabled: : " + enabled);
            System.out.println("interval: " + interval);
            
        	printer.openPrinter(deviceType, "10.0.0.250", enabled, interval);                    
            
        }catch(Exception e){
            printer = null;
            ShowMsg.showException(e, "openPrinter" , this);
            return;
        }   
        
        EPOSPrintSampleActivity.setPrinter(printer);
        finish();                                          
    }
         
	private void printText(){               
        Builder builder = null;
        String method = "";        
        
        try{
            //create builder
            method = "Builder";
            builder = new Builder("TM-T20", 0, getApplicationContext());
            
            //add command
            method = "addTextFont";
            builder.addTextFont(Builder.FONT_A);           
         	
            method = "addTextAlign";
            builder.addTextAlign(Builder.ALIGN_LEFT);           
         	
            method = "addTextLineSpace";
            builder.addTextLineSpace(getBuilderLineSpace());           
         	
            method = "addTextLang";
            builder.addTextLang(Builder.LANG_EN);           
         	
            // Se descomentar dá erro
            //method = "addTextSize";
            //builder.addTextSize(getBuilderSizeW(), getBuilderSizeH());           
         	
            method = "addTextStyle";
            builder.addTextStyle(Builder.FALSE, Builder.FALSE, Builder.FALSE, Builder.COLOR_1);
                     	
            method = "addTextPosition";
            builder.addTextPosition(getBuilderXPosition());            
         	           		
            method = "addText";
            builder.addText("\n+---------------------------------------+");
            builder.addText("\n|            NOX AUTOMAÇÃO              |");
            builder.addText("\n|       CNPJ: 021.654.987-0001/54       |");            
            builder.addText("\n|    Endereço: R. Bruno Filgeira, XXX   |");            
            builder.addText("\n|          Fone: (41) 3240-3000         |");            
            builder.addText("\n+---------------------------------------+");
            builder.addText("\n| Item 0111 R$  1,00 x 01 UN = R$  1,00 |");
            builder.addText("\n| Item 0222 R$  2,00 x 01 UN = R$  2,00 |");
            builder.addText("\n| Item 0333 R$  3,00 x 01 UN = R$  3,00 |");
            builder.addText("\n| Item 0444 R$  4,00 x 01 UN = R$  4,00 |");
            builder.addText("\n| Item 0555 R$  5,00 x 01 UN = R$  5,00 |");            
            builder.addText("\n| Item 0666 R$  6,00 x 01 UN = R$  6,00 |");
            builder.addText("\n| Item 0777 R$  7,00 x 01 UN = R$  7,00 |");
            builder.addText("\n| Item 0888 R$  8,00 x 01 UN = R$  8,00 |");
            builder.addText("\n| Item 0999 R$  9,00 x 01 UN = R$  9,00 |");
            builder.addText("\n| Item 1010 R$ 10,00 x 01 UN = R$ 10,00 |");            
            builder.addText("\n+---------------------------------------+");
            builder.addText("\n| Subtotal ................... R$ 55,00 |");
            builder.addText("\n| Desconto .................... R$ 2,00 |");            
            builder.addText("\n| Acréscimo ................... R$ 0,00 |");                       
            builder.addText("\n| Total ...................... R$ 53,00 |");
            builder.addText("\n+---------------------------------------+");            
            builder.addText("\n by Marcos Lima ");
           
            method = "addFeedUnit";
            builder.addFeedUnit(getBuilderFeedUnit());
         	
            //send builder data
            int[] status = new int[1];
            int[] battery = new int[1];           
         	
            try{
                Print printer = EPOSPrintSampleActivity.getPrinter();
               // Print printer = new Print(getApplicationContext());               
                printer.sendData(builder, SEND_TIMEOUT, status, battery);                
                ShowMsg.showStatus(EposException.SUCCESS, status[0], battery[0], this);                
            }catch(EposException e){
                ShowMsg.showStatus(e.getErrorStatus(), e.getPrinterStatus(), e.getBatteryStatus(), this);
            }
        }catch(Exception e){
            ShowMsg.showException(e, method, this);
        }
        
        //remove builder
        if(builder != null){
            try{
                builder.clearCommandBuffer();
                builder = null;
            }catch(Exception e){
                builder = null;
            }
        }
    }
    
    
    private void cut(){
        Builder builder = null;
        String method = "";
        try{
            //create builder
            method = "Builder";
            builder = new Builder("TM-T20", 0, getApplicationContext());
            
            //add command
            method = "addCut";
            builder.addCut(Builder.CUT_FEED);

            //send builder data
            int[] status = new int[1];
            int[] battery = new int[1];
            try{
                Print printer = EPOSPrintSampleActivity.getPrinter();
                printer.sendData(builder, SEND_TIMEOUT, status, battery);
                ShowMsg.showStatus(EposException.SUCCESS, status[0], battery[0], this);
            }catch(EposException e){
                ShowMsg.showStatus(e.getErrorStatus(), e.getPrinterStatus(), e.getBatteryStatus(), this);
            }
        }catch(Exception e){
            ShowMsg.showException(e, method, this);
        }
        
        //remove builder
        if(builder != null){
            try{
                builder.clearCommandBuffer();
                builder = null;
            }catch(Exception e){
                builder = null;
            }
        }
    }    
    
    private int getBuilderFeedUnit() {
        TextView text = (TextView)findViewById(R.id.editText_feedunit);
        try{
            return Integer.parseInt(text.getText().toString());
        }catch(Exception e){
            return 0;
        }
    }
        
    private int getBuilderXPosition() {
        TextView text = (TextView)findViewById(R.id.editText_xposition);
        try{
            return Integer.parseInt(text.getText().toString());
        }catch(Exception e){
            return 0;
        }
    }
    
    private int getBuilderLineSpace() {
        TextView text = (TextView)findViewById(R.id.editText_linespace);
        try{
            return Integer.parseInt(text.getText().toString());
        }catch(Exception e){
            return 0;
        }
    }   
    
    @Override
	public void onStatusChangeEvent(final String deviceName, final int status) {
    	;
	}

	@Override
	public void onBatteryStatusChangeEvent(final String deviceName, final int battery) {
		;
	}
}
