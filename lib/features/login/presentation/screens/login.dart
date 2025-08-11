import 'package:flutter/material.dart';
import 'package:lifely/core/constants/user_demo_credentials.dart';
import 'package:lifely/core/theme/app_colors.dart';
import 'package:lifely/features/login/presentation/screens/user_roles.dart';
import 'package:lifely/features/login/presentation/widgets/custom_text_form_field.dart';
import 'package:lifely/features/student_view/presentation/screens/student_view.dart';
import 'package:lifely/features/teacher_view/presentation/screens/teacher_view.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<bool> _isSelectedRole = [true, false];
  UserRoles selectedRole = UserRoles.student;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  void loginHandle() {
    final correctCreds = demoCredentials[selectedRole];
    print(
      'In method $selectedRole -- ${usernameController.text} -- ${passwordController.text}',
    );
    if (usernameController.text.trim() == correctCreds['username'] &&
        passwordController.text.trim() == correctCreds['password']) {
      if (selectedRole == UserRoles.student) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const StudentView()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const TeacherView()),
        );
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Invalid credentials')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              height: 500,
              constraints: const BoxConstraints(maxWidth: 400),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 228, 228, 228),
                    spreadRadius: 2,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Lifely',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        controller: usernameController,
                        hintText: 'Username',
                        isObscure: false,
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        controller: passwordController,
                        hintText: 'Password',
                        isObscure: true,
                      ),

                      const SizedBox(height: 20),
                      ToggleButtons(
                        isSelected: _isSelectedRole,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        selectedColor: Colors.white,
                        selectedBorderColor: AppColors.primaryAppColor,
                        fillColor: AppColors.primaryAppColor,
                        borderWidth: 2,
                        borderColor: AppColors.primaryAppColor,
                        onPressed: (int index) {
                          setState(() {
                            for (int i = 0; i < _isSelectedRole.length; i++) {
                              _isSelectedRole[i] = i == index;
                            }
                            selectedRole = index == 0
                                ? UserRoles.student
                                : UserRoles.teacher;
                          });
                          print(selectedRole);
                        },
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'Student',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'Teacher',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              loginHandle();
                            }
                          },
                          child: const Text('Login'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
