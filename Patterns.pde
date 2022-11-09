void cropMarker(PGraphics g, double x, double y, double w, double h, double space) {
  float[] xy = paperToWorldPx(x, y);
  float[] wh = mmToScaledPx(w, h);
  float space_ = mmToScaledPx(space);
  g.line(xy[0] - (wh[0] > 0 ? space_ : -space_), xy[1],
    xy[0] - wh[0], xy[1]);
  g.line(xy[0], xy[1] - (wh[1] > 0 ? space_ : -space_),
    xy[0], xy[1] - wh[1]);
}

void cropMarkers(PGraphics g, double x, double y, double w, double h, double l, double space) {
  cropMarker(g, x, y,
    l, l, space);
  cropMarker(g, x + w, y,
    -l, l, space);
  cropMarker(g, x + w, y + h,
    -l, -l, space);
  cropMarker(g, x, x + h,
    l, -l, space);
}

void area(PGraphics g, double x, double y, double w, double h) {
  float[] xy = paperToWorldPx(x, y);
  float[] wh = mmToScaledPx(w, h);
  g.rect(xy[0], xy[1], wh[0], wh[1]);
}

void density(PGraphics g, double x, double y, double w, double h, double space, boolean isX) {
  float[] xy = paperToWorldPx(x, y);
  float[] wh = mmToScaledPx(w, h);
  float space_ = mmToScaledPx(space);
  if (isX) {
    for (float delta = xy[0]; delta <= xy[0] + wh[0]; delta += space_)
      g.line(delta, xy[1], delta, xy[1] + wh[1]);
  } else {
    for (float delta = xy[1]; delta <= xy[1] + wh[1]; delta += space_)
      g.line(xy[0], delta, xy[0] + wh[0], delta);
  }
}
