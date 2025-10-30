import 'package:e_commerce_project/core/custom_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_page_controller.dart';
import '../../core/theme/app_colors.dart';
import '../../routes/route.dart';

class AddReviewPage extends StatefulWidget {
  const AddReviewPage({super.key});

  @override
  State<AddReviewPage> createState() => _AddReviewPageState();
}

final _fromKey = GlobalKey<FormState>();

class _AddReviewPageState extends State<AddReviewPage> {
  final _controller =Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    final productId= Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Review",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
            color: Color(0xff1D1E20),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  Name Field
              Form(
                key: _fromKey,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            height: 1.1,
                            color: Color(0xff1D1E20),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _controller.nameController,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            height: 1.1,
                            color: AppColor.grayColor,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Type your name',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                            filled: true,
                            fillColor: Color(0xFFF5F6FA),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) => value == null || value.isEmpty
                              ? 'please  enter your Name'
                              : null,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'How was your experience ?',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            height: 1.1,
                            color: Color(0xff1D1E20),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          maxLines: 12,
                          controller: _controller.experienceController,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            height: 1.1,
                            color: AppColor.grayColor,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Describe your experience?',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                            filled: true,
                            fillColor: Color(0xFFF5F6FA),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) => value == null || value.isEmpty
                              ? 'please Describe your experience'
                              : null,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
        
              SizedBox(height: 20),
              // ✅ Rating Slider
              Text("Star",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Color(0xff1D1E20)),),
              SizedBox(height: 5,),
              Row(
                children: [
                  Text(
                    '0.0',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                      color: Color(0xff1D1E20),
                    ),
                  ),
                  Expanded(
                    child: SliderTheme(
                      data: SliderThemeData(
                        thumbColor: AppColor.primaryColor,
                        activeTrackColor: Color(0xffF5F6FA),
                        inactiveTrackColor: Color(0xffF5F6FA),
        
                        trackHeight: 10,
                      ),
                      child: Obx(()=> Slider(
        
        
        
                          value: _controller.rating.value,
                          min: 0.0,
                          max: 5.0,
                          divisions: 50,
                          label: _controller.rating.value.toStringAsFixed(1),
                          onChanged: (value) {
        
                              _controller.rating.value = value;
        
                          },
                        ),
                      ),
                    ),
                  ),
                  Text('5.0',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                      color: Color(0xff1D1E20),
                    ),),
                ],
              ),
              SizedBox(height: 210),
              //  Submit Button
            CustomElevationButton(label: 'Submit Review', onPress: () {
              if(_fromKey.currentState!.validate()){
                _controller.addReview(_controller.nameController.text, _controller.experienceController.text, _controller.rating.value, productId);
              }
            },),
            ],
          ),
        ),
      ),
    );
  }
}
