import 'package:flutter/material.dart';

class AddNewButton extends StatelessWidget {
  const AddNewButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(24.0),
            ),
            color: const Color(0xFF535353).withOpacity(0.6),
          ),
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_circle_outline,
                  color: Colors.white,
                  size: 24,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Add new',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
