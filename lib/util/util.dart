import 'dart:math';

class Util {
  /**
   * 乱数生成
   */
  static int getRandomInt(int min, int max) {
    Random rnd = new Random();
    int result = min + rnd.nextInt(max + 1 - min);

    return result;
  }
}
