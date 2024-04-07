import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  int pageIndex = 0;

  void incrementIndex() {
    setState(() {
      pageIndex = pageIndex + 1;
    });
  }

  void decrementIndex() {
    setState(() {
      pageIndex = pageIndex - 1;
    });
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController zipcodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final cardWidth = screenWidth * 0.6;

    return Scaffold(
      body: Center(
          child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.0),
        ),
        child: SizedBox(
          height: screenHeight * 0.7,
          width: cardWidth,
          child: Flexible(
            child: [
              initialWidget(screenHeight, cardWidth),
              userDataWidget(
                  screenHeight,
                  cardWidth,
                  emailController,
                  "Your Email",
                  AssetImage('assets/images/3.png'),
                  Icon(Icons.mail),
                  "Your email will not be visible to others. It is required to create an account."),
              userDataWidget(
                  screenHeight,
                  cardWidth,
                  passwordController,
                  "Make a password",
                  AssetImage('assets/images/4.png'),
                  Icon(Icons.password),
                  "To have a secure password, please make sure it is greater than 8 characters, and contains special characters and numbers."),
              userDataWidget(
                  screenHeight,
                  cardWidth,
                  usernameController,
                  "Create a username",
                  AssetImage('assets/images/5.png'),
                  Icon(Icons.person),
                  "Your username is how other people will identify you, so make sure it's a nice one!"),
              userDataWidget(
                  screenHeight,
                  cardWidth,
                  zipcodeController,
                  "Your zipcode",
                  AssetImage('assets/images/6.png'),
                  Icon(Icons.location_city_rounded),
                  "Your zipcode is required so we can show you what's happening around you! Don't worry, nobody can see it except us!")
            ][pageIndex],
          ),
        ),
      )),
    );
  }

  Widget _buildImage(String imagePath, double cardWidth) {
    return SizedBox(
      width: cardWidth / 5, // Divide by number of images for equal width
      child: ClipRect(child: Image(image: AssetImage(imagePath))),
    );
  }

  Widget initialWidget(double screenHeight, double cardWidth) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * 0.15,
              child: Image(
                image: AssetImage('assets/images/logo1.png'),
              ).animate().fadeIn(duration: 1000.ms),
            ),
            Text(
              'A Community For Relationships',
              style: TextStyle(
                color: Color.fromARGB(255, 244, 180, 68),
                fontWeight: FontWeight.bold,
              ),
              textScaler: TextScaler.linear(1.9),
            ).animate().shimmer(duration: 1000.ms)
          ],
        ),
        SizedBox(height: 25),
        Text(
          'Meet first, Match Later',
          textScaler: TextScaler.linear(1.5),
          style: TextStyle(
            color: Color.fromARGB(255, 120, 67, 255),
            fontWeight: FontWeight.bold,
          ),
        ).animate().slide(duration: 500.ms),
        Flexible(
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              _buildImage('assets/images/1.png', cardWidth)
                  .animate()
                  .slideY(delay: 25.ms),
              _buildImage('assets/images/3.png', cardWidth)
                  .animate()
                  .slideY(delay: 50.ms),
              _buildImage('assets/images/4.png', cardWidth)
                  .animate()
                  .slideY(delay: 75.ms),
              _buildImage('assets/images/5.png', cardWidth)
                  .animate()
                  .slideY(delay: 100.ms),
              _buildImage('assets/images/6.png', cardWidth)
                  .animate()
                  .slideY(delay: 125.ms),
            ],
          ),
        ),
        SizedBox(
          width: cardWidth / 1.2,
          child: Text(
            'You are so much more than your photo. Let others discover the real you and discover others for who they really are. Make meaningful relationships first. Your soulmate will follow.',
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromARGB(255, 120, 67, 255),
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 15),
        Text(
          "By signing up to Blinderville's you agree to our terms of service. Learn how we process your data in our privacy policy and our cookies policy.",
          textScaler: TextScaler.linear(0.7),
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
        SizedBox(height: 15),
        FilledButton(
            onPressed: () {
              incrementIndex();
            },
            child: const Text('Join Blinderville')),
        SizedBox(height: 25),
      ],
    );
  }

  Widget userDataWidget(
      double screenHeight,
      double cardWidth,
      TextEditingController emailController,
      String label,
      AssetImage image,
      Icon labelIcon,
      String infoText,
      {Widget? customWidget,
      String? titleLine1,
      String? titleLine2,
      String? subtitle}) {
    return Row(
      children: [
        Image(image: image, height: double.infinity),
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                SizedBox(height: 40),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          titleLine1 ?? 'WELCOME TO',
                          textScaler: TextScaler.linear(2.5),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 120, 67, 255)),
                        ),
                        Text(
                          titleLine2 ?? 'BLINDERVILLE',
                          textScaler: TextScaler.linear(2.3),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 120, 67, 255)),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Row(
                  children: [
                    Text(
                      subtitle ?? 'THE BASICS',
                      textScaler: TextScaler.linear(2),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 120, 67, 255)),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                TextField(
                  controller: emailController,
                  maxLines: 1,
                  decoration: InputDecoration(
                      prefixIcon: labelIcon,
                      labelText: label,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
                SizedBox(height: 10),
                Text(
                  infoText,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                Expanded(child: Container()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilledButton(
                        onPressed: () {
                          decrementIndex();
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 7, 7, 10),
                          child: Text('Back'),
                        )),
                    FilledButton(
                        onPressed: () {
                          incrementIndex();
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 7, 7, 10),
                          child: Text('Next'),
                        ))
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
