import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagramclone/resources/auth_methods.dart';
import 'package:instagramclone/screens/login_screen.dart';
import 'package:instagramclone/utils/colors.dart';
import 'package:instagramclone/utils/utils.dart';
import 'package:instagramclone/widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  bool _isLoading = false;
  Uint8List? _image;

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      bio: _bioController.text,
      file: _image!,
    );

    setState(() {
      _isLoading = false;
    });

    showSnackBar(res, context);

    // if (res == 'success') {
    //   showSnackBar(res, context);
    // } else {
    //   //
    // }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        // svg image
        Flexible(
          child: Container(),
          flex: 2,
        ),
        SvgPicture.asset(
          'assets/ic_instagram.svg',
          color: Colors.white,
          height: 64,
        ),

        const SizedBox(
          height: 64,
        ),
        Stack(
          children: [
            _image != null
                ? CircleAvatar(
                    radius: 64,
                    backgroundImage: MemoryImage(_image!),
                  )
                : const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        'https://www.velvetjobs.com/assets/noavatar-profile.jpg'),
                  ),
            Positioned(
              bottom: -10,
              left: 80,
              child: IconButton(
                onPressed: selectImage,
                icon: const Icon(Icons.add_a_photo),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        TextFieldInput(
          hintText: 'Enter your username',
          textInputType: TextInputType.text,
          textEditingController: _usernameController,
        ),
        // text field input for email
        const SizedBox(
          height: 24,
        ),
        TextFieldInput(
          hintText: 'Enter your email',
          textInputType: TextInputType.emailAddress,
          textEditingController: _emailController,
        ),
        const SizedBox(
          height: 24,
        ),
        TextFieldInput(
          hintText: 'Enter your password',
          textInputType: TextInputType.text,
          textEditingController: _passwordController,
          isPass: true,
        ),
        const SizedBox(
          height: 24,
        ),
        TextFieldInput(
          hintText: 'Enter your your bio',
          textInputType: TextInputType.text,
          textEditingController: _bioController,
        ),
        const SizedBox(
          height: 24,
        ),
        InkWell(
          child: _isLoading
              ? const CircularProgressIndicator(
                  color: primaryColor,
                )
              : Container(
                  child: const Text('Sign up'),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      color: blueColor),
                ),
          onTap: signUpUser,
        ),
        const SizedBox(
          height: 12,
        ),
        Flexible(
          child: Container(),
          flex: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: const Text(
                'Already have an account?',
              ),
              padding: const EdgeInsets.symmetric(vertical: 8),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              ),
              child: Container(
                child: const Text(
                  ' Login.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 8),
              ),
            )
          ],
        )
        // text field input for password
        // button login
        // transitioning to signing up
      ]),
    )));
  }
}
