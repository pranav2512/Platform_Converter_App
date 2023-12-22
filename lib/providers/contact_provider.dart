import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import '../model/contact.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> contacts = [
    Contact(
      name: 'Aquaman',
      contact: '8866161894',
      email: 'aquaman@gmail.com',
      assetPic: 'assets/img/aquaman.jpg',
      time: 'Yesterday,10:45 PM',
    ),
    Contact(
      name: 'Batman',
      contact: '9988774455',
      email: 'batman@gmail.com',
      assetPic: 'assets/img/batman.jpg',
      time: 'Yesterday,9:40 PM',
    ),
    Contact(
      name: 'Flash',
      contact: '7894561231',
      email: 'flash@gmail.com',
      assetPic: 'assets/img/flash.jpg',
      time: 'Yesterday,10:40 PM',
    ),
    Contact(
      name: 'Green Lantern',
      contact: '7896543210',
      email: 'green@gmail.com',
      assetPic: 'assets/img/green.jpg',
      time: 'Yesterday,11:40 PM',
    ),
    Contact(
      name: 'Jerry',
      contact: '7896553210',
      email: 'jerry@gmail.com',
      assetPic: 'assets/img/jerry.png',
      time: 'Yesterday,9:40 PM',
    ),
    Contact(
      name: 'Superman',
      contact: '7891243210',
      email: 'superman@gmail.com',
      assetPic: 'assets/img/superman.jpg',
      time: 'Yesterday,12:42 PM',
    ),
    Contact(
      name: 'Swat Cats',
      contact: '7777743210',
      email: 'cats@gmail.com',
      assetPic: 'assets/img/swat.jpeg',
      time: 'Yesterday,7:40 PM',
    ),
    Contact(
      name: 'Tom',
      contact: '7788943210',
      email: 'tom@gmail.com',
      assetPic: 'assets/img/tom.png',
      time: 'Yesterday,9:40 PM',
    ),
    Contact(
      name: 'Wonder Woman',
      contact: '4455243210',
      email: 'wonder@gmail.com',
      assetPic: 'assets/img/wonder.jpg',
      time: 'Yesterday,4:40 PM',
    ),
  ];
  int current_step = 0;
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController phoneController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");

  checkContinueState() {
    if (current_step < 3) {
      current_step++;
    }
    notifyListeners();
  }

  checkCancelState() {
    if (current_step > 0) {
      current_step--;
    }
    notifyListeners();
  }

  void addContact(String name, String phone, String email) {
    contacts.add(Contact(name: name, contact: phone, email: email, time: 'Just Now',assetPic: "assets/img/wonder.jpg"));
    notifyListeners();
  }

  void addContactWithImage(
      String name, String phone, String email, String profileImage) {
    contacts.add(Contact(
        name: name, contact: phone, email: email, pic: profileImage, time: 'Just Now'));
    notifyListeners();
  }

  String? profileImageVar;

  void ImagePickerCamera() async {
    ImagePicker picker = ImagePicker();

    XFile? xFile = await picker.pickImage(source: ImageSource.camera);
    String? path = xFile!.path;
    profileImageVar = path;
    notifyListeners();
  }

  void ImagePickerGalary() async {
    ImagePicker picker = ImagePicker();

    XFile? xFile = await picker.pickImage(source: ImageSource.gallery);
    String? path = xFile!.path;
    profileImageVar = path;
    notifyListeners();
  }
  void checkFilledData() {
    if (nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        profileImageVar != null) {
      addContactWithImage(nameController.text, phoneController.text,
          emailController.text, profileImageVar!);
    } else if (nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        profileImageVar == null) {
      addContact(
          nameController.text, phoneController.text, emailController.text);
    }
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    profileImageVar = null;
    notifyListeners();
  }

}
