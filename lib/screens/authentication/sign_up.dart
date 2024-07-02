import 'package:diginova/controller/auth_controller/sign_up_contoller.dart';
import 'package:diginova/global/constant.dart';
import 'package:diginova/global/wrapper.dart';

import 'package:diginova/screens/authentication/login_page.dart';
import 'package:diginova/screens/qr_scan/qr_scan.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final SignUpController signUpController = Get.put(SignUpController());
  bool _isLoading = false;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _customerIdController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            BACKGROUNDIMAGE,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 70),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 18,
                      ),
                    ),
                    const SizedBox(height: SPACING_LG),
                    Text(
                      'Create New Account',
                      style: CREATE_ACCOUNT_TXT_STYLE,
                    ),
                    Text(
                      'Sign Up to continue',
                      style: SIGNUP_TXT_STYLE,
                    ),
                    const SizedBox(height: SPACING_LG),
                    buildTextFormField(
                      "First Name",
                      _firstNameController,
                      signUpController.setFirstName,
                      TextInputAction.done,
                      TextCapitalization.words,
                      (value) {
                        if (value!.isEmpty) {
                          return 'First Name should not be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: SPACING_M),
                    buildTextFormField(
                      "Last Name",
                      _lastNameController,
                      signUpController.setLastName,
                      TextInputAction.done,
                      TextCapitalization.words,
                      (value) {
                        if (value!.isEmpty) {
                          return 'Last Name should not be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: SPACING_M),
                    buildTextFormField(
                      "Customer ID",
                      _customerIdController,
                      signUpController.setCustomerId,
                      TextInputAction.done,
                      TextCapitalization.words,
                      null,
                    ),
                    const SizedBox(height: SPACING_M),
                    buildTextFormField(
                      "Email",
                      _emailController,
                      signUpController.setEmail,
                      TextInputAction.done,
                      TextCapitalization.none,
                      (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the email';
                        }
                        return null;
                      },
                      TextInputType.emailAddress,
                    ),
                    const SizedBox(height: SPACING_M),
                    buildTextFormField(
                      "Password",
                      _passwordController,
                      signUpController.setPassword,
                      TextInputAction.done,
                      TextCapitalization.none,
                      (value) {
                        if (value!.length < 6) {
                          return 'Please enter password of min length is 6';
                        }
                        return null;
                      },
                      TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: SPACING_M),
                    buildTextFormField(
                      "Re-Password",
                      _rePasswordController,
                      signUpController.setRePassword,
                      TextInputAction.done,
                      TextCapitalization.none,
                      (value) {
                        if (value!.length < 6) {
                          return 'Please enter password of min length is 6';
                        } else if (value != _passwordController.text) {
                          return 'Password does not match';
                        }
                        return null;
                      },
                      TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: SPACING_M),
                    _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: DEFAULT_CLR,
                              strokeWidth: 2.5,
                            ),
                          )
                        : SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  DEFAULT_CLR,
                                ),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  final formData = {
                                    'firstName':
                                        _firstNameController.text.trim(),
                                    'lastName': _lastNameController.text.trim(),
                                    'customerId':
                                        _customerIdController.text.trim(),
                                    'email': _emailController.text.trim(),
                                    'password': _passwordController.text.trim(),
                                    'rePassword':
                                        _rePasswordController.text.trim(),
                                  };

                                  setState(() {
                                    _isLoading = true;
                                  });

                                  try {
                                    final isSignUpSuccess =
                                        await signUpController.signupUser(
                                      formData['firstName']!,
                                      formData['lastName']!,
                                      formData['customerId']!.isEmpty
                                          ? null.toString()
                                          : formData['customerId']!,
                                      formData['email']!,
                                      formData['password']!,
                                      formData['rePassword']!,
                                      context,
                                    );

                                    if (isSignUpSuccess) {
                                      _showErrorDialog(
                                        'Account created successfully',
                                        true,
                                      );

                                      if (_customerIdController.text.isEmpty) {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const QrScanner(),
                                          ),
                                        );
                                      } else {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Wrapper(),
                                          ),
                                        );
                                      }
                                    } else {
                                      _showErrorDialog(
                                        'Failed to create account. Please try again.',
                                        false,
                                      );
                                    }
                                  } catch (e) {
                                    _showErrorDialog('Error: $e', false);
                                  } finally {
                                    setState(() {
                                      _isLoading = false;
                                    });
                                  }
                                }
                              },
                              child: Text(
                                "Sign Up",
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
                              text: "Already have an account? ",
                              style: GoogleFonts.poppins(
                                fontSize: FONT_SM,
                                fontWeight: FontWeight.w400,
                                color: GREY_CLR,
                              ),
                            ),
                            TextSpan(
                              text: "Log In",
                              style: GoogleFonts.poppins(
                                fontSize: FONT_SM,
                                fontWeight: FontWeight.w500,
                                color: BLUE_SHADE_CLR,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ),
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
          ),
        ],
      ),
    );
  }

  TextFormField buildTextFormField(
    String hint,
    TextEditingController controller,
    Function(String) onChanged,
    TextInputAction action,
    TextCapitalization capitalization,
    String? Function(String?)? validator, [
    TextInputType? keyboardType,
  ]) {
    return TextFormField(
      style: TEXT_STYLE,
      key: ValueKey(hint),
      validator: validator,
      onSaved: (value) {
        setState(() {
          controller.text = value!;
        });
      },
      controller: controller,
      onChanged: onChanged,
      cursorColor: TEXTFIELD_HINT_TXT_CLR,
      textInputAction: action,
      textCapitalization: capitalization,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 12),
        hintText: hint,
        hintStyle: TEXTFIELD_HINT_TXT_STYLE,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: TEXTFIELD_BORDER_CLR,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: TEXTFIELD_BORDER_CLR,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: WHITE_CLR,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: WHITE_CLR,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
  }

  void _showErrorDialog(String message, bool isSuccess) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(isSuccess ? 'Success' : 'Error'),
        content: Text(message),
        actions: <Widget>[
          ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                DEFAULT_CLR,
              ),
            ),
            child: const Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }
}
