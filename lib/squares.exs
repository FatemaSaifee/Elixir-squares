defmodule Squares do

  def main do
    # __MODULE__ refers to the current module

    # Take command line arguments
    [n, k] = System.argv();
    {n, _} = Integer.parse(n);
    {k, _} = Integer.parse(k);

    # Divide the problen into smaller workunits
    counts = :math.ceil(n/100)
    supervisor(n, k, counts)
  end

  def supervisor(n, k, count) do
    # Supervisor Process
    # Look through new_end to new_start, to get all possible sum of squares which is also a square
    if count>0 do
      # Spawn a new worker process
      new_end = min(count*100, n)
      new_start = (count-1)*100+1
      pid =  spawn(__MODULE__, :worker, [new_end, k, new_start])
      send(pid, {:log, :msg})
      supervisor(n, k, count-1)
    end
  end
  

  def worker(n, k, start) do
    # Worker process
    # Here we calculate sum of k squares from start to n
    loop(n, k, start)
  end

  def loop(n, k, start) do
    # It recieves messages sent through workers and then calculate squares
    new_count = receive do
      {:log, :msg} ->
        
        get_squares(n, k, start)
      {:stats} ->
        IO.puts "I've logged #{start} messages"
      _ ->
        IO.puts "loop #{n} #{start}"
        get_squares(n, k, start)
    end
    loop(n, k, new_count)
  end

  def isSquare(n, k) do
    # Calculate sum of numbers from n to k+n-1
    # Check if the sum is a Perfect Square
    n = Kernel.trunc(n)
    k = Kernel.trunc(k)
    total_sum = n..k+n-1 |> Enum.map(&(&1 * &1)) |> Enum.sum
    :math.sqrt(total_sum) == :math.floor(:math.sqrt(total_sum))
  end

  def get_squares(n, k, start) do
    # Look through n to 1, to get all possible sum of squares which are square
    # IO.puts "get sqrs #{n} #{start}"
    if isSquare(n, k) do
      n = Kernel.trunc(n)
      IO.puts "#{n}"
      if n>start do
        get_squares(n-1, k, start)
      end
    else
      if n>start do
        get_squares(n-1, k, start)
      else
        # IO.puts "No such numbers are present"
      end
    end
  end

end

Squares.main
:timer.sleep(1 * 10)
