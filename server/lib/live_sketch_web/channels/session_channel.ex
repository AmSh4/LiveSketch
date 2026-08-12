defmodule LiveSketchWeb.SessionChannel do
  use LiveSketchWeb, :channel
  alias LiveSketch.DrawLogic  # We'll define this

  def join("session:" <> session_id, _payload, socket) do
    # Functional: Pure function for validation
    case DrawLogic.validate_session(session_id) do
      :ok ->
        socket = assign(socket, :session_id, session_id)
        {:ok, socket}
      :error ->
        {:error, %{reason: "Invalid session"}}
    end
  end

  def handle_in("draw", %{"data" => data}, socket) do
    # FP: Immutable processing
    updated_data = DrawLogic.process_draw(socket.assigns.session_id, data)
    broadcast!(socket, "update", %{session: socket.assigns.session_id, obj: updated_data})
    # Log for analytics
    DrawLogic.log_interaction(socket.assigns.session_id, data)
    {:noreply, socket}
  end

  # Anomaly detection hook (simple)
  def handle_in("check_anomaly", %{"data" => data}, socket) do
    anomaly_score = DrawLogic.detect_anomaly(data)
    if anomaly_score > 0.8 do
      # Self-heal: Warn or something
      push(socket, "alert", %{msg: "Unusual activity detected"})
    end
    {:noreply, socket}
  end
end
