// import 'package:dada_surgery/tools/navigator_util.dart';
// import 'package:flutter/material.dart';
// import 'package:images_picker/images_picker.dart';
// import 'package:scan/scan.dart';

// class ScanPage extends StatefulWidget {

//   @override
//   _ScanPageState createState() => _ScanPageState();
// }

// class _ScanPageState extends State<ScanPage> {
//   StateSetter stateSetter;
//   IconData lightIcon = Icons.flash_on;
//   ScanController controller = ScanController();

//   void getResult(String result){
//     //TODO
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:"扫码"
//       ),
//       body: Stack(
//           children: [ScanView(
//             controller: controller,
//             scanAreaScale: .7,
//             scanLineColor: Color(0xFF4759DA),
//             onCapture: (data) {
//               getResult(data);
//             },
//           ),
//             Positioned(
//               left: D.w(100),
//               bottom: D.w(100),
//               child: StatefulBuilder(
//                 builder: (BuildContext context, StateSetter setState) {
//                   stateSetter = setState;
//                   return MaterialButton(
//                       child: Icon(lightIcon,size: D.w(80),color: Color(0xFF4759DA),),
//                       onPressed: (){
//                         controller.toggleTorchMode();
//                         if (lightIcon == Icons.flash_on){
//                           lightIcon = Icons.flash_off;
//                         }else {
//                           lightIcon = Icons.flash_on;
//                         }
//                         stateSetter((){});
//                       }
//                   );
//                 },
//               ),
//             ),
//             Positioned(
//               right: D.w(100),
//               bottom: D.w(100),
//               child: MaterialButton(
//                   child: Icon(Icons.image,size: D.w(80),color: Color(0xFF4759DA),),
//                   onPressed: () async {
//                     List<Media> res = await ImagesPicker.pick();
//                     if (res != null) {
//                       String result = await Scan.parse(res[0].path);
//                       getResult(result);
//                     }
//                   }
//               ),
//             ),
//           ]
//       ),
//     );
//   }
// }
