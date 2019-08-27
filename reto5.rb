=begin
1. Mostrar enunciado
2. Mostrar pregunta
3. Tomar respuesta del usuario
     *Si falla:
      -Debe mostrar un enunciado diciendo "vuelve a intentarlo"
     *Si acierta
      -Debe mostrar un enunciado diciendo "Correcto"
      -Ir al punto 2
4. En caso de no tener mas preguntas el programa termina
=end

class Questions

  def initialize
    @Question = []
    @hit = 1
    @nq = false
  end

  def Task
    File.foreach("tasks.txt") do |line|
      word = line.split(",")
      hash = {id: word[0], preg: word[1], answ: word[2]}
      @Question << hash
    end
    @Question[@hit][:preg]
  end
  
  def hit!
    @hit += 1
  end

  def nq
    @nq 
  end

  def guess
   @Question[@hit][:answ].tr("\n","").downcase!
 end

 def a
  @Question[@hit][:id].to_i
end


end

p = Questions.new
p.Task()

puts "Bienvenido a reto 5, Para jugar, solo ingresa el termino correcto para cada una de las definiciones \n(todas las respuestas son en minuscula), Listo? Vamos!"
puts
while (not p.nq)
  if p.a != 0
    print "Definicion:"
    puts "  #{p.Task}"
    puts
    print "Adivina:  "
    answ = gets.chomp

    if answ == p.guess
      p.hit!
      puts
      puts "Muy bien, respuesta correcta XD"

    else
      puts
      puts "Respuesta incorrecta, vuelve a intentar... :-("
      puts
    end    
   else
   break 
  end
end


