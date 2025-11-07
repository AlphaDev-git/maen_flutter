import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../Core/Utils/app.images.dart';
import '../../../Core/Widgets/common_widgets.dart';
import '../function/auth_function.dart';
import 'buildTextField.dart';


class SignUpWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SignUpWidget();
  }
}


class _SignUpWidget extends State<SignUpWidget>{
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  String gender = "male";
  File? _image;
  bool _show=false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Directionality(
      textDirection: TextDirection.rtl, // Arabic layout
      child: Scaffold(
        backgroundColor: const Color(0xFFFDFBF5),
        body: ModalProgressHUD(
          inAsyncCall: _show,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  AppImages.appbackgroung,
                  fit: BoxFit.cover,

                ),
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withOpacity(0.88), // top light layer
                          Colors.white.withOpacity(0.9),
                          Colors.white.withOpacity(0.999),
                          Colors.white.withOpacity(0.999),
                        ]
                    )
                ),
              ),
              SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.07,
                    vertical: height * 0.03,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Profile image placeholder
                      InkWell(
                        child: Center(
                          child: Container(
                            width: width * 0.35,
                            height: width * 0.35,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueGrey, width: 1.5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child:_image==null? const Center(
                              child: Icon(Icons.image_outlined, size: 40, color: Colors.blueGrey),
                            ):Image.file(
                              _image!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        onTap: (){
                          _pickImage();
                        },
                      ),
                      SizedBox(height: height * 0.04),
                      buildTextField('الاسم الكامل', 'يوسف محمود احمد محمد', nameController),
                      SizedBox(height: height * 0.02),
                      buildTextField('البريد الالكتروني', 'youssefmahmoud@gmail.com', emailController),
                      SizedBox(height: height * 0.02),
                      buildTextField('رقم الجوال', '01*****', phoneController, keyboardType: TextInputType.phone),
                      SizedBox(height: height * 0.02),
                      buildTextField('كلمة المرور', 'كلمة المرور', passwordController, obscure: true),
                      SizedBox(height: height * 0.02),

                      // Confirm password
                      buildTextField('تأكيد كلمة المرور', 'كلمة المرور', confirmPasswordController, obscure: true),
                      SizedBox(height: height * 0.03),

                      // Gender buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: gender == "male"
                                    ? const Color(0xFF1E2A4A)
                                    : Colors.transparent,
                                side: const BorderSide(color: Color(0xFF1E2A4A)),
                                padding: EdgeInsets.symmetric(vertical: height * 0.018),
                              ),
                              onPressed: () {
                                setState(() => gender = "male");
                              },
                              child: Text(
                                "ذكر",
                                style: TextStyle(
                                  color: gender == "male" ? Colors.white : const Color(0xFF1E2A4A),
                                  fontSize: width * 0.045,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: width * 0.04),
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Color(0xFF1E2A4A)),
                                padding: EdgeInsets.symmetric(vertical: height * 0.018),
                                backgroundColor: gender == "female"
                                    ? const Color(0xFF1E2A4A)
                                    : Colors.transparent,
                              ),
                              onPressed: () {
                                setState(() => gender = "female");
                              },
                              child: Text(
                                "أنثى",
                                style: TextStyle(
                                  color: gender == "female" ? Colors.white : const Color(0xFF1E2A4A),
                                  fontSize: width * 0.045,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.05),

                      // Create account button
                      SizedBox(
                        width: double.infinity,
                        height: height * 0.065,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1E2A4A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: (){
                            if(_image!=null){
                              if(nameController.text!=""){
                                if(emailController.text!=""){
                                  if(passwordController.text!=""){
                                    if(confirmPasswordController.text!=""){
                                      if(passwordController.text==confirmPasswordController.text){
                                        setState(() {
                                          _show=true;
                                        });
                                        CreateStudentAccount(
                                            context,nameController.text,emailController.text,
                                            passwordController.text,confirmPasswordController.text,_image
                                        );
                                      }
                                      else{
                                        showErrorDialog(context," كلمة السر غير متطابقة  ");
                                      }
                                    }
                                    else{
                                      showErrorDialog(context,"برجاء ادحال تاكيد كلمة السر ");
                                    }
                                  }
                                  else{
                                    showErrorDialog(context,"برجاء ادحال كلمة السر ");
                                  }
                                }
                                else{
                                  showErrorDialog(context,"برجاء ادحال البريد الالكتروني");
                                }
                              }
                              else{
                                showErrorDialog(context,"برجاء ادخال الاسم");
                              }
                            }
                            else{
                              showErrorDialog(context,"برجاء اختيار صورة");
                            }
                          },
                          child: Text(
                            'إنشاء حساب',
                            style: TextStyle(
                              fontSize: width * 0.05,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Image selection simulated!'),
          backgroundColor: Color(0xFF07933E),
        ),
      );
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Image Not selection simulated!'),
          backgroundColor: Colors.red,
        ),
      );
    }


  }
}