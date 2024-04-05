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

  void updateIndex(int newIndex) {
    setState(() {
      pageIndex = newIndex;
    });
  }

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
              secondWidget(screenHeight, cardWidth)
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
              updateIndex(1);
            },
            child: const Text('Join Blinderville')),
        SizedBox(height: 25),
      ],
    );
  }

  Widget secondWidget(
    double screenHeight,
    double cardWidth,
  ) {
    return Row(
      children: [
        Image(
            image: AssetImage('assets/images/3.png'), height: double.infinity),
        Expanded(
          flex: 6,
          child: Column(
            children: [
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'WELCOME TO',
                          textScaler: TextScaler.linear(2.8),
                          style: TextStyle(
                              color: Color.fromARGB(255, 120, 67, 255)),
                        ),
                        Text(
                          'BLINDERVILLE',
                          textScaler: TextScaler.linear(2.8),
                          style: TextStyle(
                              color: Color.fromARGB(255, 120, 67, 255)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Text("THE BASICS"),
              SizedBox(height: 50),
            ],
          ),
        )
      ],
    );
  }
}
