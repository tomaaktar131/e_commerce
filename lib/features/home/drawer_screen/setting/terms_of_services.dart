import 'package:flutter/material.dart';

class TermsOfServices extends StatelessWidget {
  const TermsOfServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Terms of Service',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            height: 1.1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1. Introduction',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Color(0xff1F2937),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Lorem ipsum dolor sit amet consectetur. Elit ac gravida augue suspendisse in scelerisque pellentesque diam elementum. Lorem quam vitae mus metus tortor turpis at. Cras accumsan pharetra odio euismod metus leo neque duis.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff4B5563),
              ),
            ),
            SizedBox(height: 16),
            Text(
              '2. User Responsibilities',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Color(0xff1F2937),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Lorem ipsum dolor sit amet consectetur. Elit ac gravida augue suspendisse in scelerisque pellentesque diam elementum. Lorem quam vitae mus metus tortor turpis at. Cras accumsan pharetra odio euismod metus leo neque duis.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff4B5563),
              ),
            ),
            SizedBox(height: 16),
            Text(
              '3. Privacy and Data Collection',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Color(0xff1F2937),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Lorem ipsum dolor sit amet consectetur. Elit ac gravida augue suspendisse in scelerisque pellentesque diam elementum. Lorem quam vitae mus metus tortor turpis at. Cras accumsan pharetra odio euismod metus leo neque duis.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff4B5563),
              ),
            ),
            SizedBox(height: 16),
            Text(
              '4. User Content',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Color(0xff1F2937),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Lorem ipsum dolor sit amet consectetur. Elit ac gravida augue suspendisse in scelerisque pellentesque diam elementum. Lorem quam vitae mus metus tortor turpis at. Cras accumsan pharetra odio euismod metus leo neque duis.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff4B5563),
              ),
            ),
            SizedBox(height: 16),
            Text(
              '5. Subscription and Payment',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Color(0xff1F2937),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Lorem ipsum dolor sit amet consectetur. Elit ac gravida augue suspendisse in scelerisque pellentesque diam elementum. Lorem quam vitae mus metus tortor turpis at. Cras accumsan pharetra odio euismod metus leo neque duis.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff4B5563),
              ),
            ),
            SizedBox(height: 16),

          ],
        ),
      ),
    );
  }
}
