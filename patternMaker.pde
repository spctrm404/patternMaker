import java.util.Calendar;
import processing.svg.*;

int scale = 10;
int[] margins = {20, 20, 20, 20};
int[] pgSize = {210, 297}; // 250, 337
PGraphics svg;
PGraphics nSvg;

void setup() {
  size(1000, 1348);
  svg = createGraphics((pgSize[0] + margins[0] + margins[2]) * scale,
    (pgSize[1] + margins[1] + margins[3]) * scale,
    SVG, "output.svg");
  nSvg = createGraphics((pgSize[0] + margins[0] + margins[2]) * scale,
    (pgSize[1] + margins[1] + margins[3]) * scale);
  render(svg);
  render(nSvg);
}

void render(PGraphics g) {
  g.beginDraw();
  g.strokeWeight(1);
  g.stroke(0);

  cropMarkers(g, 0, 0, pgSize[0], pgSize[1], 20, 5);

  // area(g, 0, 0, pgSize[0], pgSize[1]);

  density(g, 0, 0, 12.8, 12.8, 0.01, true);
  density(g, 20, 0, 12.8, 12.8, 0.02, true);
  density(g, 40, 0, 12.8, 12.8, 0.04, true);
  density(g, 60, 0, 12.8, 12.8, 0.08, true);
  density(g, 80, 0, 12.8, 12.8, 0.16, true);
  density(g, 100, 0, 12.8, 12.8, 0.32, true);
  density(g, 120, 0, 12.8, 12.8, 0.64, true);
  density(g, 140, 0, 12.8, 12.8, 1.28, true);
  density(g, 160, 0, 12.8, 12.8, 2.56, true);

  density(g, 0, 40, 12.8, 12.8, 0.01, false);
  density(g, 20, 40, 12.8, 12.8, 0.02, false);
  density(g, 40, 40, 12.8, 12.8, 0.04, false);
  density(g, 60, 40, 12.8, 12.8, 0.08, false);
  density(g, 80, 40, 12.8, 12.8, 0.16, false);
  density(g, 100, 40, 12.8, 12.8, 0.32, false);
  density(g, 120, 40, 12.8, 12.8, 0.64, false);
  density(g, 140, 40, 12.8, 12.8, 1.28, false);
  density(g, 160, 40, 12.8, 12.8, 2.56, false);
  
  g.endDraw();
}

void draw() {
  background(255);
  image(nSvg, 0, 0, width, height);
}
