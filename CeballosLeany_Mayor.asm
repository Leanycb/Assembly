.data
    saludo: .asciiz "\n Buenos dias \n"
    descripcion: .asciiz "\n Indique 4 numeros que desee comparar: \n"
    num1: .space 100 
    num2: .space 100
    num3: .space 100
    salto: .asciiz "\n"
    mayor: .asciiz "El numero mayor es: "
  
.text
    main:
        # Imprimir saludo
        li $v0, 4                
        la $a0, saludo           
        syscall                  

        # Imprimir descripcion
        li $v0, 4                
        la $a0, descripcion      
        syscall     
        
        # salto de línea
        li $v0, 4                
        la $a0, salto          
        syscall   
        
        # solicitar número 1
        li $v0, 4                
        la $a0, num1      
        syscall                  

        li $v0, 5                
        syscall                  
        move $t0, $v0            

        # salto de línea
        li $v0, 4                
        la $a0, salto          
        syscall   
        
        # solicitar número 2
        li $v0, 4                
        la $a0, num1      
        syscall                  

        li $v0, 5                
        syscall                  
        move $t1, $v0            

        # salto de línea
        li $v0, 4                
        la $a0, salto         
        syscall   
        
        # solicitar número 3
        li $v0, 4                
        la $a0, num1      
        syscall                  

        li $v0, 5                
        syscall                  
        move $t2, $v0            

        # salto de línea
        li $v0, 4                
        la $a0, salto         
        syscall            
         
        # Comparar $t0 y $t1 y luego $t0 y $t2
        # Comparar $t0 y $t1
        bge $t0, $t1, check   
        move $t0, $t1            
   check:
        # Comparar $t0 y $t2
        bge $t0, $t2, print 
        move $t0, $t2            
          
    print:     
        # Imprimir resultado
        li $v0, 4                
        la $a0, mayor        
        syscall                  

        li $v0, 1                
        move $a0, $t0            
        syscall                  

        # Imprimir salto de línea
        li $v0, 4                
        la $a0, salto          
        syscall                       
                    
                                            
        # Salir del programa
        li $v0, 10               
        syscall                  
