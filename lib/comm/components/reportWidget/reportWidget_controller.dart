import 'package:get/get.dart';

class ReportWidgetController extends GetxController {
  var chart = true.obs;
  var opacity_metric = 0.2.obs;
  var opacity_chart = 1.0.obs;
  void change() {
    chart.value = !chart.value;
    if (chart.value) {
      opacity_metric.value = 0.2;
      opacity_chart.value = 1.0;
    } else {
      opacity_metric.value = 1;
      opacity_chart.value = 0.2;
    }
    print("$chart,$opacity_chart,$opacity_metric");
    update();
  }
}
