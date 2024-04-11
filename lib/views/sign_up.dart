import 'package:blinderville/utilities/api.dart';
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
  String dropDownValue = 'Agender'; // Default value
  TextEditingController otherGenderController = TextEditingController();
  bool isOtherSelected = false;
  bool isChecked = false;
  bool isChecked2 = false;
  List<Map<String, String>> infoList = [
    {
      "field": "Birthday",
      "question":
          "Please elaborate. What does age mean to you? Do you believe that your romantic partner should be similar in age? How old is too old, and how young is too young?"
    },
    {
      "field": "Height",
      "question":
          "How do you feel about your height? Do you have a preference in the height of your romantic partner?"
    },
    {
      "field": "Weight",
      "question":
          "Please elaborate. What is your body type? (Athletic, Soft, Jacked, Curvy etc.) and how important is the weight of your romantic partner?"
    },
    {
      "field": "Race",
      "question":
          "Please elaborate. What ethnicity or nationality do you identify with? Do you identify as more than one race, nationality or ethnicity? Do you have a preference for race in your partner?"
    },
    {"field": "Kids", "question": "Please elaborate, tell us more!"},
    {
      "field": "Education",
      "question":
          "What is your education level? Is your partner's level of education important to you?"
    },
    {
      "field": "Smokes",
      "question": "Does it matter to you if your partner smokes?"
    },
    {
      "field": "Religion",
      "question":
          "Please elaborate. How devout are you? How important is your partner's religion to you?"
    },
    {
      "field": "Occupation",
      "question":
          "Please elaborate. Do you enjoy what you do? How long have you been employed in this occupation? Does your partner's occupation matter?"
    },
    {
      "field": "Political View",
      "question":
          "Please elaborate. How active are you politically? Where do you get your political information? How important are your partner's political views?"
    },
    {"field": "Social Media", "question": "Do you use social media?"},
    {"field": "Share Gender ID", "question": "What do you want people to know?"}
  ];

  List goodStuffList = [
    "DESCRIBE YOURSELF MORE FULLY",
    "Give us the details",
    "WHAT DO YOU KNOW TO BE TRUE?",
    "Come up with something nice",
    "WHAT DO YOU WANT OUT OF LIFE?",
    "It can be anything",
    "WHAT TURNS YOU ON?",
    "Don't be shy",
    "PET PEEVES?",
    "We all have 'em"
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    otherGenderController.dispose();
    super.dispose();
  }

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

  void sendReq() async {
    // Hardcoded bioQuestions object
    Map<String, dynamic> bioQuestions = {
      "Birthday": {
        "primaryAnswer": birthdayController.text,
        "secondaryAnswer": birthdayQuestionController.text,
      },
      "Height": {
        "primaryAnswer": heightController.text,
        "secondaryAnswer": heightQuestionController.text,
      },
      "Weight": {
        "primaryAnswer": weightController.text,
        "secondaryAnswer": weightQuestionController.text,
      },
      "Race": {
        "primaryAnswer": raceController.text,
        "secondaryAnswer": raceQuestionController.text,
      },
      "Kids": {
        "primaryAnswer": kidsController.text,
        "secondaryAnswer": kidsQuestionController.text,
      },
      "Education": {
        "primaryAnswer": educationController.text,
        "secondaryAnswer": educationQuestionController.text,
      },
      "Smokes": {
        "primaryAnswer": smokesController.text,
        "secondaryAnswer": smokesQuestionController.text,
      },
      "Religion": {
        "primaryAnswer": religionController.text,
        "secondaryAnswer": religionQuestionController.text,
      },
      "Occupation": {
        "primaryAnswer": occupationController.text,
        "secondaryAnswer": occupationQuestionController.text,
      },
      "Political View": {
        "primaryAnswer": politicalViewController.text,
        "secondaryAnswer": politicalViewQuestionController.text,
      },
      "Social Media": {
        "primaryAnswer": socialMediaController.text,
        "secondaryAnswer": socialMediaQuestionController.text,
      },
      "Share Gender ID": {
        "primaryAnswer": shareGenderIdController.text,
        "secondaryAnswer": shareGenderIdQuestionController.text,
      },
    };
    print({
      'username': usernameController.text,
      'email': emailController.text,
      'zipCode': zipcodeController.text,
      'password': passwordController.text,
      'bioQuestions': {
        "test": {"test": "etst", "test": "etst"}
      },
    });

    // Send request with bioQuestions
    final resp = await dio.post('/users/', data: {
      'username': usernameController.text,
      'email': emailController.text,
      'zipCode': zipcodeController.text,
      'password': passwordController.text,
      'bioQuestions': bioQuestions,
    });

    print(resp);
    print({
      'username': usernameController.text,
      'email': emailController.text,
      'zipCode': zipcodeController.text,
      'password': passwordController.text,
      'bioQuestions': bioQuestions,
    });
  }

  void _showBottomSheet(
    BuildContext context,
    String field,
    String question,
    TextEditingController fieldController,
    TextEditingController questionController,
  ) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 50,
                child: TextField(
                  controller: fieldController,
                  style: TextStyle(fontSize: 12),
                  maxLines: 14,
                  decoration: InputDecoration(
                    label: Text(field),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    filled: true,
                  ),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 200,
                child: TextField(
                  controller: questionController,
                  style: TextStyle(fontSize: 12),
                  maxLines: 14,
                  decoration: InputDecoration(
                    label: Text(question),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    filled: true,
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Do something with the updated field and question
                  print("Updated Field: ${fieldController.text}");
                  print("Updated Question: ${questionController.text}");
                  Navigator.pop(context);
                },
                child: Text("Save"),
              ),
            ],
          ),
        );
      },
    );
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController zipcodeController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController birthdayQuestionController =
      TextEditingController();

  final TextEditingController heightController = TextEditingController();
  final TextEditingController heightQuestionController =
      TextEditingController();

  final TextEditingController weightController = TextEditingController();
  final TextEditingController weightQuestionController =
      TextEditingController();

  final TextEditingController raceController = TextEditingController();
  final TextEditingController raceQuestionController = TextEditingController();

  final TextEditingController kidsController = TextEditingController();
  final TextEditingController kidsQuestionController = TextEditingController();

  final TextEditingController educationController = TextEditingController();
  final TextEditingController educationQuestionController =
      TextEditingController();

  final TextEditingController smokesController = TextEditingController();
  final TextEditingController smokesQuestionController =
      TextEditingController();

  final TextEditingController religionController = TextEditingController();
  final TextEditingController religionQuestionController =
      TextEditingController();

  final TextEditingController occupationController = TextEditingController();
  final TextEditingController occupationQuestionController =
      TextEditingController();

  final TextEditingController politicalViewController = TextEditingController();
  final TextEditingController politicalViewQuestionController =
      TextEditingController();

  final TextEditingController socialMediaController = TextEditingController();
  final TextEditingController socialMediaQuestionController =
      TextEditingController();

  final TextEditingController shareGenderIdController = TextEditingController();
  final TextEditingController shareGenderIdQuestionController =
      TextEditingController();

  late List<List<TextEditingController>> controllerPairs = [
    [birthdayController, birthdayQuestionController],
    [heightController, heightQuestionController],
    [weightController, weightQuestionController],
    [raceController, raceQuestionController],
    [kidsController, kidsQuestionController],
    [educationController, educationQuestionController],
    [smokesController, smokesQuestionController],
    [religionController, religionQuestionController],
    [occupationController, occupationQuestionController],
    [politicalViewController, politicalViewQuestionController],
    [socialMediaController, socialMediaQuestionController],
    [shareGenderIdController, shareGenderIdQuestionController],
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final cardWidth = screenWidth * 0.7;
    const List<String> genderList = <String>[
      'Agender',
      'Androgyne',
      'Bigender',
      'Butch',
      'Cis-Male',
      'Cis-Female',
      'Gender Expansive',
      'Gender Fluid',
      'Gender Outlaw',
      'Genderqueer',
      'Non-Binary',
      'Omnigender',
      'Polygender/Pangender',
      'Trans-Male',
      'Trans-Female',
      'Other'
    ];
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
                AssetImage('assets/images/7.png'),
                Icon(Icons.location_city_rounded),
                "This info will NOT be available to others unless you choose to make it available. You will NOT be able to change this unless a special request is made and granted, and typically only once. Please click next if you want to skip for now",
                customWidget: genderRow(genderList),
                titleLine1: "THANKS FOR",
                titleLine2: "JOINING US!",
                subtitle: "ABOUT YOU"),
            userDataWidget(
                screenHeight,
                cardWidth,
                zipcodeController,
                "Your zipcode",
                AssetImage('assets/images/3.png'),
                Icon(Icons.location_city_rounded),
                "This will be visible to others. Click NEXT if you want to skip now.",
                customWidget: introBox(screenHeight),
                titleLine1: "THANKS FOR",
                titleLine2: "JOINING US!",
                subtitle: "ABOUT YOU"),
            informationWidget(screenHeight),
            imageWidget(screenHeight),
            goodStuff(screenHeight),
            finishWidget()
          ][pageIndex],
        ),
      )),
    );
  }

  Widget introBox(screenHeight) {
    return SizedBox(
      height: screenHeight / 8,
      child: TextField(
        maxLength: 140,
        style: TextStyle(fontSize: 12),
        maxLines: 14,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          filled: true,
          hintStyle: TextStyle(fontSize: 12),
          hintText: "Describe yourself!",
        ),
      ),
    );
  }

  Widget genderRow(List<String> genderList) {
    return Row(
      children: [
        Text('I am', style: TextStyle(fontSize: 24)),
        SizedBox(width: 30),
        Expanded(
          child: isOtherSelected
              ? TextFormField(
                  controller: otherGenderController,
                  decoration: InputDecoration(
                    labelText: 'Specify your gender',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                )
              : DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Select your gender',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                  value: dropDownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropDownValue = newValue!;
                      isOtherSelected = newValue == "Other";
                    });
                  },
                  items:
                      genderList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
        ),
      ],
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
              height: screenHeight * 0.1,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          textAlign: TextAlign.left,
                          titleLine1 ?? 'WELCOME TO',
                          textScaler: TextScaler.linear(2.3),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 120, 67, 255)),
                        ),
                        Text(
                          textAlign: TextAlign.left,
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
                SizedBox(height: screenHeight / 25),
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
                SizedBox(height: screenHeight / 25),
                customWidget ??
                    TextField(
                      controller: emailController,
                      maxLines: 1,
                      decoration: InputDecoration(
                          prefixIcon: labelIcon,
                          labelText: label,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
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

  Widget informationWidget(double screenHeight) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          Text('YOU CONTROL YOUR INFORMATION!',
              textScaler: TextScaler.linear(2),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Color.fromARGB(255, 244, 180, 68))),
          SizedBox(height: 10),
          Text(
            'NOW THINGS ARE GETTING REALLY INTERESTING',
            textScaler: TextScaler.linear(1.6),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 120, 67, 255)),
          ),
          Row(
            children: [
              Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                          "Fill in only the information you want to share.Anything you don't, just leave blank.",
                        ),
                        SizedBox(height: 15),
                        Text(
                          "If others want to see what you share, YOU will get paid for it.",
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Content that you are willing to share must include an elaboration",
                        ),
                        SizedBox(height: 15),
                        Text(
                          "You will be able to update any of this information at any time, except Gender Identity where certain rules apply*",
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Any information you choose to share must not be intentionally misleading. Violation of this rule may result in a permanent ban.",
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Don't give this information away! Let others get to know you on the inside first.",
                        ),
                        SizedBox(height: 15),
                        ListTile(
                          leading: Checkbox(
                            value: isChecked,
                            onChanged: (bool? newValue) {
                              setState(() {
                                isChecked = !isChecked;
                              });
                            },
                          ),
                          title: Text(
                            "I certify the info provided is true and accurate to the best of my knowledge. I understand that Blinderville reserves the right to suspend my account if I violate it's terms and conditions.",
                            textScaler: TextScaler.linear(0.6),
                          ),
                        )
                      ],
                    ),
                  )),
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight / 2.2,
                      child: ListView.builder(
                        itemCount: (infoList.length / 2).ceil(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          int pairIndex = index * 2;
                          Map<String, String>? pair1 = infoList[pairIndex];
                          Map<String, String>? pair2 =
                              infoList.length > pairIndex + 1
                                  ? infoList[pairIndex + 1]
                                  : null;

                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: FilledButton(
                                    onPressed: () {
                                      _showBottomSheet(
                                        context,
                                        pair1["field"]!,
                                        pair1["question"] ??
                                            "", // Provide a default value
                                        controllerPairs[pairIndex]
                                            [0], // Field controller
                                        controllerPairs[pairIndex]
                                            [1], // Question controller
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(pair1["field"] ?? ""),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: pair2 != null
                                      ? FilledButton(
                                          onPressed: () {
                                            _showBottomSheet(
                                              context,
                                              pair2["field"]!,
                                              pair2["question"] ??
                                                  "", // Provide a default value
                                              controllerPairs[pairIndex + 1]
                                                  [0], // Field controller
                                              controllerPairs[pairIndex + 1]
                                                  [1], // Question controller
                                            );
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(pair2["field"] ?? ""),
                                          ),
                                        )
                                      : SizedBox.shrink(),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FilledButton(
                              onPressed: () {
                                decrementIndex();
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 7, 7, 10),
                                child: Text('Back'),
                              )),
                          isChecked == true
                              ? Text("")
                              : Text("Please tick the checkbox to continue"),
                          FilledButton(
                              onPressed: () {
                                if (isChecked == true) {
                                  incrementIndex();
                                }
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 7, 7, 10),
                                child: Text('Next'),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ]));
  }

  Widget imageWidget(double screenHeight) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          Text('YOU CONTROL YOUR INFORMATION!',
              textScaler: TextScaler.linear(2),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Color.fromARGB(255, 244, 180, 68))),
          Row(
            children: [
              Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'PHOTOS',
                          textAlign: TextAlign.center,
                          textScaler: TextScaler.linear(1.6),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 120, 67, 255)),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "You are so much more than just your good looks. You are beautiful in many ways, so let your personality, not your photo, take center stage.",
                        ),
                        SizedBox(height: 15),
                        Text(
                            "However, some people really want to see your great smile. If you want to show them, you can get paid*"),
                        SizedBox(height: 15),
                        Text(
                          "You do not need to share photos EVER. But if you do, there are some rules:",
                        ),
                        SizedBox(height: 15),
                        Text(
                          "• You must be in the photo",
                        ),
                        SizedBox(height: 7),
                        Text(
                          "• Your whole face must be visible",
                        ),
                        SizedBox(height: 7),
                        Text(
                          "• No blurry, far away or group photos",
                        ),
                        SizedBox(height: 7),
                        Text("• No illegal activity or nudes"),
                        SizedBox(height: 15),
                        Text("*See FAQ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 120, 67, 255))),
                        ListTile(
                          leading: Checkbox(
                            value: isChecked2,
                            onChanged: (bool? newValue) {
                              setState(() {
                                isChecked2 = !isChecked2;
                              });
                            },
                          ),
                          title: Text(
                            "I certify the info provided is true and accurate to the best of my knowledge. I understand that Blinderville reserves the right to suspend my account if I violate it's terms and conditions.",
                            textScaler: TextScaler.linear(0.6),
                          ),
                        )
                      ],
                    ),
                  )),
              Expanded(
                  flex: 6,
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Text(
                          "",
                          textScaler: TextScaler.linear(1.6),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                color: Colors.black38,
                                child: Padding(
                                  padding: const EdgeInsets.all(60.0),
                                  child: Icon(
                                    Icons.image,
                                    size: 40,
                                  ),
                                )),
                            SizedBox(width: 10),
                            Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                color: Colors.black38,
                                child: Padding(
                                  padding: const EdgeInsets.all(60.0),
                                  child: Icon(
                                    Icons.image,
                                    size: 40,
                                  ),
                                )),
                            SizedBox(width: 10),
                            Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                color: Colors.black38,
                                child: Padding(
                                  padding: const EdgeInsets.all(60.0),
                                  child: Icon(
                                    Icons.image,
                                    size: 40,
                                  ),
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 300,
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text(
                                      "Upload as many photos as you want or none at all. It's up to you!",
                                    ),
                                    SizedBox(height: 7),
                                    Text(
                                      "Photos with a description or caption garner more views.",
                                    ),
                                    SizedBox(height: 7),
                                    Text(
                                      "Photos will be vetted to ensure Blinderville rules are followed. This may take up to two days.",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                color: Colors.black38,
                                child: Padding(
                                  padding: const EdgeInsets.all(60.0),
                                  child: Icon(
                                    Icons.add,
                                    size: 42,
                                  ),
                                )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FilledButton(
                                  onPressed: () {
                                    decrementIndex();
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 7, 7, 10),
                                    child: Text('Back'),
                                  )),
                              isChecked2 == true
                                  ? Text("")
                                  : Text(
                                      "Please tick the checkbox to continue"),
                              FilledButton(
                                  onPressed: () {
                                    if (isChecked2 == true) {
                                      incrementIndex();
                                    }
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 7, 7, 10),
                                    child: Text('Next'),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          )
        ]));
  }

  Widget goodStuff(double screenHeight) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          Text('YOU CONTROL YOUR INFORMATION!',
              textScaler: TextScaler.linear(2),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Color.fromARGB(255, 244, 180, 68))),
          SizedBox(height: 10),
          Text(
            "Help others get to know you better. Your responses will be visible to others. Be as thoughtful as you'd like.You can update or change your responses at any time.",
            textScaler: TextScaler.linear(1.2),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                height: screenHeight / 2.3,
                child: ListView.builder(
                    itemCount: goodStuffList.length ~/
                        2, // Adjusted for pairs of labels
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      int pairIndex = index * 2;
                      String label1 = goodStuffList[pairIndex];
                      String label2 = goodStuffList[pairIndex + 1];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            label1,
                            textAlign: TextAlign.start,
                            textScaler: TextScaler.linear(1.3),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 120, 67, 255)),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            height: screenHeight / 6,
                            child: TextField(
                              style: TextStyle(fontSize: 12),
                              maxLines: 14,
                              decoration: InputDecoration(
                                label: Text(
                                  label2,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                filled: true,
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                        ],
                      );
                    }),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FilledButton(
                    onPressed: () {
                      decrementIndex();
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 7, 7, 10),
                      child: Text('Back'),
                    )),
                isChecked2 == true
                    ? Text("")
                    : Text("Please tick the checkbox to continue"),
                FilledButton(
                    onPressed: () {
                      if (isChecked2 == true) {
                        incrementIndex();
                        sendReq();
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 7, 7, 10),
                      child: Text('Register to Blinderville'),
                    ))
              ],
            ),
          )
        ]));
  }

  Widget finishWidget() {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('CONGRATULATIONS!',
                textScaler: TextScaler.linear(2),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Color.fromARGB(255, 244, 180, 68))),
            SizedBox(height: 60),
            Text("You're all done.",
                textScaler: TextScaler.linear(1.2),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 12),
            Text("You can go see your dashboard and look around.",
                textScaler: TextScaler.linear(1.2),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 12),
            Text("Take a crack at the question of the day.",
                textScaler: TextScaler.linear(1.2),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 12),
            Text("Participate in the forum, and have fun!",
                textScaler: TextScaler.linear(1.2),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 12),
            Text("You might just find the one.",
                textScaler: TextScaler.linear(1.2),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 12),
          ],
        ));
  }
}
