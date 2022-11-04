defmodule Elixir_codes.GenServerBehaviour do
    use GenServer

    @moduledoc """
        In this module implemented basic trading functionalities
    """

    def start_link(initial_value) do
        GenServer.start_link(__MODULE__, initial_value, [{:name, __MODULE__}])
    end

    @impl true
    def init(:ok) do
        {:ok, %{order_count: 0}}
    end

    @impl true
    def handle_cast(:put, state) do
        count = Map.get(state, :order_count)
        new_state = Map.put(state, :order_count, count + 1)
        {:noreply, new_state}
    end

    @impl true
    def handle_call(:get, _from, state) do
       count =  Map.get(state, :order_count)
       {:reply, "Order count: #{count}", state}
    end

    @impl true
    def handle_info(msg, state) do
       IO.puts("Received system message #{msg}")
       {:noreply, state}
    end

    @impl true
    def terminate(reason, _state) do
        IO.puts("Genserver terminated reason: #{reason}")
        :ok
    end
end


defmodule Elixir_codes.GenServerClient do
    alias Elixir_codes.GenServerBehaviour, as: GSB

    def start_link() do
        GSB.start_link(:ok)        
    end

    def increment_trade_count() do
       GenServer.cast(GSB, :put)
    end

    def get_trade_count() do
       GenServer.call(GSB, :get)
    end

    def send_message_to_tradeEngine(msg) do
        send(GSB, msg)
    end

    def stop_tradeEngine(reason) do
       GenServer.stop(GSB, reason, 10000)
    end
end
