import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:demoapp/constants/Color_Constants.dart';
import 'package:demoapp/constants/dimension_constant.dart';
import 'package:demoapp/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ImageView extends StatelessWidget {
  final String? path;
  final double? width;
  final double? height;
  final File? file;
  final bool? circleCrop;
  final BoxFit? fit;
  final Color? color;
  final double? radius;

  const ImageView({
    Key? key,
    this.path,
    this.width,
    this.height,
    this.file,
    this.circleCrop = false,
    this.fit,
    this.radius = 20.0,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;
    if (path == "") {
      imageWidget = Image.asset(
        ImageConstants.backicon,
        width: width,
        height: height,
        color: ColorConstant.buttonbgcolor,
        fit: BoxFit.contain,
      );
    } else if (path?.startsWith('http') ?? false) {
      imageWidget = CachedNetworkImage(
        fit: fit,
        height: height,
        width: width,
        imageUrl: path!,
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      );
    } else if (path?.startsWith('assets/images/') ?? false) {
      imageWidget = path!.contains(".svg")
          ? SvgPicture.asset(
        path!,
        width: width,
        height: height,
        
      )
          : Image.asset(
        path!,
        width: width,
        height: height,
        fit: fit,
        color: color,
      );
    } else if (file != null) {
      imageWidget = Image.file(
        file!,
        width: width,
        height: height,
        fit: fit,
      );
    } else {
      imageWidget = Image.file(
        File(path.toString()),
        width: width,
        height: height,
        fit: fit,
      );
    }
    return circleCrop!
    ? ClipRRect(borderRadius: BorderRadius.circular(radius ?? DimensionConstants.d100.r), child: imageWidget)
    : imageWidget;
  //   return circleCrop!
  //       ? CircleAvatar(
  //         backgroundColor: Colors.white,
  //         radius: radius, child: ClipOval(child: imageWidget))
  //       : imageWidget;
   }
}