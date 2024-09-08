.data
    saludo: .asciiz "\n Serie Fibonacci \n"
    descripcion: .asciiz "\n Indique el número hasta el cual desea generar la serie: "
    salto: .asciiz "\n"
    fibonacci: .asciiz "La serie Fibonacci es: "
    Espacio: .asciiz " "
    sumat: .asciiz "\n La suma de los números de la serie es: "
    
.text
    main:
       # Imprimir saludo
        li $v0, 4                
        la $a0, saludo           
        syscall                  

        # Solicitar el número
        li $v0, 4                
        la $a0, descripcion           
        syscall                  

        li $v0, 5                
        syscall                  
        move $t0, $v0           

        #salto
        li $v0, 4                
        la $a0, salto         
        syscall                  

        # Imprimir mensaje de la serie Fibonacci
        li $v0, 4                
        la $a0, fibonacci          
        syscall                 

        # Inicializar variables
        li $t1, 0                
        li $t2, 1                
        li $t4, 0                
        li $t5, 0                

        # Imprimir primer número de Fibonacci (0)
        li $v0, 1                
        move $a0, $t1            
        syscall                  

        # Sumar el primer número (0) al acumulador
        add $t5, $t5, $t1        

        #espacio
        li $v0, 4                
        la $a0, Espacio          
        syscall                  

        # Incrementar contador
        addi $t4, $t4, 1         

        # Imprimir segundo número de Fibonacci (1)
        li $v0, 1                
        move $a0, $t2            
        syscall                  

        # Sumar el segundo número (1) al acumulador
        add $t5, $t5, $t2        

        #espacio
        li $v0, 4                
        la $a0, Espacio          
        syscall                  

       
        addi $t4, $t4, 1

        
        # Ciclo para generar la serie Fibonacci
    loop:
        add $t3, $t1, $t2        
        addi $t4, $t4, 1         

        # Imprimir el siguiente número
        li $v0, 1                
        move $a0, $t3            
        syscall                  

        # Sumar el número actual al acumulador
        add $t5, $t5, $t3        

        #espacio
        li $v0, 4                
        la $a0, Espacio          
        syscall                  

        # Actualizar los números
        move $t1, $t2            
        move $t2, $t3            

        # Verificar si hemos alcanzado el número deseado de elementos
        bge $t4, $t0, fin        

        j loop                   

    fin:
    	#salto
        li $v0, 4                
        la $a0, salto         
        syscall  
        
        # Imprimir mensaje de la suma
        li $v0, 4                
        la $a0, sumat      
        syscall                  

        # Imprimir la suma total
        li $v0, 1                
        move $a0, $t5            
        syscall    
        
        #salto
        li $v0, 4                
        la $a0, salto         
        syscall                

        # Salir del programa
        li $v0, 10               
        syscall         