import 'package:diginova/controller/auth_controller/login_controller.dart';
import 'package:diginova/global/constant.dart';
import 'package:diginova/global/wrapper.dart';
import 'package:diginova/screens/authentication/forgot_password.dart';
import 'package:diginova/screens/authentication/sign_up.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _loginController = Get.put(LoginController());

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  bool isLoggedInSuccess = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image(
            image: AssetImage(BACKGROUNDIMAGE),
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: mediaQueryW(context) * 0.05,
                  vertical: mediaQueryH(context) * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Diginotech',
                      style: GoogleFonts.poppins(
                        fontSize: FONT_50,
                        fontWeight: FontWeight.bold,
                        color: BLUE_SHADE_CLR,
                      ),
                    ),
                  ),
                  const SizedBox(height: SPACING_XL),
                  Text(
                    'Welcome Back,',
                    style: GoogleFonts.poppins(
                      fontSize: FONT_40,
                      fontWeight: FontWeight.bold,
                      color: BLACK_SHADE,
                    ),
                  ),
                  Text(
                    'Have a good day',
                    style: GoogleFonts.poppins(
                      fontSize: FONT_SM,
                      fontWeight: FontWeight.w400,
                      color: BLACK_SHADE,
                    ),
                  ),
                  const SizedBox(height: SPACING_M),
                  Form(
                    key: _loginController.emailFormKey.value,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: TextFormField(
                      key: const ValueKey('email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      onSaved: (Value) {
                        _loginController.setEmail;
                      },
                      controller: _emailController,
                      cursorColor: TEXTFIELD_HINT_TXT_CLR,
                      textInputAction: TextInputAction.done,
                      style: TEXT_STYLE,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 12),
                        hintText: 'User@gmail.com',
                        hintStyle: TEXTFIELD_HINT_TXT_STYLE,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: TEXTFIELD_BORDER_CLR),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: TEXTFIELD_BORDER_CLR),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: SPACING_M),
                  Obx(
                    () => Form(
                      key: _loginController.passwordFormKey.value,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: TextFormField(
                        key: const ValueKey('password'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _loginController.setPassword;
                        },
                        // _loginController.setPassword,
                        controller: _passwordController,
                        cursorColor: TEXTFIELD_HINT_TXT_CLR,
                        textInputAction: TextInputAction.done,
                        style: TEXT_STYLE,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 12),
                          hintText: 'Password',
                          hintStyle: TEXTFIELD_HINT_TXT_STYLE,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _loginController.obscureText.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: _loginController.toggleObscureText,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: TEXTFIELD_BORDER_CLR),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: TEXTFIELD_BORDER_CLR),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                        obscureText: _loginController.obscureText.value,
                      ),
                    ),
                  ),
                  const SizedBox(height: SPACING_SM),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Forgot Password?",
                          style: GoogleFonts.poppins(
                              fontSize: FONT_SM,
                              fontWeight: FontWeight.w500,
                              color: BLUE_SHADE_CLR),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ForgotPassword(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: SPACING_M),
                  _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: DEFAULT_CLR,
                        ))
                      : SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(BLUE_SHADE_CLR),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                              ),
                            ),
                            onPressed: () async {
                              if (_loginController.validateFields()) {
                                final formData = {
                                  'email': _emailController.text.trim(),
                                  'password': _passwordController.text.trim(),
                                };
                                setState(() {
                                  _isLoading = true;
                                });

                                try {
                                  isLoggedInSuccess = await _loginController
                                      .signInUser(formData);

                                  if (isLoggedInSuccess) {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Wrapper(),
                                      ),
                                      (route) => false,
                                    );
                                    _showErrorDialog(
                                        'Login successfully', true);
                                  } else {
                                    Get.snackbar(
                                      'Error',
                                      'Failed to Login. Please try again.',
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white,
                                    );
                                  }
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Error: $e'),
                                    ),
                                  );
                                } finally {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                }
                              }
                            },
                            child: Text(
                              "Log In",
                              style: GoogleFonts.poppins(
                                fontSize: FONT_XSS,
                                fontWeight: FontWeight.w600,
                                color: WHITE_CLR,
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(height: SPACING_M),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Create new account? ",
                            style: GoogleFonts.poppins(
                              fontSize: FONT_SM,
                              fontWeight: FontWeight.w400,
                              color: GREY_CLR,
                            ),
                          ),
                          TextSpan(
                            text: "Sign Up",
                            style: GoogleFonts.poppins(
                              fontSize: FONT_SM,
                              fontWeight: FontWeight.w500,
                              color: BLUE_SHADE_CLR,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(
                                  () => const SignUpPage(),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _showErrorDialog(String message, bool isSuccess) {
  Get.snackbar(
    isSuccess ? "Success" : "Error",
    message,
    backgroundColor: isSuccess ? Colors.green : Colors.red,
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
    icon: isSuccess
        ? const Icon(
            Icons.check,
            color: WHITE_CLR,
          )
        : const Icon(Icons.error),
  );
}
