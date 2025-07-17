import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'printers.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _srCodeController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PrintersPage(srCode: _srCodeController.text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevent scrolling
      body: GestureDetector(
        // Unfocus when tapping outside fields
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            // Hero image at the top
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/login.jpg',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  // Gradient fade overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.white.withOpacity(0.9),
                        ],
                        stops: const [0.7, 1.0],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Form section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Title with more space above
                      const SizedBox(
                        height: 15,
                      ), // Added space between image and title
                      Text(
                        'CAMPUS PRINT',
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          letterSpacing: 1.0,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // SR-Code Field
                      _CustomTextField(
                        label: 'SR-CODE',
                        controller: _srCodeController,
                        hintText: '12-34567',
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9-]')),
                          LengthLimitingTextInputFormatter(8),
                          _SRCodeFormatter(),
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your SR-Code';
                          }
                          final regex = RegExp(r'^\d{2}-\d{5}$');
                          if (!regex.hasMatch(value)) {
                            return 'Format: ##-##### (e.g., 22-01850)';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),

                      // Password Field
                      _CustomTextField(
                        label: 'PASSWORD',
                        controller: _passwordController,
                        hintText: 'Enter your password',
                        obscureText: !_isPasswordVisible,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey.shade600,
                          ),
                          onPressed: () => setState(
                            () => _isPasswordVisible = !_isPasswordVisible,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 4) {
                            return 'Password must be at least 4 characters';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 40),

                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: _handleLogin,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFDC143C),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 4,
                          ),
                          child: Text(
                            'LOG IN',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
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
      ),
    );
  }

  @override
  void dispose() {
    _srCodeController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

// Reusable Custom Text Field Widget
class _CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  const _CustomTextField({
    required this.label,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.inputFormatters,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          inputFormatters: inputFormatters,
          validator: validator,
          style: GoogleFonts.poppins(fontSize: 16),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(color: Colors.grey.shade500),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: Color(0xFFDC143C), width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            suffixIcon: suffixIcon,
            errorStyle: GoogleFonts.poppins(
              color: const Color(0xFFDC143C),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

// Simplified SR-Code Formatter
class _SRCodeFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    if (text.length == 3 && !text.contains('-')) {
      return TextEditingValue(
        text: '${text.substring(0, 2)}-${text.substring(2)}',
        selection: TextSelection.collapsed(offset: 4),
      );
    }
    return newValue;
  }
}
