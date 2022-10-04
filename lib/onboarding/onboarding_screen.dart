
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../screens/auth_screen.dart';
import 'contentmodel.dart';
import 'package:dre/onboarding/onboarding_screen.dart'show OnBoarding;
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
int currentIndex=0;
  final _controller=PageController(initialPage: 0);
bool isLastPage=false;
  @override
  void initState() {

    super.initState();
  }

@override
void dispose() {
 _controller.dispose();
  super.dispose();
}

@override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
  body: Column(children: [
    Expanded(
      child: PageView.builder(
     itemCount:contents.length ,

        controller: _controller,
        itemBuilder: (BuildContext context, int index) {
       return  buildOnBoarding(contents[index]);
        },
onPageChanged: (int index){
currentIndex=index;
isLastPage=index==2;
},
      ),
    ),

    // Container(
    //   child: TextButton(
    //     onPressed: (){_controller.jumpToPage(1);},
    //     child: Text('Next'),
    //   ),


    Container(
      child: ElevatedButton(
       onPressed: (){ if (isLastPage) {
         Navigator.of(context).pushNamed('SignIn');
      // Navigator.push(context, MaterialPageRoute(builder: (context) =>
      //     AuthScreen (authType: null,)));
    }
  else {
  _controller.nextPage(
  duration: Duration(milliseconds: 500),
  curve: Curves.easeInOut);
  }
}   ,child: Text('Get Started'),)

),



  ],),

      ),

    );

  }
  Widget buildOnBoarding(ContentBoarding boarding){
    return Container(
      child: Center(
        child: Column(
          children: [


          Center(
            child: Image.asset(boarding.image,
              fit: BoxFit.cover,
        height: 300,
            width: double.infinity,
        ),
          ),
        SizedBox(height: 70,),
        Text(boarding.title,style: TextStyle(
          fontSize: 20,
        ),),
        SizedBox(height: 100,),
    SmoothPageIndicator(controller: _controller, count:contents.length)
    ]
    ),
      )
    );

  }
}
