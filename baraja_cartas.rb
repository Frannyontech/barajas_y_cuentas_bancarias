require_relative 'carta.rb'

class Baraja 
    attr_reader :carta
    def initialize 
        @cartas = []
        ["C","D","E","T"].each do |pinta|
            13.times do |numero|
                num = numero + 1
                @cartas.push(Carta.new(num,pinta))
            end
        end
    end

    def barajar
        @cartas.shuffle!
    end

    def sacar
        @cartas.pop
    end

    def repartir_mano
        @cartas[0..4]
    end
end

baraja = Baraja.new
barajar = baraja.barajar

sacar = baraja.sacar
print "Carta = #{sacar.numero} - Pinta = #{sacar.pinta}\n"
print baraja.repartir_mano