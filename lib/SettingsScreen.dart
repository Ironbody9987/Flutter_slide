import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _ipController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _databaseController = TextEditingController();

  final FocusNode _ipFocus = FocusNode();
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _databaseFocus = FocusNode();

  @override
  void dispose() {
    _ipController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _databaseController.dispose();
    _ipFocus.dispose();
    _usernameFocus.dispose();
    _passwordFocus.dispose();
    _databaseFocus.dispose();
    super.dispose();
  }

  void _submitSettings(BuildContext dialogContext) {
    if (_ipController.text.isNotEmpty &&
        _usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _databaseController.text.isNotEmpty) {
      print(
        "IP: ${_ipController.text}, Username: ${_usernameController.text}, Password: ${_passwordController.text}, Database: ${_databaseController.text}",
      );
      Navigator.of(dialogContext).pop(); // Close Popup
    }
  }

  void _clearInputs(BuildContext dialogContext) {
    _ipController.clear();
    _usernameController.clear();
    _passwordController.clear();
    _databaseController.clear();

    // Refocus back to IP field
    Future.delayed(Duration(milliseconds: 100), () {
      FocusScope.of(dialogContext).requestFocus(_ipFocus);
    });
  }

  void _showSettingsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          titlePadding: const EdgeInsets.all(10),
          title: Column(
            children: [
              const Text(
                'ຈັດການຕັ້ງຄ່າ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 3),
              SizedBox(
                width: 130,
                child: const Divider(thickness: 1.5, color: Colors.black),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTextField(
                  _ipController,
                  'IP',
                  focusNode: _ipFocus,
                  nextFocus: _usernameFocus,
                  dialogContext: dialogContext,
                ),
                _buildTextField(
                  _usernameController,
                  'Username',
                  focusNode: _usernameFocus,
                  nextFocus: _passwordFocus,
                  dialogContext: dialogContext,
                ),
                _buildTextField(
                  _passwordController,
                  'Password',
                  focusNode: _passwordFocus,
                  nextFocus: _databaseFocus,
                  obscureText: true,
                  dialogContext: dialogContext,
                ),
                _buildTextField(
                  _databaseController,
                  'Database',
                  focusNode: _databaseFocus,
                  isLast: true,
                  dialogContext: dialogContext,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _clearInputs(dialogContext);
              },
              child: const Text('Cancel', style: TextStyle(color: Colors.red)),
            ),
            ElevatedButton(
              onPressed: () {
                _submitSettings(dialogContext);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label, {
    bool obscureText = false,
    FocusNode? focusNode,
    FocusNode? nextFocus,
    bool isLast = false,
    required BuildContext dialogContext,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
        ),
        obscureText: obscureText,
        textInputAction: isLast ? TextInputAction.done : TextInputAction.next,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ການຕັ້ງຄ່າ'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: _showSettingsDialog,
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'ໜ້າການຕັ້ງຄ່າ',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
