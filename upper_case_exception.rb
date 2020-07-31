class UpperCaseException < StandardError
  def initialize(msg = "No puede contener mayusculas")
    super
  end
end

def divideBy0
  #mem = GetProcessMem.new
  #puts mem.inspect
  print "Ingrese el un numero: "
  num1 = gets.to_i
  print "\nIngrese otro numero: "
  num2 = gets.to_i

  begin
    clock_now = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    num1/0
  rescue ZeroDivisionError
    clock_then = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    elapsed = clock_then - clock_now
  end
  puts "Tiempo de la excepcion #{elapsed} s"

  #puts "Memoria total #{mem.kb} kb"
end

def myException
  elapsed = nil
  print "Dijite una frase con mayusculas: "
  phrase = gets.chomp

  begin
    clock_now = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    raise UpperCaseException if phrase =~ /[A-Z]/
  rescue
    clock_then = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end
  elapsed = clock_then - clock_now
  puts "Tiempo tomado para la excepcion: #{elapsed} s"

end

divideBy0
myException