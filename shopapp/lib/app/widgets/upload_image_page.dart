// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
//
// class UploadImagePage extends StatelessWidget {
//   final ImagePickerController controller = Get.put(ImagePickerController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload Image with GetX'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Obx(() {
//               return controller.selectedImage.value != null
//                   ? Image.file(
//                 controller.selectedImage.value!,
//                 height: 200,
//               )
//                   : Text('No image selected');
//             }),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 controller.pickImage();
//               },
//               child: Text('Pick Image'),
//             ),
//             SizedBox(height: 20),
//             Obx(() {
//               return controller.isUploading.value
//                   ? CircularProgressIndicator()
//                   : ElevatedButton(
//                 onPressed: () {
//                   controller.uploadImage();
//                 },
//                 child: Text('Upload Image'),
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }
