import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyControl extends GetxController {
  var _isExpanded = false.obs;
}

class ylzExpansionPanelList extends StatelessWidget {
  var data;
  ylzExpansionPanelList(this.data);
  final MyControl c = Get.put(MyControl());
  @override
  Widget build(BuildContext context) {
    //print(data);
    List<ExpansionPanel> expansionPanel = data.map<ExpansionPanel>((item) => 
      ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                                          padding: EdgeInsets.all(16.0),
                                          child: item["head"],
                                        );
                  },
                  body: Container(
                                      padding: EdgeInsets.all(16.0),
                                      width: double.infinity,
                                      child: item["detail"],
                                    ),
                  isExpanded: c._isExpanded.value, // 设置面板的状态，true展开，false折叠
                )).toList();
    return SingleChildScrollView(
      child: ExpansionPanelList(
            // 点击折叠按钮实现面板的伸缩
            expansionCallback: (int panelIndex, bool isExpanded) {
              c._isExpanded.value = !isExpanded;
            },
            children: expansionPanel    
      ),
    );
  }
}
