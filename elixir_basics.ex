defmodule Elixir.List1 do
    
   def list_count1(element) do
        list_count1(element, 0)
   end
   
   defp list_count1([], count), do: count
   defp list_count1([_head | tail], count) do
        list_count1(tail, count + 1)
   end
end

defmodule Elixir.Tuple1 do

   def check_tuple(element), do: check_tuple1(element)
   
   def check_tuple1({_,_}), do: :tuple
   def check_tuple1(_), do: :not_tuple
end

defmodule Elixir.Process1 do
   def spawn_process do
       pid1 = self()
       IO.puts("Parent Id : #{pid1}")	
       spawn(Elixir.Process1, :loop, [])
   end

   def loop() do
       pid = self()
       receive do
          {:ok, :continue} -> IO.puts("Child Id : #{pid}")
                            loop()
          _anythink -> IO.puts("Child Id : #{pid} gettting terminated")
       end
   end

   def pass_msg(pid, msg), do: send(pid, msg)
end

defmodule Learnfunction do
    def checkAnonymous() do
        check_anonymous =  fn
                            {:a, 1} -> "Number is 1"
                            {:b, 2} -> "Number is 2"
                            _ -> "Other Number"
                          end
        check_anonymous.({:a, 1})
    end

    def print_map(person = %{:name => name, :age => age}) do
        IO.puts("Name #{name} #{age}") 
        IO.inspect(person)
    end

    def default_args(name, lang \\ "Kannada")
    def default_args(name, lang) when is_atom(name), do: IO.puts("Name #{name} mother tongue #{lang}")
    def default_args(name, lang), do: IO.puts("Name #{name} mother tongue : #{lang}")
end

defmodule Learn.Module.Attr do
    @greeting "Hello"
    @derive {Inspect, except: [:roles]}
    defstruct name: "Nagendra", roles: "Developer"
    def check_attr(name) do
       IO.puts("#{@greeting} #{name}")
    end
end

defmodule LearComposition do
    import List, only: [last: 1]
    alias Learn.Module.Attr, as: L
    def print do
       L.check_attr("Nagendra") 
       IO.puts("Welcome to Composition")
       last_elm =  last([1, 2, 3, 4, 5])
       IO.puts("Last element #{last_elm}")
    end
end

defmodule Hello do
  defmacro __using__(_opts) do
    quote do
      def hello(name), do: "Hi, #{name}"
    end
  end
end

defmodule LearnSigil do
    @moduledoc """
        Details about create new sigil having character p
    """

    @doc """
       Define sigil_p function
    """
    @spec sigil_p(String.t(), list()) :: String.t()
    def sigil_p(string, []), do: String.upcase(string)
end

defmodule NewError do
    defexception message: "A new error has been created"
end

defmodule LearnProcess do
    def explode, do: exit(:error)
    def run do
       #Process.flag(:trap_exit, true)
       spawn_link(LearnProcess, :explode, [])
    end
end


defmodule ListTutorial do
   def print_list(list), do: print_list_1(list)

   defp print_list_1([]), do: :completed
   defp print_list_1([h | t]) do
      IO.puts h
      print_list_1(t)
   end
end

defmodule ElixirConditions do
   def check_marks(mark) do
      if(mark >= 35) do
        IO.puts("Pass ... Distinction")
      else
        IO.puts("Fail")
      end
      
      unless (mark >= 35) do
          IO.puts("Fail")
      end

      case mark do
          m when m > 80 -> 
              case m do
                  85 -> IO.puts("Pass ... Distinction")
                  90 -> IO.puts("Excellent Pass ... Distinction")   
              end
          34 -> IO.puts("Fail")
          75 -> IO.puts("Pass ...")
          _  -> IO.puts("Default")
      end
     
      cond do
         mark >= 85 -> "Distinction pass"
         mark >= 65 -> "First pass"
         mark >= 35 -> "pass"
         mark < 35  -> "Fail"
      end

      with true <- mark > 80,
           true <- mark == 85 do
               IO.puts("Pass ... Distinction")
           else
             false ->
              IO.puts("Default")
      end       
   end
end

defmodule Basic.Tutorial.Elixir do
    def print, do: "Hello Elixir"
    def print_1, do: "Hello Elixir"
end

defmodule BasicsTutorial do
    @greeting "Hello"
    @derive {Inspect, except: [:id]}
    alias Basic.Tutorial.Elixir, as: BT
    import BT, only: :functions

    defstruct name: "Nagendraaa", id: 1

    def map_pattern_match(%{:name => name} = namemap \\ %{:name => "Anushka"}) do
        IO.inspect("Name is #{name} #{@greeting}")
        BT.print()
        print_1()
        IO.inspect(namemap)
        :ok
    end
end
