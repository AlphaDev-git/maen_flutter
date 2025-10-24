import 'package:flutter/material.dart';

class TeacherCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String imagePath;
  final double rating;
  final String title;

  const TeacherCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.imagePath,
    required this.rating,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: height * 0.01),
      padding: EdgeInsets.all(width * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFB5B5B5)),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Teacher Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: width * 0.3,
              height: height * 0.13,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: width * 0.04),

          // Info Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Rating Stars
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: width * 0.032,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: List.generate(
                        5,
                            (index) => Icon(
                          Icons.star,
                          color: index < rating ? Colors.amber : Colors.grey.shade300,
                          size: width * 0.03,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: height * 0.005),



                SizedBox(height: height * 0.004),

                Text(
                  "التخصص: $specialty",
                  style: TextStyle(
                    fontSize: width * 0.037,
                    color: Colors.grey[700],
                  ),
                ),

                SizedBox(height: height * 0.004),

                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "المزيد من التفاصيل...",
                    style: TextStyle(
                      fontSize: width * 0.035,
                      color: Colors.grey[600],
                    ),
                  ),
                ),

                SizedBox(height: height * 0.01),

                Align(
                  alignment: Alignment.centerLeft,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF1E2A4A)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.005),
                      child: Text(
                        title,
                        style: TextStyle(
                          color: const Color(0xFF1E2A4A),
                          fontSize: width * 0.037,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
