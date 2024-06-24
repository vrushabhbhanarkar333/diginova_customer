// ignore_for_file: use_build_context_synchronously

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
  // FirebaseAuth auth = FirebaseAuth.instance;
  final SignUpController signUpController = Get.put(SignUpController());
  // final GlobalKey<FormState> _formKey =
  //     GlobalKey<FormState>(); // Define _formKey here
  bool _isLoading = false;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _customerIdController = TextEditingController();
  // final TextEditingController _projectIdController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

  String password = '';
  String phoneNumber = '';
  String email = '';
  // String projectId = '';
  String customerId = '';
  String rePassword = '';
  String firstName = '';
  String lastName = '';

  final _formKeypassword = GlobalKey<FormState>();
  // final _formKeyphoneNumber = GlobalKey<FormState>();
  final _formKeyemail = GlobalKey<FormState>();
  // final _formKeyprojectId = GlobalKey<FormState>();
  final _formKeycustomerId = GlobalKey<FormState>();
  final _formKeyrePassword = GlobalKey<FormState>();
  final _formKeyFirstName = GlobalKey<FormState>();
  final _formKeyLastname = GlobalKey<FormState>();

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
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 70,
            ),
            child:
                // _isLoading
                //     ? const Center(
                //         child: CircularProgressIndicator(
                //           color: DEFAULT_CLR,
                //         ),
                //       )
                //     :
                SingleChildScrollView(
              scrollDirection: Axis.vertical,
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
                  const SizedBox(
                    height: SPACING_LG,
                  ),
                  Text(
                    'Create New Account',
                    style: CREATE_ACCOUNT_TXT_STYLE,
                  ),
                  Text(
                    'Sign Up to continue',
                    style: SIGNUP_TXT_STYLE,
                  ),
                  const SizedBox(height: SPACING_LG),
                  // Row(children: [
                  Form(
                    key: _formKeyFirstName,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: TextFormField(
                      style: TEXT_STYLE,
                      key: const ValueKey("First Name"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'First Name should not be empty';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          firstName = value!;
                        });
                      },
                      controller: _firstNameController,
                      onChanged: signUpController.setFirstName,
                      cursorColor: TEXTFIELD_HINT_TXT_CLR,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 12),
                        hintText: 'Your First Name',
                        hintStyle: TEXTFIELD_HINT_TXT_STYLE,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: TEXTFIELD_BORDER_CLR,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: TEXTFIELD_BORDER_CLR,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: SPACING_M),
                  Form(
                    key: _formKeyLastname,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: TextFormField(
                      style: TEXT_STYLE,
                      key: const ValueKey("Last Name"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Last Name should not be empty';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          lastName = value!;
                        });
                      },
                      controller: _lastNameController,
                      onChanged: signUpController.setLastName,
                      cursorColor: TEXTFIELD_HINT_TXT_CLR,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 12),
                        hintText: 'Your Last Name',
                        hintStyle: TEXTFIELD_HINT_TXT_STYLE,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: TEXTFIELD_BORDER_CLR,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: TEXTFIELD_BORDER_CLR,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: SPACING_M),
                  Form(
                    key: _formKeycustomerId,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: TextFormField(
                      style: TEXT_STYLE,
                      key: const ValueKey('customer Id'),
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return 'customer id should not be empty';
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      onSaved: (value) {
                        setState(() {
                          customerId = value!;
                          // customerId = value.capitalizeFirst!;
                        });
                      },
                      controller: _customerIdController,
                      onChanged: signUpController.setCustomerId,
                      cursorColor: TEXTFIELD_HINT_TXT_CLR,
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 12),
                        hintText: 'Your Customer ID',
                        hintStyle: TEXTFIELD_HINT_TXT_STYLE,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: TEXTFIELD_BORDER_CLR,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: TEXTFIELD_BORDER_CLR,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(height: SPACING_M),
                  // Form(
                  //   key: _formKeyprojectId,
                  //   autovalidateMode: AutovalidateMode.onUserInteraction,
                  //   child: TextFormField(
                  //     key: const ValueKey('projec Id'),
                  //     validator: (value) {
                  //       if (value!.isEmpty) {
                  //         return 'project id should not be empty';
                  //       } else {
                  //         return null;
                  //       }
                  //     },
                  //     onSaved: (value) {
                  //       setState(() {
                  //         projectId = value!;
                  //       });
                  //     },
                  //     controller: _projectIdController,
                  //     onChanged: signUpController.setProjectId,
                  //     cursorColor: TEXTFIELD_HINT_TXT_CLR,
                  //     textInputAction: TextInputAction.done,
                  //     decoration: InputDecoration(
                  //       contentPadding: const EdgeInsets.only(left: 12),
                  //       hintText: 'Your Project ID',
                  //       hintStyle: TEXTFIELD_HINT_TXT_STYLE,
                  //       enabledBorder: const OutlineInputBorder(
                  //         borderSide: BorderSide(
                  //           color: TEXTFIELD_BORDER_CLR,
                  //         ),
                  //         borderRadius: BorderRadius.all(
                  //           Radius.circular(8),
                  //         ),
                  //       ),
                  //       focusedBorder: const OutlineInputBorder(
                  //         borderSide: BorderSide(
                  //           color: TEXTFIELD_BORDER_CLR,
                  //         ),
                  //         borderRadius: BorderRadius.all(
                  //           Radius.circular(8),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: SPACING_M),
                  Form(
                    key: _formKeyemail,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: TextFormField(
                      style: TEXT_STYLE,
                      key: const ValueKey('email'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter the email';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          email = value!;
                        });
                      },
                      controller: _emailController,
                      onChanged: signUpController.setEmail,
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: Characters('@gmail.com'),
                      cursorColor: TEXTFIELD_HINT_TXT_CLR,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 12),
                        hintText: 'Email ID',
                        hintStyle: TEXTFIELD_HINT_TXT_STYLE,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: TEXTFIELD_BORDER_CLR,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: TEXTFIELD_BORDER_CLR,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: SPACING_M),
                  // Form(
                  //   key: _formKeyphoneNumber,
                  //   autovalidateMode: AutovalidateMode.onUserInteraction,
                  //   child: TextFormField(
                  //     key: const ValueKey('Number'),
                  //     validator: (value) {
                  //       if (!RegExp(r'^[0-9]{10}$').hasMatch(value!)) {
                  //         return 'Please enter a valid 10-digit phone number';
                  //       } else {
                  //         return null;
                  //       }
                  //     },
                  //     onSaved: (value) {
                  //       setState(() {
                  //         phoneNumber = value!;
                  //       });
                  //     },
                  //     controller: _phoneNumberController,
                  //     onChanged: signUpController.setPhoneNumber,
                  //     cursorColor: TEXTFIELD_HINT_TXT_CLR,
                  //     textInputAction: TextInputAction.done,
                  //     keyboardType: TextInputType.number,
                  //     decoration: InputDecoration(
                  //       contentPadding: const EdgeInsets.only(left: 12),
                  //       hintText: 'Phone Number',
                  //       hintStyle: TEXTFIELD_HINT_TXT_STYLE,
                  //       enabledBorder: const OutlineInputBorder(
                  //         borderSide: BorderSide(
                  //           color: TEXTFIELD_BORDER_CLR,
                  //         ),
                  //         borderRadius: BorderRadius.all(
                  //           Radius.circular(8),
                  //         ),
                  //       ),
                  //       focusedBorder: const OutlineInputBorder(
                  //         borderSide: BorderSide(
                  //           color: TEXTFIELD_BORDER_CLR,
                  //         ),
                  //         borderRadius: BorderRadius.all(
                  //           Radius.circular(8),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: SPACING_M),
                  Form(
                    key: _formKeypassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: TextFormField(
                      style: TEXT_STYLE,
                      key: const ValueKey("password"),
                      validator: (value) {
                        if (value!.length < 6) {
                          return 'Please enter password of min length is 6';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          password = value!;
                        });
                      },
                      controller: _passwordController,
                      onChanged: signUpController.setPassword,
                      cursorColor: TEXTFIELD_HINT_TXT_CLR,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 12),
                        hintText: 'Password',
                        hintStyle: TEXTFIELD_HINT_TXT_STYLE,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: TEXTFIELD_BORDER_CLR,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: TEXTFIELD_BORDER_CLR,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: SPACING_M),
                  Form(
                    key: _formKeyrePassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: TextFormField(
                      style: TEXT_STYLE,
                      key: const ValueKey("password"),
                      validator: (value) {
                        if (value!.length < 6) {
                          return 'Please enter password of min length is 6';
                        } else if (_passwordController ==
                            _rePasswordController) {
                          return 'Password does not matched';
                          // }
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          rePassword = value!;
                        });
                      },
                      controller: _rePasswordController,
                      onChanged: signUpController.setRePassword,
                      cursorColor: TEXTFIELD_HINT_TXT_CLR,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 12),
                        hintText: 'Re-Password',
                        hintStyle: TEXTFIELD_HINT_TXT_STYLE,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: TEXTFIELD_BORDER_CLR,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: TEXTFIELD_BORDER_CLR,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
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
                              if (_formKeyFirstName.currentState!.validate() &&
                                  _formKeycustomerId.currentState!.validate() &&
                                  _formKeyLastname.currentState!.validate() &&
                                  // _formKeyprojectId.currentState!.validate() &&
                                  _formKeyemail.currentState!.validate() &&
                                  // _formKeyphoneNumber.currentState!.validate() &&
                                  _formKeypassword.currentState!.validate() &&
                                  _formKeyrePassword.currentState!.validate()) {
                                final formData = {
                                  'firstName': _firstNameController.text.trim(),
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

                                    // Navigate based on the presence of a customer ID
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
                                          builder: (context) => const Wrapper(),
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
                            text: "Already have account? ",
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
        ],
      ),
    );
  }

  void _showErrorDialog(String message, bool isSuccess) {
    Get.snackbar(
      isSuccess ? "Success" : "Error",
      message,
      backgroundColor: isSuccess ? Colors.green : Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      icon: isSuccess ? const Icon(Icons.check) : const Icon(Icons.error),
    );
  }
}
