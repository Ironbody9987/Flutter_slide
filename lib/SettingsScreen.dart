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

  void _clearInputs() {
    _ipController.clear();
    _usernameController.clear();
    _passwordController.clear();
    _databaseController.clear();
  }

  void _showSettingsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.all(10),
          title: Column(
            children: [
              const Text(
                'ຈັດການຕັ້ງຄ່າ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 3), // ลดช่องว่าง
              SizedBox(
                width: 130, // ปรับให้เส้นพอดีกับข้อความ
                child: const Divider(
                  thickness: 1.5,
                  color: Colors.black,
                ), // เส้นบางลง
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(_ipController, 'IP'),
              _buildTextField(_usernameController, 'Username'),
              _buildTextField(
                _passwordController,
                'Password',
                obscureText: true,
              ),
              _buildTextField(_databaseController, 'Database'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      String ip = _ipController.text;
                      String username = _usernameController.text;
                      String password = _passwordController.text;
                      String database = _databaseController.text;

                      print(
                        "IP: $ip, Username: $username, Password: $password, Database: $database",
                      );
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      _clearInputs();
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label, {
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
        ),
        obscureText: obscureText,
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
