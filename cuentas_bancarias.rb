class Usuario
    def initialize(nombre, cuenta_bancaria)
        raise TypeError, "No posees una cuenta" if cuenta_bancaria.size < 1
        @nombre = nombre
        @cuenta_bancaria = cuenta_bancaria
    end
    
    # . Crear el método saldo total que devuelva la suma de todos los saldos del usuario.
    def saldo_total 
        total = 0
        @cuenta_bancaria.map {|x| x.saldo}.sum
    end
end
        
        
class CuentaBancaria
    attr_accessor :saldo
    def initialize (nombre_banco, numero_cuenta, saldo = 0)
        @nombre_banco = nombre_banco
        @numero_cuenta = numero_cuenta
        @saldo = saldo
    end
    
    def transferir (monto, cuenta_destino) # metodo que reciba monto y cuenta destino
        raise TypeError, 'No cuenta con el saldo suficiente' if monto > @saldo
        @saldo -= monto #restar monto a saldo actual 
        cuenta_destino.saldo += monto # aumentar el saldo de cuenta destino 
    end
end

cuenta1 = CuentaBancaria.new("Banco de Chile", 1234,5000)
cuenta2 = CuentaBancaria.new("BancoEstado", 5678, 5000)
cuenta3 = CuentaBancaria.new("Banco Scotiabank", 007, 15000)
persona1 = Usuario.new("Diego", [cuenta1, cuenta3])
persona2 = Usuario.new("Francisca", [cuenta2])

puts cuenta1.transferir(5000, cuenta2)
puts persona1.saldo_total