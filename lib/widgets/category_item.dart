import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  CategoryItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140, 
      height: 60, 
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24, color: Color(0xFF0C1B33)), 
          SizedBox(width: 8), 
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14, 
              color: Color(0xFF0C1B33),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
