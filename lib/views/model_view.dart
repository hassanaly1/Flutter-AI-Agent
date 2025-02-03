import 'package:flutter/material.dart';

class ModelView extends StatelessWidget {
  const ModelView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Configuration',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
              ),
              Divider(color: Colors.grey.shade300),
              SizedBox(height: 12.0),
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
                title: Text(
                  'Summary Max Tokens',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  'The maximum length of the generated summary (in tokens).',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
                ),
                // trailing: Container(
                //   decoration: BoxDecoration(
                //     color: Colors.grey.shade200,
                //     borderRadius: BorderRadius.circular(12.0),
                //     border: Border.all(color: Colors.black26),
                //   ),
                // ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
