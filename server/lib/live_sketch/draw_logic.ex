defmodule LiveSketch.DrawLogic do
  @moduledoc """
  Functional module for drawing business logic.
  Uses pure functions and pattern matching.
  """

  def validate_session(id) when is_binary(id) and byte_size(id) > 0, do: :ok
  def validate_session(_), do: :error

  def process_draw(session_id, data) do
    # Simulate processing: Add timestamp immutably
    Map.put(data, :timestamp, DateTime.utc_now())
    |> Map.put(:session, session_id)
  end

  def detect_anomaly(%{points: points}) when length(points) > 1000, do: 0.9  # High speed = anomaly
  def detect_anomaly(_), do: 0.1

  def log_interaction(session_id, data) do
    # Simulate log: In real, write to file or ETS
    IO.puts("Logged: #{session_id} - #{inspect(data)}")
  end
end
