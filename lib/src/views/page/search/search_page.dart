import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: "Search"
            ),
          ),
          elevation: 1,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
              child: Text("Suggested"),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
                        child: Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              margin: EdgeInsets.only(right: 10.0.w),
                              child: ClipOval(
                                child: Image.network("https://reqres.in/img/faces/7-image.jpg"),
                              ),
                            ),
                            Text("Trung Đức")
                          ],
                        ),
                      );
                    }
                )
            )
          ],
        )


    );
  }
}
