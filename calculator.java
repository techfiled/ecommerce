package calculator;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

import javax.swing.*;
 


public class calculator implements  ActionListener {
	
	JFrame frame;
	JPanel panel;
	JButton b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,B15;
	GridBagLayout gb;
	GridBagConstraints gbc;
	JLabel label;
	JLabel usertext;
	
	String currentText = "0";
	String firstOperand = "";
	String currentOperation = "";
	boolean isNewNumber = true;
	
	 public calculator()
	 {
		 
		JFrame frame=new JFrame("calculator");
		JPanel panel=new JPanel();
		
		label=new JLabel();
		usertext=new JLabel("0"); 
		
		
		JButton b1=new JButton("1");
		JButton b2=new JButton("2");
		JButton b3=new JButton("3");
		
		JButton b4=new JButton("/");
		
		JButton b5=new JButton("4");
		JButton b6=new JButton("5");
		JButton b7=new JButton("6");
		JButton b8=new JButton("+");
		JButton b9=new JButton("7");
		JButton b10=new JButton("8");
		JButton b11=new JButton("9");
		JButton b12=new JButton("-");
		JButton b13=new JButton("*");
		JButton b14=new JButton("0");
		JButton b15=new JButton("=");
		
		b1.setBackground(new Color(102,178,255));
		b2.setBackground(new Color(102,178,255));
		b3.setBackground(new Color(102,178,255));
		b4.setBackground((new Color(204,204,255)));
		b5.setBackground(new Color(102,178,255));
		b6.setBackground(new Color(102,178,255));
		b7.setBackground(new Color(102,178,255));
		b8.setBackground((new Color(204,204,255)));
		b9.setBackground(new Color(102,178,255));
		b10.setBackground(new Color(102,178,255));
		b11.setBackground(new Color(102,178,255));
		b12.setBackground((new Color(204,204,255)));
		b13.setBackground((new Color(204,204,255)));
		b14.setBackground(new Color(102,178,255));
		b15.setBackground((new Color(204,204,255)));
		gbc=new GridBagConstraints();
		gb=new GridBagLayout();
		panel.setLayout(gb);
		frame.add(panel);
//		panel.add(label);
//		label.add(passtext);
		
		  Font boldItalicFont = new Font("Arial", Font.BOLD | Font.ITALIC, 50);
		b1.addActionListener(this);
		b2.addActionListener(this);
		  b3.addActionListener(this);
	        b4.addActionListener(this);
	        b5.addActionListener(this);
	        b6.addActionListener(this);
	        b7.addActionListener(this);
	        b8.addActionListener(this);
	        b9.addActionListener(this);
	        b10.addActionListener(this);
	        b11.addActionListener(this);
	        b12.addActionListener(this);
	        b13.addActionListener(this);
	        b14.addActionListener(this);
	        b15.addActionListener(this);
		
	        
	       
		gbc.insets=new Insets(2, 2, 10, 10);
	 	gbc.ipadx=60;
		gbc.ipady=40;
		 
		gbc.gridx=3;
		gbc.gridy=0;	
	
		 
		panel.add(usertext,gbc);
		
		//button 
		gbc.gridx=0;
		gbc.gridy=1;
		 
		panel.add(b1,gbc);
		
		gbc.gridx=1;
		gbc.gridy=1;
		panel.add(b2,gbc);
		
		gbc.gridx=2;
		gbc.gridy=1;
		panel.add(b3,gbc);
		
		gbc.gridx=3;
		gbc.gridy=1;
		panel.add(b4,gbc);
	
		//2
		gbc.gridx=0;
		gbc.gridy=2;
		
		gbc.fill = GridBagConstraints.HORIZONTAL;
		gbc.gridwidth=1;
		panel.add(b5,gbc);
		
		gbc.gridx=1;
		gbc.gridy=2;
	 
		panel.add(b6,gbc);
		
		gbc.gridx=2;
		gbc.gridy=2;
		  
		panel.add(b7,gbc);
		
		gbc.gridx=3;
		gbc.gridy=2;
	 
		panel.add(b8,gbc);
		
		gbc.gridx=0;
		gbc.gridy=3;
		  
		panel.add(b9,gbc);
		
		gbc.gridx=1;
		gbc.gridy=3;
	   
		panel.add(b10,gbc);
		
		gbc.gridx=2;
		gbc.gridy=3;
		 
		panel.add(b11,gbc);
		
		gbc.gridx=3;
		gbc.gridy=3;
		   
		panel.add(b12,gbc);
		
		
		gbc.gridx=0;
		gbc.gridy=4;
	 
		panel.add(b13,gbc);
		
		gbc.gridx=1;
		gbc.gridy=4;
	 
		panel.add(b14,gbc);
		
		gbc.gridx=2;
		gbc.gridy=4;
		gbc.gridwidth=2;
		panel.add(b15,gbc);
		
		frame.setSize(500,500);
		frame.setVisible(true);
		frame.setLocationRelativeTo(null);
		
	}
	
	public static void main(String arg[]) {
		
		new calculator();
	}

 

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
	 
	       JButton source = (JButton) e.getSource();
	        String buttonText = source.getText();
	 if (buttonText.matches("[0-9]")) {
         // Handle numeric buttons
         if (isNewNumber) {
             usertext.setText(buttonText);
             
             isNewNumber = false;
         } else {
             usertext.setText(usertext.getText() + buttonText);
            
             
         }
     } else if (buttonText.equals("+") || buttonText.equals("-") || buttonText.equals("*") || buttonText.equals("/")) {
         // Handle operator buttons
         firstOperand = usertext.getText();
         
         System.out.println("first : "+  firstOperand);
         
         currentOperation = buttonText;
         System.out.println(" operator :"+  currentOperation);
         isNewNumber = true;
     } else if (buttonText.equals("=")) {
         // Handle equals button
         if (!isNewNumber) {
             String secondOperand = usertext.getText();
             System.out.println("SECOND : "+   secondOperand);
             double result = calculateResult(Double.parseDouble(firstOperand), Double.parseDouble(secondOperand), currentOperation);
             usertext.setText(String.valueOf(result));
             System.out.println("result : "+   result); 
             isNewNumber = true;
         }
      }
}
	  private double calculateResult(double firstOperand, double secondOperand, String operation) {
	        switch (operation) {
	            case "+":
	                return firstOperand + secondOperand;
	            case "-":
	                return firstOperand - secondOperand;
	            case "*":
	                return firstOperand * secondOperand;
	            case "/":
	                if (secondOperand != 0) {
	                    return firstOperand / secondOperand;
	                } else {
	                    // Division by zero error handling (not implemented here)
	                    return 0;
	                }
	            default:
	                return 0;
	        }
	    }

	 
}
