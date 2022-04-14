import 'package:image_picker/image_picker.dart';

pickerImage(ImageSource source) async {
  // With this video https://youtu.be/mEPm9w5QlJM?t=11653
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: ImageSource.gallery);

  if (_file != null) {
    return await _file.readAsBytes();
  } else {
    print('no image selected');
  }
}


