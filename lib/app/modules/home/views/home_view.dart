import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import 'package:get/get.dart';
import 'package:medical_consultation/app/data/doctor_data.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[150],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          currentIndex: 0,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          unselectedIconTheme: const IconThemeData(
            color: Colors.grey,
          ),
          selectedIconTheme: const IconThemeData(
            color: Colors.blue,
          ),
          items: [
            const BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home,
              ),
            ),
            const BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.content_paste),
            ),
            BottomNavigationBarItem(
              icon: Card(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 6,
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.sms),
            ),
            const BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 12.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello ${controller.loggedInUserData.userName},',
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'How do you feel today?',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _profileImage(
                      url: controller.loggedInUserData.profileImageURL,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search here...',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    prefixIcon: const Icon(
                      Icons.search_sharp,
                      color: Color(0xFF444B57),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _optionsButton(
                      name: 'Hospital',
                      icon: 'assets/images/hospital.png',
                    ),
                    // const SizedBox(
                    //   width: 15,
                    // ),
                    _optionsButton(
                      name: 'Consultant',
                      icon: 'assets/images/chat.png',
                    ),
                    // const SizedBox(
                    //   width: 15,
                    // ),
                    _optionsButton(
                      name: 'Recipe',
                      icon: 'assets/images/schedule.png',
                    ),
                    // const SizedBox(
                    //   width: 15,
                    // ),
                    _optionsButton(
                      name: 'Appointment',
                      icon: 'assets/images/dropper.png',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                _appointmentCard(),
                const SizedBox(
                  height: 60,
                ),
                _topDoctors(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _appointmentCard() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Appointment Today',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'See all',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF508FE5),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 170,
          child: CardSwiper(
            cardsCount: 5,
            isVerticalSwipingEnabled: true,
            isHorizontalSwipingEnabled: false,
            direction: CardSwiperDirection.bottom,
            numberOfCardsDisplayed: 2,
            padding: EdgeInsets.zero,
            // backCardOffset: Offset(0, 10),
            // scale: 0.7,
            // threshold: 4,
            cardBuilder: (context, index) => Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFF2B80FC),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _profileImage(
                        url: controller.loggedInUserData.profileImageURL,
                      ),
                      _messageIcon(),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _h1InCard('dr. Ino Yamanaka'),
                      _h1InCard('10.30 AM'),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _h2InCard('Dental Specialist'),
                      _h2InCard('01.10.2022'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _topDoctors() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Top Doctor\'s for you',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'See all',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF508FE5),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.separated(
          // physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) => _doctorItem(
            controller.listOfDoctors.elementAt(index),
          ),
          itemCount: controller.listOfDoctors.length,
          separatorBuilder: (context, index) => const SizedBox(
            height: 8,
          ),
        ),
      ],
    );
  }

  Widget _doctorItem(DoctorData doctorData) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _profileImage(
            borderRadius: 14,
            height: 80,
            url: doctorData.profileImageURL,
          ),
          const SizedBox(
            width: 10,
          ),
          _drDetails(
            docData: doctorData,
          ),
        ],
      ),
    );
  }

  Widget _profileImage({
    double borderRadius = 30,
    double height = 60,
    required String url,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        height: height,
        imageUrl: url,
      ),
    );
  }

  Widget _messageIcon() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(0xFF5B9CFF),
      ),
      child: Icon(
        Icons.chat_bubble,
        color: Colors.white,
      ),
    );
  }

  Widget _optionsButton({
    required String name,
    required String icon,
  }) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 60,
            // width: 40,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Image.asset(icon),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: const TextStyle(
              color: Color(0xFF83878F),
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }

  Widget _h1InCard(String content) {
    return Text(
      content,
      style: const TextStyle(
        fontSize: 22,
        color: Colors.white,
      ),
    );
  }

  Widget _h2InCard(String content) {
    return Text(
      content,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.white60,
      ),
    );
  }

  Widget _drDetails({
    required DoctorData docData,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Text(
          docData.description,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          docData.docName,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.yellow,
              size: 16,
            ),
            const SizedBox(
              width: 5,
            ),
            Text('${docData.rating}'),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 5,
              width: 5,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text('${docData.rating} Reviews'),
          ],
        ),
      ],
    );
  }
}
