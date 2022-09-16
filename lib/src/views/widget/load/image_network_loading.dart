
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:legal_chat/src/views/widget/widget.dart';

class ImageNetworkLoading extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget? placeholder;
  final Widget? errorWidget;

  const ImageNetworkLoading(this.imageUrl,
      {Key? key,
        this.fit,
        this.width,
        this.height,
        this.placeholder,
        this.errorWidget,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      height: height,
      width: width,
      placeholder: (context, url){
        return placeholder ?? SizedBox(
          height: 20,
          width: 20,
          child: Stack(
            children: [
              ShimmerLoading(
                isLoading: true,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8.h),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      errorWidget: (context, url, error){
        return errorWidget ?? Image.asset("assets/images/image_holder.png");
      },
    );
  }
}
