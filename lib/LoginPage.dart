import 'package:app2/Drawer_menu.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  bool _isObscure = true;
  bool _isLoginHovered = false;
  bool _isSignupHovered = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _usernameFocus.addListener(() => setState(() {}));
    _passwordFocus.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _usernameFocus.dispose();
    _passwordFocus.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget logo(double size) {
    return Image.asset(
      "images/logo.png",
      fit: BoxFit.cover,
      width: size * 0.35,
      height: size * 0.35,
    );
  }

  Widget textShop(double fontSize) {
    return Text(
      'BSCP6B Mart',
      style: TextStyle(
        fontSize: 25,
        fontFamily: "FiraSans",
        fontWeight: FontWeight.bold,
        color: Colors.amber.shade900,
      ),
    );
  }

  Widget inputField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    required FocusNode focusNode,
    bool isPassword = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        obscureText: isPassword ? _isObscure : false,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color:
                focusNode.hasFocus
                    ? const Color.fromARGB(255, 243, 145, 33)
                    : Colors.grey,
          ),
          suffixIcon:
              isPassword
                  ? IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  )
                  : null,
          labelText: label,
          labelStyle: TextStyle(
            color: focusNode.hasFocus ? Colors.blue : Colors.grey,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 16,
          ),
        ),
      ),
    );
  }

  Widget loginButtons(double buttonWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MouseRegion(
            onEnter: (_) => setState(() => _isLoginHovered = true),
            onExit: (_) => setState(() => _isLoginHovered = false),
            child: SizedBox(
              width: buttonWidth,
              child: ElevatedButton(
                onPressed:
                    _isLoading
                        ? null
                        : () async {
                          setState(() => _isLoading = true);
                          await Future.delayed(const Duration(seconds: 1));
                          setState(() => _isLoading = false);

                          // ไปที่หน้า Drawer_Menu โดยไม่ตรวจสอบข้อมูล
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (c) => Drawer_Menu()),
                          );
                        },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _isLoginHovered ? Colors.blue.shade900 : Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child:
                    _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: "FiraSans",
                          ),
                        ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          MouseRegion(
            onEnter: (_) => setState(() => _isSignupHovered = true),
            onExit: (_) => setState(() => _isSignupHovered = false),
            child: SizedBox(
              width: buttonWidth,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _isSignupHovered ? Colors.green.shade700 : Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: const Text(
                  "Signup",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: "FiraSans",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double paddingValue = screenWidth * 0.08;
          double fontSize = screenWidth < 400 ? 20 : 24;
          double buttonWidth = screenWidth * 0.35;

          return Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                colors: [Colors.white, Color.fromARGB(255, 51, 254, 129)],
                center: Alignment.center,
                radius: 1.0,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: paddingValue),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        logo(screenWidth),
                        const SizedBox(height: 18),
                        textShop(fontSize),
                        const SizedBox(height: 28),
                        inputField(
                          label: "Username",
                          icon: Icons.person,
                          controller: _usernameController,
                          focusNode: _usernameFocus,
                        ),
                        inputField(
                          label: "Password",
                          icon: Icons.lock,
                          isPassword: true,
                          controller: _passwordController,
                          focusNode: _passwordFocus,
                        ),
                        loginButtons(buttonWidth),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
