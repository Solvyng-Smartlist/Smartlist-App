import "package:country_picker/country_picker.dart";
import "package:flutter/material.dart";
import "package:login_screen/provider/auth_provider.dart";
import "package:login_screen/widgets/custom_button.dart";
import "package:provider/provider.dart";

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool agreeToTerms = false;

  Country selectedCountry = Country(
    phoneCode: "27", // South Africa phone code
    countryCode: "ZA", // South Africa country code
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "South Africa", // Country name
    example: "South Africa", // Example
    displayName: "South Africa", // Display name
    displayNameNoCountryCode: "ZA", // Display name without country code
    e164Key: "",
  );

  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
      TextPosition(offset: phoneController.text.length),
    );
    return Scaffold(
        body: SafeArea(
        child: SingleChildScrollView(
        child: Center(
        child: Padding(
        padding: const EdgeInsets.symmetric(
        vertical: 25,
        horizontal: 35,
    ),
    child: Column(
    children: [
    SizedBox(
    width: 200,
    height: 200,
    child: Image.asset('assets/Grocery_bag.png'),
    ),
    const SizedBox(
    height: 20,
    ),
    const Text(
    "Register",
    style: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    ),
    ),
    const SizedBox(height: 10),


                const SizedBox(height: 20),
                TextFormField(
                  cursorColor: Colors.purple,
                  controller: fullNameController,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    hintText: "Full Name",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.grey.shade600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  cursorColor: Colors.purple,
                  controller: emailController,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.grey.shade600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  cursorColor: Colors.purple,
                  controller: passwordController,
                  obscureText: true,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.grey.shade600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  cursorColor: Colors.purple,
                  controller: phoneController,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  onChanged: (value) {
                    setState(() {
                      phoneController.text = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Enter phone number",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.grey.shade600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(12.0),
                      child: InkWell(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            countryListTheme: const CountryListThemeData(
                              bottomSheetHeight: 500,
                            ),
                            onSelect: (value) {
                              setState(() {
                                selectedCountry = value;
                              });
                            },
                          );
                        },
                        child: Text(
                           "${selectedCountry.flagEmoji} +${selectedCountry.phoneCode}",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    suffixIcon: phoneController.text.length > 9
                        ? Container(
                        height: 30,
                        width: 30,

                        margin: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: const Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 20,
                        ))
                        : null,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: agreeToTerms,
                      onChanged: (value) {
                        setState(() {
                          agreeToTerms = value!;
                        });
                      },
                    ),
                    const Text("Agree to terms and conditions"),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                    text: "Register",
                    onPressed: () => sendPhoneNumberAndVerify(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    )
    );
  }

  void sendPhoneNumberAndVerify() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    ap.signInWithPhone(
      context,
      "+${selectedCountry.phoneCode}$phoneNumber",
    );
  }
}
