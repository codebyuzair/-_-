import 'package:flutter/material.dart';
import 'package:myapp/screens/quote.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  final _formKey = GlobalKey<FormState>();
  String name = "";

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("images/quote.png",
                      color: Colors.black, width: 190, height: 190),
                  const SizedBox(height: 10),
                  const Text(
                    "Random Quotes Generator",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      // color: Color(0x8a2e2b2b),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "One App for all inspirations, where you can generate Quotes randomly",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Color(0x8a2e2b2b),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter your Name",
                      floatingLabelStyle: const TextStyle(
                        color: Colors.purple,
                      ),
                      // ignore: avoid_unnecessary_containers
                      suffixIcon: Container(
                        child: IconButton(
                          icon: const Icon(Icons.arrow_forward_ios),
                          color: const Color(0xFF222222),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => QuoteScreen(
                                    name: name,
                                  ),
                                ),
                              );
                            }
                          },
                          
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple
                            // color: Color(0x8a2e2b2b),
                            ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter your name";
                      }
                      return null;
                    },
                    onSaved: (newValue) => name = newValue!,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }
}
