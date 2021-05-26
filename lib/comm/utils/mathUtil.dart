import 'dart:math';

import 'package:get_storage/get_storage.dart';

class MathUtil {
  static Random random = Random();
  static List<double> randomDouble(double start, double end, int num) {
    return List.generate(
        num, (index) => random.nextDouble() * (end - start) + start).toList();
  }

  static List<int> randomInt(int start, int end, int num) {
    return List.generate(num, (index) => random.nextInt(end - start) + start)
        .toList();
  }

  static double sum(List data) => data.reduce((x, y) => x + y);
  static double avg(List data) => sum(data) / data.length;
  static double vari(List data) =>
      data.map((x) => pow(x - avg(data), 2)).reduce((x, y) => x + y) /
      data.length;
  static double std(List data) => sqrt(vari(data));
  static Map<String, double> stat(List<double> data, {bool extra = false}) {
    //计算给定数据集的最小，最大，总计，平均，计数统计量，如果extra==true，还计算方差
    Map<String, double> res = {};
    res["count"] = data.length.toDouble();
    res["sum"] = 0.0;
    res["max"] = data[0];
    res["min"] = data[0];
    for (int i = 0; i < data.length; i++) {
      if (res["max"]! < data[i]) {
        res["max"] = data[i];
      }
      if (res["min"]! > data[i]) {
        res["min"] = data[i];
      }
      res["sum"] = res["sum"]! + data[i];
    }
    res["avg"] = res["sum"]! / data.length;
    if (!extra) {
      return res;
    }
    res["var"] =
        data.map((i) => pow(i - res["avg"]!, 2)).reduce((x, y) => x + y) /
            data.length;
    res["std"] = sqrt(res["var"]!);
    return res;
  }
}
