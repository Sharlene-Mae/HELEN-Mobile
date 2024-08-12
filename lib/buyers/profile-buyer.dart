// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class ProfilePageBuyer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20.0),
          child: Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 100.0,
                              backgroundColor: Colors.grey,
                              child: ClipOval(
                                child: Image.asset(
                                  'images/buyers/sample-buyer-pic.jpg', // Updated image path
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              '@jstn_bala',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20.0,
                                color: Color(0xFFCA771A),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Institutional Buyer',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16.0,
                                color: Color(0xFF606060),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Personal Information',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20.0,
                        color: Color(0xFFCA771A),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.edit, color: Color(0xFFCA771A)),
                      onPressed: () {
                        // Add your edit action here
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Text(
                  'Full Name:',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14.0,
                    color: Color(0xFFCA771A),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Justin Bala',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14.0,
                    color: Color(0xFF606060),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Address:',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14.0,
                    color: Color(0xFFCA771A),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '123 Rizal Street, Barangay 5, Lucban, Quezon, Philippines 4328',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14.0,
                    color: Color(0xFF606060),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Contact No:',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14.0,
                    color: Color(0xFFCA771A),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '09278557033',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14.0,
                    color: Color(0xFF606060),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
