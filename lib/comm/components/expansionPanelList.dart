import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyControl extends GetxController {
  RxList _data= [].obs;
}

class ylzExpansionPanelList extends GetView<MyControl> {
  var data;
  MyControl c = Get.put(MyControl());
  ylzExpansionPanelList(this.data);
  @override
  Widget build(BuildContext context) {
    print(data);
    controller._data.value = data;
    List<ExpansionPanel> expansionPanel = controller._data.map<ExpansionPanel>((item) => 
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
                  isExpanded: (item["isExpanded"]!=null)?item["isExpanded"]:false, // 设置面板的状态，true展开，false折叠
                  //isExpanded:false
                )).toList();
    return SingleChildScrollView(
      child: ExpansionPanelList(
                  // 点击折叠按钮实现面板的伸缩
                  expansionCallback: (int panelIndex, bool isExpanded) {
                    controller._data[panelIndex]["isExpanded"] = !isExpanded;
                    print(!isExpanded);
                    print(  controller._data[panelIndex]);
                  },
                  children: expansionPanel    
            ),
    );
  }
}
