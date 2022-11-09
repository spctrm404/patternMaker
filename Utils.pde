double[] paperToWorldMm(double[] paperMm) {
  double[] worldMm = {paperMm[0] + margins[0], paperMm[1] + margins[1]};
  return worldMm;
}

double[] paperToWorldMm(double paperXMm, double paperYMm) {
  double[] paperMm = {paperXMm, paperYMm};
  return paperToWorldMm(paperMm);
}

float[] paperToWorldPx(double[] paperMm) {
  return mmToScaledPx(paperToWorldMm(paperMm));
}

float[] paperToWorldPx(double paperXMm, double paperYMm) {
  return mmToScaledPx(paperToWorldMm(paperXMm, paperYMm));
}

float mmToScaledPx(double mm) {
  return (float) (mm * scale);
}

float[] mmToScaledPx(double[] mms) {
  float[] scaledPxs = new float[mms.length];
  for (int idx = 0; idx < scaledPxs.length; idx++)
    scaledPxs[idx] = mmToScaledPx(mms[idx]);
  return scaledPxs;
}

float[] mmToScaledPx(double mmX, double mmY) {
  double[] mms = {mmX, mmY};
  return mmToScaledPx(mms);
}

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
