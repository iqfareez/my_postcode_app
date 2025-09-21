/// Returns the number of grid columns based on the screen width.
int getGridNumber(double screenWidth) {
  if (screenWidth >= 1200) {
    return 10;
  } else if (screenWidth >= 992) {
    return 8;
  } else if (screenWidth >= 768) {
    return 7;
  } else if (screenWidth >= 576) {
    return 5;
  } else {
    return 3;
  }
}
