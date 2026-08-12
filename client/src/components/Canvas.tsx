import React, { useEffect, useRef, useState } from "react";
import { fabric } from "fabric";
import { useEvent, useChannel } from 'use-phoenix'

interface UpdatePayload {
  session: string;
  obj: fabric.Object;
}

const Canvas = ({ sessionId }: { sessionId: string | null }) => {
  const canvasRef = useRef<HTMLCanvasElement>(null);
  const [fabricCanvas, setFabricCanvas] = useState<fabric.Canvas | null>(null);
  const [session, { push, leave }] = useChannel(sessionId && "session:" + sessionId)

  useEvent(session, 'update', (payload: UpdatePayload) => {
    console.log(payload)
    fabricCanvas.loadFromJSON(payload.obj, () => { fabricCanvas.renderAll() })
  })

  useEffect(() => {
    const fabricCanvas = new fabric.Canvas(canvasRef.current, {
      width: 800,
      height: 600,
      backgroundColor: "white",
      isDrawingMode: true,
      preserveObjectStacking: true,
    })

    fabricCanvas.freeDrawingBrush = new fabric.PencilBrush(fabricCanvas)
    fabricCanvas.freeDrawingBrush.width = 5
    fabricCanvas.freeDrawingBrush.color = '#000000'

    // Listen for drawing events
    fabricCanvas.on("path:created", (opt: any) => {
      const pathData = opt.path.toJSON();
      push("draw", { data: pathData });
    });

    setFabricCanvas(fabricCanvas)

    return () => {
      fabricCanvas.dispose();
      leave()
      setFabricCanvas(null)
    }
  }, [push, leave]);

  return <canvas ref={canvasRef} />;
};

export default Canvas;
