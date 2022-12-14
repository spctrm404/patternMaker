import java.util.Calendar;
import processing.svg.*;

int scale = 10;
int[] margins = {20, 20, 20, 20};
int[] pgSize = {210, 297}; // 250, 337
PGraphics svg;
PGraphics nSvg;

void setup() {
  size(1000, 1348);
  noiseSeed(0);
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

  for (int cnt = 0; cnt < 9; cnt++) {
    density(g, (210 - 12.8) / 8.0 * cnt, 0, 12.8, 12.8, 0.01 * pow(2, cnt), true);
  }
  
   for (int cnt = 0; cnt < 9; cnt++) {
    density(g, (210 - 12.8) / 8.0 * cnt, 30, 12.8, 12.8, 0.01 * pow(2, cnt), false);
  }

  zigzag(g, 0, 60, 210, 100, 1, 5);

  g.endDraw();
}

void draw() {
  background(255);
  image(nSvg, 0, 0, width, height);
}
