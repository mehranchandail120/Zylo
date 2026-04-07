import 'package:flutter/material.dart';
import 'main_layout.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0F2FE), Color(0xFF0284C7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: const [
                    BoxShadow(color: Colors.black26, blurRadius: 30, offset: Offset(0, 10))
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      isLogin ? 'Log In' : 'Sign Up',
                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Color(0xFF1F2937)),
                    ),
                    const SizedBox(height: 24),
                    _buildTextField(Icons.person, 'Username'),
                    if (!isLogin) const SizedBox(height: 16),
                    if (!isLogin) _buildTextField(Icons.email, 'Email Address'),
                    const SizedBox(height: 16),
                    _buildTextField(Icons.lock, 'Password', isPassword: true),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MainLayout()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0284C7),
                        minimumSize: const Size(double.infinity, 55),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        elevation: 5,
                      ),
                      child: Text(
                        isLogin ? 'LOG IN' : 'SIGN UP',
                        style: const TextStyle(fontWeight: FontWeight.w900, letterSpacing: 2),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () => setState(() => isLogin = !isLogin),
                      child: Text(
                        isLogin ? "Don't have an account? Sign Up" : "Already have an account? Log In",
                        style: const TextStyle(color: Color(0xFF6B7280), fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hint, {bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF9CA3AF)),
          prefixIcon: Icon(icon, color: const Color(0xFF9CA3AF)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
      ),
    );
  }
}